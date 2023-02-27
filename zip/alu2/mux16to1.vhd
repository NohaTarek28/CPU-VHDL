library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity mux16to1 is
    Port ( x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15 : in std_logic_vector(31 downto 0);
           se : in std_logic_vector(3 downto 0);
           y : out std_logic_vector (31 downto 0));
end mux16to1;

architecture behavioral of mux16to1 is

begin
    process(se,x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15)
    begin
	 case se is 
     when "0000"=> y <= x0;
     when "0001"=> y <= x1;
	  when "0010"=> y <= x2;
	  when "0011"=> y <= x3;
	  when "0100"=> y <= x4;
	  when "0101"=> y <= x5;
	  when "0110"=> y <= x6;
	  when "0111"=> y <= x7;
	  when "1000"=> y <= x8;
	  when "1001"=> y <= x9;
	  when "1010"=> y <= x10;
	  when "1011"=> y <= x11;
	  when "1100"=> y <= x12;
	  when "1101"=> y <= x13;
	  when "1110"=> y <= x14;
	  when "1111"=> y <= x15;
	  when others=> y <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    
      
  end case;
  end process ;
end behavioral;