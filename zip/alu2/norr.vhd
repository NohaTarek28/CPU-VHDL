library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic.all;
use ieee.std_logic_unsigned.all;


entity norr is
  port(
    s :in std_logic_vector (31 downto 0);
    f :in std_logic_vector (31 downto 0);
    n :out std_logic_vector (31 downto 0));
  end norr;
  
   architecture behavioral of norr is 
  begin 
    n<= s nor f ;
  end behavioral;
