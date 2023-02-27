library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--use IEEE.NUMERIC_STD.ALL;



entity SignExtender is
	port (SE_in : in STD_LOGIC_VECTOR (15 DOWNTO 0);
			SE_out : out STD_LOGIC_VECTOR (31 DOWNTO 0)
			);
end SignExtender;

architecture Behavioral of SignExtender is

begin

	SE_out <= x"0000" & SE_in when SE_in (15) = '0' else
				 x"FFFF" & SE_in;
				 
end Behavioral;

