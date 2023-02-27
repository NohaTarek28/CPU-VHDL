library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic.all;
use ieee.std_logic_unsigned.all;

entity nott is
  port(
    x :in std_logic_vector (31 downto 0);
  --  b :in std_logic_vector (31 downto 0);
    y :out std_logic_vector (31 downto 0));
  end nott;
  
  architecture behavioral of nott is 
  begin 
    y<= not x ;
  end behavioral;