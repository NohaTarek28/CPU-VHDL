library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity ShiftLeft2 is
	port( input : in STD_LOGIC_VECTOR (31 DOWNTO 0);
			output : out STD_LOGIC_VECTOR (31 DOWNTO 0));
end ShiftLeft2;

architecture Behavioral of ShiftLeft2 is

begin

output <= STD_LOGIC_VECTOR (unsigned(input) sll 2);

end Behavioral;
