library IEEE;
use IEEE.STD_LOGIC_1164.all;

package mianpack is

component mux is
    Port ( I0  : in  STD_LOGIC_VECTOR (31 downto 0);
           I1  : in  STD_LOGIC_VECTOR (31 downto 0);
           I2  : in  STD_LOGIC_VECTOR (31 downto 0);
           I3  : in  STD_LOGIC_VECTOR (31 downto 0);
           I4  : in  STD_LOGIC_VECTOR (31 downto 0);
           I5  : in  STD_LOGIC_VECTOR (31 downto 0);
           I6  : in  STD_LOGIC_VECTOR (31 downto 0);
           I7  : in  STD_LOGIC_VECTOR (31 downto 0);
           I8  : in  STD_LOGIC_VECTOR (31 downto 0);
           I9  : in  STD_LOGIC_VECTOR (31 downto 0);
           I10 : in  STD_LOGIC_VECTOR (31 downto 0);
           I11 : in  STD_LOGIC_VECTOR (31 downto 0);
           I12 : in  STD_LOGIC_VECTOR (31 downto 0);
           I13 : in  STD_LOGIC_VECTOR (31 downto 0);
           I14 : in  STD_LOGIC_VECTOR (31 downto 0);
           I15 : in  STD_LOGIC_VECTOR (31 downto 0);
           I16 : in  STD_LOGIC_VECTOR (31 downto 0);
           I17 : in  STD_LOGIC_VECTOR (31 downto 0);
           I18 : in  STD_LOGIC_VECTOR (31 downto 0);
           I19 : in  STD_LOGIC_VECTOR (31 downto 0);
           I20 : in  STD_LOGIC_VECTOR (31 downto 0);
           I21 : in  STD_LOGIC_VECTOR (31 downto 0);
           I22 : in  STD_LOGIC_VECTOR (31 downto 0);
           I23 : in  STD_LOGIC_VECTOR (31 downto 0);
           I24 : in  STD_LOGIC_VECTOR (31 downto 0);
           I25 : in  STD_LOGIC_VECTOR (31 downto 0);
           I26 : in  STD_LOGIC_VECTOR (31 downto 0);
           I27 : in  STD_LOGIC_VECTOR (31 downto 0);
           I28 : in  STD_LOGIC_VECTOR (31 downto 0);
           I29 : in  STD_LOGIC_VECTOR (31 downto 0);
           I30 : in  STD_LOGIC_VECTOR (31 downto 0);
           I31 : in  STD_LOGIC_VECTOR (31 downto 0);
           S   : in  STD_LOGIC_VECTOR (4 downto 0) ;
         data1 : out STD_LOGIC_VECTOR (31 downto 0));
end component;


component register1 is
     Port (  I : in  STD_LOGIC_VECTOR (31 downto 0);
             O : out  STD_LOGIC_VECTOR(31 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
    write_load : in  STD_LOGIC);
end component;


component decoder is
    Port ( write_sel : in  STD_LOGIC_VECTOR (4 downto 0);
           write_ena : in  STD_LOGIC;
                   O : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

end mianpack;




 