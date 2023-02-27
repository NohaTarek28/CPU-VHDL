
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity decoder is
    Port ( write_sel : in  STD_LOGIC_VECTOR (4 downto 0);
           write_ena : in  STD_LOGIC;
           O : out  STD_LOGIC_VECTOR (31 downto 0));
end decoder;

architecture Behavioral of decoder is

begin
process(write_sel,write_ena)
begin
o<="00000000000000000000000000000000";
if(write_ena ='1') then 
case write_sel is 
     when"00000" => O(0) <='1';
	  when"00001" => O(1) <='1';
	  when"00010" => O(2) <='1';
	  when"00011" => O(3) <='1';
	  when"00100" => O(4) <='1';
	  when"00101" => O(5) <='1';
	  when"00110" => O(6) <='1';
	  when"00111" => O(7) <='1';
	  when"01000" => O(8) <='1';
	  when"01001" => O(9) <='1';
	  when"01010" => O(10) <='1';
	  when"01011" => O(11) <='1';
	  when"01100" => O(12) <='1';
	  when"01101" => O(13) <='1';
	  when"01110" => O(14) <='1';
	  when"01111" => O(15) <='1';
	  when"10000" => O(16) <='1';
	  when"10001" => O(17) <='1';
	  when"10010" => O(18) <='1';
	  when"10011" => O(19) <='1';     
	  when"10100" => O(20) <='1';   
	  when"10101" => O(21) <='1';
	  when"10110" => O(22) <='1';
	  when"10111" => O(23) <='1';
	  when"11000" => O(24) <='1';
	  when"11001" => O(25) <='1';
	  when"11010" => O(26) <='1';
	  when"11011" => O(27) <='1';
	  when"11100" => O(28) <='1';
	  when"11101" => O(29) <='1';
	  when"11110" => O(30) <='1';
	  when"11111" => O(31) <='1';
	  when others => O <= "00000000000000000000000000000000";

end case;
end if;
	  end process;
end Behavioral;

