Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

Entity FSM is
Port(clk , Reset , x : IN std_logic;
		y : Out std_logic);
End Entity;

Architecture Zwei of FSM is
	TYPE Zustaende is (s1 , s2 , s3 , s4);
	Signal Zustand, Folgezustand : Zustaende;
Begin
Zustandsspeicher : Process(clk, Reset)
	Begin
	if(Reset = '1') then
		Zustand <= s1;
	Elsif (clk'event AND clk = '1') then
		Zustand <= Folgezustand;
	end if;
	End Process Zustandsspeicher;
 
 Transithoin: Process(Zustand, x)
 Begin
 case Zustand is
 when s1=>
	if (x='1')then 
		Folgezustand <= s2;
	else
		Folgezustand <= s3;
	end if ;
	y <= '1';
 when s2 => Folgezustand <= s4; y<='1';
 when s3 => Folgezustand <= s4; y<='0';
 when s4 => Folgezustand <= s1; y<='0';
 when others => Folgezustand <= s1; y<='1';
 end case;
 end Process Transithoin ;
 End zwei;