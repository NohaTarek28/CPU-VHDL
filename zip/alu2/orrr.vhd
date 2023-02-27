library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity orrr is
  port(l:in std_logic_vector (31 downto 0);
    m:in std_logic_vector (31 downto 0);
    n:out std_logic_vector (31 downto 0));
  end orrr;
  
  
  architecture behavioral of orrr is
    begin
    n <= l or m;
  end behavioral;
