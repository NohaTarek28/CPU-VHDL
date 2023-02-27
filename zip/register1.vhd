library IEEE;

use IEEE.STD_LOGIC_1164.ALL;




entity register1 is
    Port (  sta : in STD_LOGIC;
	 I : in  STD_LOGIC_VECTOR (31 downto 0);
             O : out  STD_LOGIC_VECTOR(31 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
    write_load : in  STD_LOGIC);
	 
end register1;

architecture Behavioral of register1 is
begin
process(sta, write_load,clk)
begin

if (sta ='0') then 
O <= x"00000000";
elsif (rst ='1') then 
O<= x"00000000";
elsif (FALLING_EDGE(CLK) and write_load = '1') then 
o<= I;

 end if;
end process;

end Behavioral;