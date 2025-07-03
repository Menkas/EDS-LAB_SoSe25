LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity wm8731_DDS is
    port (
        clk, reset, EN : in std_logic;
        din : in std_logic_vector(31 downto 0);
        i2c_sdat : inout std_logic;
        i2c_sclk : out std_logic;
        LED : out std_logic;
        aud_xck : out std_logic;
        aud_bclk : out std_logic;
        aud_dacdat : out std_logic;
        aud_daclrck : out std_logic;

        -- Note buttons (unused if DDS is used)
        btn_c7 : in std_logic;
        btn_e6 : in std_logic;
        btn_g6 : in std_logic;
        btn_c6 : in std_logic
    );
end wm8731_DDS;

architecture behavioral of wm8731_DDS is

    --------------------------------------------------------------------
    -- I2C Initialization component
    --------------------------------------------------------------------
    COMPONENT I2C_TMP IS
        PORT(
            clk, reset, EN : IN STD_LOGIC;
            LED : out std_logic;
            i2c_sdat : inout std_logic;
            i2c_sclk : out std_logic
        );
    END COMPONENT;

    --------------------------------------------------------------------
    -- DDS Component
    --------------------------------------------------------------------
    COMPONENT dds_gen_yt IS
        GENERIC (
            addr_width : integer := 8;
            data_width : integer := 16
        );
  PORT (
    clk, reset : in std_logic;
    data_a     : out std_logic_vector(data_width-1 downto 0)
  );
    END COMPONENT;

    -- DDS output
    signal dds_out_a, dds_out_b : std_logic_vector(15 downto 0);

    -- Audio sample data
    signal left_sample, right_sample : std_logic_vector(15 downto 0) := (others => '0');

    -- Codec I2S control
    signal s_lrswitch : integer range 0 to 383 := 0;
    signal s_din : std_logic_vector(31 downto 0) := (others => '0');

begin

    --------------------------------------------------------------------
    -- DDS Instantiation
    --------------------------------------------------------------------
    dds_inst : dds_gen_yt
        port map (
            clk     => clk,
            reset   => reset,
            data_a  => dds_out_a
        );

    --------------------------------------------------------------------
    -- Assign DDS output to audio samples
    --------------------------------------------------------------------
    left_sample  <= dds_out_a;
    right_sample <= dds_out_b;

    --------------------------------------------------------------------
    -- WM8731 Audio Interface Output (I2S-style bitstream)
    --------------------------------------------------------------------
    process(reset, clk)
    begin
        if (reset = '1') then
            s_lrswitch   <= 0;
            aud_daclrck  <= '0';
            s_din        <= (others => '0');
        elsif rising_edge(clk) then
            if s_lrswitch = 383 then  -- 48kHz sample rate
                aud_daclrck <= '1'; -- Frame sync
                s_din <= left_sample & right_sample;
                s_lrswitch <= 0;
            else
                aud_daclrck <= '0';
                s_din <= s_din(30 downto 0) & '0';
                s_lrswitch <= s_lrswitch + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------
    -- Codec Clocking
    --------------------------------------------------------------------
    aud_xck     <= clk;
    aud_bclk    <= not clk;
    aud_dacdat  <= s_din(31);

    --------------------------------------------------------------------
    -- I2C Codec Initialization
    --------------------------------------------------------------------
    init_I2C: I2C_TMP
        port map(clk, reset, EN, LED, i2c_sdat, i2c_sclk);

end behavioral;
