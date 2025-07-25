	library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all; 

	entity lab3_wm8731 is
	port (clk, reset : in std_logic; -- Takteingang (entsprechend 18,432 MHz fuer WM8731)
		  din : in std_logic_vector(31 downto 0); -- Audiodaten: 16 Bit linker Kanal + 16 Bit rechter Kanal
		  i2c_sdat : out std_logic; -- I2C serieller Datenkanal	
		  i2c_sclk : out std_logic; -- I2C serielle Clock
		  aud_xck : out std_logic; -- WM8731 Referenztakt (siehe Register 8 Programmierung)
		  aud_bclk : out std_logic; -- Audio Bit Clock
		  aud_dacdat : out std_logic; -- DAC Daten
		  aud_daclrck : out std_logic -- Links / Rechts
	);
	end lab3_wm8731;

	architecture behavioral of lab3_wm8731 is

	constant i2c_adr : std_logic_vector(6 downto 0) := "0011010";  -- I2C Device Adresse vom WM8731
	constant arraysize : integer := 7;

	type rom is array (0 to arraysize) of std_logic_vector(15 downto 0);

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

	signal s_din : std_logic_vector(31 downto 0);
	signal s_lrswitch : integer range 0 to 2303;
	signal i2c_clkdiv : std_logic_vector(5 downto 0);
	signal i2c_clk : std_logic;
	signal i2c_seq : integer range 0 to 2;
	signal i2c_bitcnt : integer range 0 to 31; 
	signal i2c_wordcnt :integer range 0 to 7;

	begin

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

	process(reset, i2c_clk)
	begin
		if (reset = '1') then
			i2c_sdat <= '0';	
			i2c_sclk <= '0';	
			i2c_seq <= 0;
			i2c_bitcnt <= 0;
			i2c_wordcnt <= 0;	
		elsif (i2c_clk'event and i2c_clk='1') then 
		 -- Zählung von ROM Data, 32 Bits pro Wort, Sequenz von jeweils 3 Bit
			-- i2c_seq zaehlt jeweils von 0 bis 2
			-- i2c_bitcnt zählt jeweils von 0 bis 31
			-- i2c_wordcnt wird nach 32 Schritte von i2c_bitcnt inkrementiert
			 -- wenn i2c_wordcnt auf 7 steht, ist das Ende des Schreibens über I2C beendet
				
		-- Generierung des I2C Takt
				-- i2c_sclk alterniert abhaengig von i2c_seq und i2c_bitcnt (zur Sonderbehandlung von Start- / Stopbedingung)
			
		-- Generierung der I2C Daten
			case i2c_bitcnt is
				when 1 => i2c_sdat <= '0'; -- Startbedingung
				when 2 => i2c_sdat <= i2c_adr(6);-- 7 Bit I2C Adresse
				when 3 => i2c_sdat <= i2c_adr(5);
				when 4 => i2c_sdat <= i2c_adr(4);
				when 5 => i2c_sdat <= i2c_adr(3);
				when 6 => i2c_sdat <= i2c_adr(2);
				when 7 => i2c_sdat <= i2c_adr(1);
				when 8 => i2c_sdat <= i2c_adr(0);
				when 9 => i2c_sdat <= '0'; 		--  '0' für Write Zugriff 
				-- 1 bit Acknowledge
				when 11 => i2c_sdat <= i2c_data(i2c_wordcnt)(15); -- 8 Bit I2C Daten 
				when 12 => i2c_sdat <= i2c_data(i2c_wordcnt)(14); 
				-- ...
				-- weiter fortfuehren
				-- ...
				when others  => i2c_sdat <= '1'; 
			end case;
		end if;
	end process;


	-- WM8731 Audiointerface
	process(reset, clk)
	begin
		if (reset = '1') then
			s_lrswitch <= 0;
			aud_daclrck <= '0';
			s_din <= (others=>'0');
		elsif (clk'event and clk='1') then 
			if s_lrswitch = 383 then -- 18,432 Mhz / 384 = 48 kHz (siehe Datenblatt Seite 42)
				aud_daclrck <= '1'; -- Beginn der Daten
				s_din <= din;
				s_lrswitch <= 0;
			else
				aud_daclrck <= '0';
				s_din <= s_din(30 downto 0) & "0";
				s_lrswitch <=  s_lrswitch + 1;
			end if;
		end if;
	end process;

	aud_xck  <= clk;
	aud_bclk <= not(clk);
	aud_dacdat <= s_din(31);
	end behavioral;