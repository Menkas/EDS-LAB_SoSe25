LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity wm8731_lab3_test is
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

        -- Button inputs (active-low)
        btn_c7 : in std_logic;
        btn_e6 : in std_logic;
        btn_g6 : in std_logic;
        btn_c6 : in std_logic
    );
end wm8731_lab3_test;

architecture behavioral of wm8731_lab3_test is

    COMPONENT I2C_TMP IS
        PORT(
            clk, reset: IN STD_LOGIC;
            i2c_sdat : inout std_logic;
            i2c_sclk : out std_logic
        );
    END COMPONENT;

    signal s_lrswitch : integer range 0 to 383 := 0;
    signal s_din : std_logic_vector(31 downto 0) := (others => '0');

    -- Note selection
    signal selected_note : std_logic_vector(2 downto 0);
    signal square_selected : std_logic;

    -- Square wave generators
    signal square_c7, square_e6, square_g6, square_c6 : std_logic := '0';
    signal cnt_c7, cnt_e6, cnt_g6, cnt_c6 : integer := 0;

    -- Constants for square wave generation at 48 kHz sample rate
    constant C7_HALF_PERIOD : integer := 48000 / (2093); -- ~11
    constant E6_HALF_PERIOD : integer := 48000 / (1319); -- ~18
    constant G6_HALF_PERIOD : integer := 48000 / (1568); -- ~15
    constant C6_HALF_PERIOD : integer := 48000 / (1047); -- ~23

    signal left_sample, right_sample : std_logic_vector(15 downto 0) := (others => '0');

begin

    ---------------------------------------------------------------------------
    -- Select note based on active-low buttons
    ---------------------------------------------------------------------------
    process(btn_c7, btn_e6, btn_g6, btn_c6)
    begin
        if btn_c7 = '0' then
            selected_note <= "001";
        elsif btn_e6 = '0' then
            selected_note <= "010";
        elsif btn_g6 = '0' then
            selected_note <= "011";
        elsif btn_c6 = '0' then
            selected_note <= "100";
        else
            selected_note <= "000"; -- Default note
        end if;
    end process;

    ---------------------------------------------------------------------------
    -- Generate square waves
    ---------------------------------------------------------------------------
    process(clk)
    begin
        if rising_edge(clk) then
            if cnt_c7 >= C7_HALF_PERIOD then
                cnt_c7 <= 0;
                square_c7 <= not square_c7;
            else
                cnt_c7 <= cnt_c7 + 1;
            end if;

            if cnt_e6 >= E6_HALF_PERIOD then
                cnt_e6 <= 0;
                square_e6 <= not square_e6;
            else
                cnt_e6 <= cnt_e6 + 1;
            end if;

            if cnt_g6 >= G6_HALF_PERIOD then
                cnt_g6 <= 0;
                square_g6 <= not square_g6;
            else
                cnt_g6 <= cnt_g6 + 1;
            end if;

            if cnt_c6 >= C6_HALF_PERIOD then
                cnt_c6 <= 0;
                square_c6 <= not square_c6;
            else
                cnt_c6 <= cnt_c6 + 1;
            end if;
        end if;
    end process;

    ---------------------------------------------------------------------------
    -- Select square wave
    ---------------------------------------------------------------------------
    process(selected_note, square_c7, square_e6, square_g6, square_c6)
    begin
        case selected_note is
            when "001" => square_selected <= square_c7;
            when "010" => square_selected <= square_e6;
            when "011" => square_selected <= square_g6;
            when "100" => square_selected <= square_c6;
            when others => square_selected <= '0';
        end case;
    end process;

    ---------------------------------------------------------------------------
    -- Convert to 16-bit audio samples
    ---------------------------------------------------------------------------
    process(square_selected)
    begin
        if square_selected = '1' then
            left_sample  <= x"7FFF";
            right_sample <= x"7FFF";
        else
            left_sample  <= x"8000";
            right_sample <= x"8000";
        end if;
    end process;

    ---------------------------------------------------------------------------
    -- WM8731 Audio Interface Output
    ---------------------------------------------------------------------------
    process(reset, clk)
    begin
        if (reset = '1') then
            s_lrswitch   <= 0;
            aud_daclrck  <= '0';
            s_din        <= (others => '0');
        elsif rising_edge(clk) then
            if s_lrswitch = 383 then  -- 18.432 MHz / 384 = 48 kHz
                aud_daclrck <= '1'; -- Start of new frame
                s_din <= left_sample & right_sample;
                s_lrswitch <= 0;
            else
                aud_daclrck <= '0';
                s_din <= s_din(30 downto 0) & '0';
                s_lrswitch <= s_lrswitch + 1;
            end if;
        end if;
    end process;

    -- Codec clocking
    aud_xck     <= clk;
    aud_bclk    <= not clk;
    aud_dacdat  <= s_din(31);

    ---------------------------------------------------------------------------
    -- I2C Codec Initialization
    ---------------------------------------------------------------------------
    init_I2C: I2C_TMP
        port map(clk, reset, i2c_sdat, i2c_sclk);

end behavioral;
