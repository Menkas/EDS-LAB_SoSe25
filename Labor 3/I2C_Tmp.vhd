LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY I2C_Tmp IS
PORT(
----------------------------------------
-- In
		clk, reset : IN STD_LOGIC;
--		din : IN STD_LOGIC_VECTOR(31 downto 0);
----------------------------------------
-- Out
		i2c_sdat : inout std_logic; -- I2C serieller Datenkanal	
		i2c_sclk : out std_logic -- I2C serielle Clock
);
END I2C_Tmp;

architecture behavioral of I2C_TMP is

constant i2c_adr : std_logic_vector(6 downto 0) := "0011010";  -- I2C Device Adresse vom WM8731
constant arraysize : integer := 7;
constant twobytes : integer := 15; -- 0 - 15

type I2C_States is (
	IDLE,
	START,
	SEND_ADDRESS,
	ACK,
	SENDDATA,
	WAIT_FOR_NEXT_STATE,
	STOP
);
type rom is array (0 to arraysize) of std_logic_vector(15 downto 0);


Signal Zustand, Folgezustand: I2C_States;
Signal i2c_wordcnt : integer range 0 to arraysize+1 := 0; -- Change if possible to arraysize !!!!! 
Signal i2c_bitcnt  : integer range 0 to twobytes := 0; 

Signal next_bitcnt : integer range 0 to twobytes+1 := 0;
Signal next_wordcnt : integer range 0 to arraysize+1 := 0;
Signal next_state : I2C_States := IDLE;
Signal test_ACK : std_logic := '0';

Signal i2c_clk : std_logic := 'X';
signal i2c_clkdiv : std_logic_vector(5 downto 0);
-- create a signal for the extra count

-- I2C Daten: 7 Bit Registeradresse plus 9 Datenbits 
constant i2c_data : rom := (
  "0001111000000000", -- R15 Reset Chip
  "0000100000010000", -- R4  DAC Sel
  "0000101000000000", -- R5  DAC Mute off
  "0000110001100111", -- R6  DAC on, out on
  "0000111000000011", -- R7  Slave, DSP Modus, 16 Bit,
  "0001000000000010", -- R8  Normal Modus, 384fs (18,432 Mhz, f_s = 48 kHz)
  "0001001000000000", -- R9  Deaktiviere Audio 
  "0001001000000001"  -- R9  Aktiviere Audio
);


--COMPONENT D_FF
--PORT(
--		clk, reset, d	: IN STD_LOGIC;
--		Q					: OUT STD_LOGIC
--);
--END COMPONENT;

BEGIN
	
--	Clock: PROCESS(clk,reset)
--	BEGIN
--		if reset = '1' then
--			Zustand <= IDLE;
--			i2c_bitcnt <= 0;
--			i2c_wordcnt <= 0;
--			i2c_clk <= '0';
--		elsif(clk'event AND clk = '1') then
--			Zustand <= Folgezustand;
--			i2c_bitcnt <= next_bitcnt;
--			i2c_wordcnt <= next_wordcnt;
--		end if;
--	end PROCESS Clock;

	-- WM8731 I2C Schnittstelle 
	process(reset, clk)
	begin
		if (reset = '1') then
			i2c_clk <= '0';
			i2c_clkdiv  <= (others=>'0');
		elsif (clk'event and clk='1') then 
			i2c_clkdiv <= std_logic_vector(unsigned(i2c_clkdiv)+1);
			if i2c_clkdiv = "010010" then		-- 18 MHz/36 = 500 kHz, Umschalten bei halber Periode
				i2c_clk <= not (i2c_clk);
				i2c_clkdiv <= "000000";
			end if;
		end if;
	end process;
	
	-- I2C State Machine
	PROCESS(reset, i2c_clk, i2c_bitcnt, i2c_wordcnt)
	BEGIN	
		if (reset = '1') then
			i2c_sdat <= '0';	
			i2c_sclk <= '0';
			i2c_bitcnt <= 0;
			i2c_wordcnt <= 0;	
			i2c_sdat <= 'Z';
			Zustand <= IDLE;
			next_bitcnt <= i2c_bitcnt;
			next_wordcnt <= i2c_wordcnt;
		elsif (i2c_clk'event and i2c_clk='1') then 
	-- Default values 
			i2c_bitcnt <= next_bitcnt;
			i2c_wordcnt <= next_wordcnt;
			
			case Zustand is
			when IDLE => 
							i2c_sdat <= '1';
							i2c_sclk <= '1';
							Folgezustand <= START;			
								
			when START => 	
								i2c_sdat <= '0';
								i2c_sclk <= '1';
								Folgezustand <= SEND_ADDRESS;
			when SEND_ADDRESS => 	
					case i2c_bitcnt is
						when 7 => i2c_sdat <= '0'; -- R/W Bit
												 next_bitcnt <= next_bitcnt + 1;
												 Folgezustand <= SEND_ADDRESS;
						when 8 => i2c_sdat <= test_ACK;--'Z';
												 Folgezustand <= ACK;
												 next_bitcnt <= 0;
						when others => i2c_sdat <= i2c_adr((arraysize-1) - i2c_bitcnt);
														next_bitcnt <= next_bitcnt + 1;
														Folgezustand <= SEND_ADDRESS;
				end case;
				i2c_sclk <= '0';		
				when SENDDATA => 
					case i2c_bitcnt is
						when 15 => next_wordcnt <= next_wordcnt + 1;
									-- i2c_sdat <= 'Z';
									i2c_sdat <= test_ACK;
									Folgezustand <= ACK;
									next_bitcnt <= 0;
						when 7 => next_wordcnt <= next_wordcnt + 1;
									-- i2c_sdat <= 'Z';
									i2c_sdat <= test_ACK;
									Folgezustand <= ACK;
									next_bitcnt <= next_bitcnt - 1;
						when others => i2c_sdat <= i2c_data(i2c_wordcnt)(15 - next_bitcnt);
											Folgezustand <= SENDDATA;
											next_bitcnt <= next_bitcnt + 1;
					end case;

					
					
				when ACK => 
					case i2c_sdat is
						when '0' => FOLGEZUSTAND <= WAIT_FOR_NEXT_STATE;
						when others => FOLGEZUSTAND <= IDLE;
					end case;
					
				when WAIT_FOR_NEXT_STATE => 
					
					CASE i2c_wordcnt is
						when arraysize => Folgezustand <= STOP;
												next_wordcnt <= 0;
						when others => 
											Folgezustand <= SENDDATA;
					END CASE;
					i2c_sdat <= 'Z';
					i2c_sclk <= '0';
	--				IF i2c_wordcnt < arraysize then
	--					Folgezustand <= SENDDATA;
	--					i2c_sdat <= 'Z';
	--				else 
	--					Folgezustand <= STOP;
	--					next_wordcnt <= 0;
	--					i2c_sdat <= 'Z';
	--				END IF;
					
				when STOP => Folgezustand <= IDLE;
					i2c_sdat <= '1';
					i2c_sclk <= '1';
			
			when others => Folgezustand <= IDLE; 
								i2c_sdat <= 'Z'; 
								i2c_sclk <= 'Z';
			END CASE;	
	end if;	
	Zustand <= Folgezustand;
	end Process;
END behavioral;