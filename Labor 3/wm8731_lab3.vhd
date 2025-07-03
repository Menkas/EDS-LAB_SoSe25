LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity wm8731_lab3 is
port (
		clk, reset, EN : in std_logic; -- Takteingang (entsprechend 18,432 MHz fuer WM8731)
		din : in std_logic_vector(31 downto 0); -- Audiodaten: 16 Bit linker Kanal + 16 Bit rechter Kanal
		i2c_sdat : inout std_logic; -- I2C serieller Datenkanal	
		i2c_sclk : out std_logic; -- I2C serielle Clock
		LED		: out std_logic; -- LED für erfolgreiche uebertragung
		aud_xck : out std_logic; -- WM8731 Referenztakt (siehe Register 8 Programmierung)
		aud_bclk : out std_logic; -- Audio Bit Clock
		aud_dacdat : out std_logic; -- DAC Daten
		aud_daclrck : out std_logic -- Links / Rechts
	);
end wm8731_lab3;

architecture behavioral of wm8731_lab3 is

COMPONENT I2C_TMP IS
	PORT(
		clk, reset, EN : IN STD_LOGIC;
		LED : out std_logic;
		i2c_sdat : inout std_logic; -- I2C serieller Datenkanal	
		i2c_sclk : out std_logic -- I2C serielle Clock
	);
END COMPONENT I2C_TMP;

SIGNAL s_din 		: std_logic_vector(31 downto 0);
SIGNAL clkdiv 		: std_logic_vector(8 downto 0);
SIGNAL s_lrswitch	: integer range 0 to 512;


BEGIN

	CLOCKDIV: PROCESS(reset, clk)
	BEGIN
		IF (reset = '1') THEN
			s_lrswitch <= 0;
			aud_daclrck <= '0';
			s_din <= (others=>'0');
		ELSIF (clk'EVENT and clk='1') THEN
			IF s_lrswitch = 374 THEN -- 18,000 Mhz / 375 = 48 kHz (siehe Datenblatt Seite 42)
				aud_daclrck <= '1'; -- Beginn der Daten
				s_din <= din;
				s_lrswitch <= 0;
			ELSE
				aud_daclrck <= '0';
				s_din <= s_din(30 downto 0) & "0";
				s_lrswitch <=  s_lrswitch + 1;
			END IF;
		END IF;
	END PROCESS;

	aud_xck  <= clk;
	aud_bclk <= not(clk);
	aud_dacdat <= s_din(31);
END behavioral;