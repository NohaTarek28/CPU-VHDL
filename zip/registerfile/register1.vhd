library IEEE;

use IEEE.STD_LOGIC_1164.ALL;




entity register1 is
    Port (   I : in  STD_LOGIC_VECTOR (31 downto 0);
             O : out  STD_LOGIC_VECTOR(31 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
    write_load : in  STD_LOGIC);
	 
end register1;

architecture Behavioral of register1 is

begin
O <= (others=> '0') when rst = '1' ELSE 

I when clk'event and clk = '1' and write_load = '1' else


 "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

end Behavioral;