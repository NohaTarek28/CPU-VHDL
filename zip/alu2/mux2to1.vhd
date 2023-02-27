library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic.all;
use ieee.std_logic_unsigned.all;

entity mux2to1 is 
  port (
    in0,in1   :in std_logic_vector (31 downto 0);
    selector : in std_logic;
    third :out std_logic_vector (31 downto 0));
  end mux2to1;

architecture behavioral of mux2to1 is 
begin 
 process (selector,in0,in1)
 begin 
 case selector is 
 when '0' =>  third  <=  in0 ;
 when '1'=>   third  <=in1 ;
 when others => third <="ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
 end case ;
 end process ;
 end behavioral;