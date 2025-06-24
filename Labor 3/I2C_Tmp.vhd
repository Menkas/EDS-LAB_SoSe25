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
Signal i2c_bitcnt  : integer range 0 to twobytes+1 := 0; 
Signal next_bitcnt  : integer range 0 to twobytes+1 := 1; 
Signal index : integer := 0;
signal stage : integer range 0 to 1 := 0; -- 2

Signal i2c_clk : std_logic := 'X';
signal i2c_clkdiv : std_logic_vector(5 downto 0);
Signal i2c_seq: integer range 0 to 2;

SIGNAL DEMO_12: std_logic;
Signal test_ACK : std_logic := '0';
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




procedure fsm_step(
	signal Zustand     	: inout I2C_States;
	signal i2c_sdat    	: inout std_logic;
	signal i2c_sclk    	: out std_logic;
	signal i2c_seq     	: inout integer range 0 to 2;
	signal i2c_bitcnt  	: inout integer range 0 to twobytes+1;
	Signal next_bitcnt  	: inout integer range 0 to twobytes+1;
	signal i2c_wordcnt 	: inout integer range 0 to arraysize+1;
	signal index		 	: inout integer;
	signal stage 			: inout integer range 0 to 1;
	signal test_ACK    	: in std_logic
) is
begin
	case Zustand is
	
		when IDLE => 
			Zustand <= START;			
						
		when START => 	
			case I2c_seq is
				when 0 => i2c_sdat <= '0';
					i2c_seq <= i2c_seq + 1;
				when 1 => i2c_sclk <= '0';
					i2c_seq <= i2c_seq + 1;
				when 2 => Zustand <= SEND_ADDRESS;
					i2c_seq <= 0;
				when others => Zustand <= START;
			end case;
			
			
		when SEND_ADDRESS => 	
				case i2c_bitcnt is
					when 7 => 
						i2c_sdat <= '0'; -- R/W Bit
						i2c_bitcnt <= i2c_bitcnt + 1;
						Zustand <= SEND_ADDRESS;
					when 8 => 
						i2c_sdat <= test_ACK;--'Z';
						i2c_bitcnt <= 0;
						stage <= 0;
						Zustand <= ACK;
					when others => i2c_sdat <= i2c_adr((arraysize-1) - i2c_bitcnt);
						i2c_bitcnt <= i2c_bitcnt + 1;
						Zustand <= SEND_ADDRESS;
				end case;
				
			when WAIT_FOR_NEXT_STATE =>
				CASE i2c_wordcnt is
					when arraysize+1 => Zustand <= STOP;
						i2c_wordcnt <= 0;
					when others => 
						Zustand <= SENDDATA;
						IF(i2c_bitcnt = 0) THEN
							i2c_sdat <= i2c_data(i2c_wordcnt)(15);
							i2c_bitcnt <= i2c_bitcnt + 1;
							index <= index - 1;
						ELSIF(i2c_bitcnt = 8) THEN
							i2c_sdat <= i2c_data(i2c_wordcnt)(7);
							i2c_bitcnt <= i2c_bitcnt + 1;
							index <= index - 1;
						END IF;
						
				END CASE;
				
			when SENDDATA => 
				case i2c_bitcnt is
					when 0 => 
						i2c_sdat <= i2c_data(i2c_wordcnt)(15);
						i2c_bitcnt <= i2c_bitcnt + 1;
					when 1 => 
						i2c_sdat <= i2c_data(i2c_wordcnt)(14);
						i2c_bitcnt <= i2c_bitcnt + 1;
					when 2 => 
						i2c_sdat <= i2c_data(i2c_wordcnt)(13);
						i2c_bitcnt <= i2c_bitcnt + 1;
					when 3 => 
						i2c_sdat <= i2c_data(i2c_wordcnt)(12);
						i2c_bitcnt <= i2c_bitcnt + 1;
					when 4 =>
						i2c_sdat <= i2c_data(i2c_wordcnt)(11);
						i2c_bitcnt <= i2c_bitcnt + 1;
					when 5 => 
						i2c_sdat <= i2c_data(i2c_wordcnt)(10);
						i2c_bitcnt <= i2c_bitcnt + 1;
					when 6 =>
						i2c_sdat <= i2c_data(i2c_wordcnt)(9);
						i2c_bitcnt <= i2c_bitcnt + 1;
					when 7 => 
						IF stage = 0 then
							i2c_sdat <= i2c_data(i2c_wordcnt)(8);
							stage <= 1;
						ELSE
							i2c_sdat <= test_ACK;
							ZUSTAND <= ACK;
							i2c_bitcnt <= i2c_bitcnt + 1;
						END IF;
					when 8 => 
						i2c_sdat <= i2c_data(i2c_wordcnt)(7);
						i2c_bitcnt <= i2c_bitcnt + 1;
					when 9 =>
						i2c_sdat <= i2c_data(i2c_wordcnt)(6);
						i2c_bitcnt <= i2c_bitcnt + 1;
					when 10 => 
						i2c_sdat <= i2c_data(i2c_wordcnt)(5);
						i2c_bitcnt <= i2c_bitcnt + 1;
					when 11 =>
						i2c_sdat <= i2c_data(i2c_wordcnt)(4);
						i2c_bitcnt <= i2c_bitcnt + 1;
					when 12 =>
						i2c_sdat <= i2c_data(i2c_wordcnt)(3);
						i2c_bitcnt <= i2c_bitcnt + 1;
					when 13 =>
						i2c_sdat <= i2c_data(i2c_wordcnt)(2);
						i2c_bitcnt <= i2c_bitcnt + 1;
					when 14 =>
						i2c_sdat <= i2c_data(i2c_wordcnt)(1);
						i2c_bitcnt <= i2c_bitcnt + 1;
					when 15 =>
						IF stage = 0 then
							i2c_sdat <= i2c_data(i2c_wordcnt)(0);
							stage <= 1;
						ELSE
							i2c_bitcnt <= 0;
							i2c_wordcnt <= i2c_wordcnt +1;
							i2c_sdat <= test_ACK;
							ZUSTAND <= ACK;
						END IF;
					when others =>	Zustand <= IDLE;	
				END CASE;
				

				
			when ACK => 
				case i2c_sdat is
					when '0' => ZUSTAND <= WAIT_FOR_NEXT_STATE;
					when others => ZUSTAND <= IDLE;
				end case;
				i2c_sdat <= 'Z';
				stage <= 0;
			

			when STOP => Zustand <= IDLE;
				case I2c_seq is
					when 0 => i2c_sdat <= '1';
						i2c_seq <= i2c_seq + 1;
					when 1 => i2c_sclk <= '1';
						i2c_seq <= i2c_seq + 1;
					when 2 => Zustand <= IDLE;
						i2c_seq <= 0;
					when others => Zustand <= IDLE;
				end case;
		
		when others => Zustand <= IDLE; 
							i2c_sdat <= 'Z'; 
							i2c_sclk <= 'Z';
	END CASE;
end procedure;

procedure INK_I2C_SEQ_WS
(
	signal Zustand     	: inout I2C_States;
	signal i2c_sdat    	: inout std_logic;
	signal i2c_sclk    	: out std_logic;
	signal i2c_seq     	: inout integer range 0 to 2;
	signal i2c_bitcnt  	: inout integer range 0 to twobytes+1;
	Signal next_bitcnt  	: inout integer range 0 to twobytes+1;
	signal i2c_wordcnt 	: inout integer range 0 to arraysize+1;
	signal index		 	: inout integer;
	signal stage 			: inout integer range 0 to 1;
	signal test_ACK    	: in std_logic
) IS
BEGIN
	case i2c_seq is
		WHEN 0 => i2c_seq <= 1;
			i2c_sclk <= '0';
		WHEN 1 => i2c_seq <= 2;
			fsm_step(Zustand, i2c_sdat, i2c_sclk, i2c_seq, i2c_bitcnt, next_bitcnt, i2c_wordcnt, index, stage, test_ACK);
		WHEN 2 => i2c_seq <= 0;
			i2c_sclk <= '0';
	END CASE;
END PROCEDURE;


BEGIN
	

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
	PROCESS(reset, i2c_clk)
	BEGIN	
		if (reset = '1') then	
			i2c_bitcnt <= 0;
			i2c_wordcnt <= 0;
			index <= 15;
			i2c_sclk <= 'Z';
			i2c_sdat <= 'Z';
			Zustand <= IDLE;
			i2c_seq <= 0;
		elsif (i2c_clk'event and i2c_clk='1') then 
	-- Default values 
			IF (Zustand = WAIT_FOR_NEXT_STATE) THEN
					INK_I2C_SEQ_WS(Zustand, i2c_sdat, i2c_sclk, i2c_seq, i2c_bitcnt, next_bitcnt, i2c_wordcnt, index, stage, test_ACK);
					i2c_sclk <= '0';	
			ELSIF ((Zustand /= START) AND (ZUSTAND /= IDLE) AND (ZUSTAND /= STOP)) THEN
				case I2c_seq is
					when 0 => --i2c_sdat <= '1';
						i2c_sclk <= '0';
						i2c_seq <= i2c_seq + 1;
					when 1 => 
						i2c_sclk <= '0';
						fsm_step(Zustand, i2c_sdat, i2c_sclk, i2c_seq, i2c_bitcnt, next_bitcnt, i2c_wordcnt, index, stage, test_ACK);
						i2c_seq <= i2c_seq + 1;
					when 2 => 
						i2c_sclk <= '1';
						i2C_seq <= 0;
					when others => Zustand <= IDLE;
				end case;			
				
			ELSE
				fsm_step(Zustand, i2c_sdat, i2c_sclk, i2c_seq, i2c_bitcnt, next_bitcnt, i2c_wordcnt, index, stage, test_ACK);
			END IF;
		end if;
	end Process;
END behavioral;