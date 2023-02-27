library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity adder_32bit is
    Port ( x : in  STD_LOGIC_VECTOR (31 downto 0);
           y : in  STD_LOGIC_VECTOR (31 downto 0);
           z : in  STD_LOGIC;
      result : OUT  STD_LOGIC_VECTOR (31 downto 0);
    carryout : OUT  STD_LOGIC);
end adder_32bit;

architecture Behavioral of adder_32bit is
component add is
Port ( x : in STD_LOGIC;
       y : in STD_LOGIC;
     cin : in STD_LOGIC;
     sum : out STD_LOGIC;
    cout : out STD_LOGIC);
end component;

signal wire : std_logic_vector ( 30 downto 0);
begin
A1  : add port map ( x(0)  , y(0)  , z        , result (0)  , wire(0));
A2  : add port map ( x(1)  , y(1)  , wire(0)  , result (1)  , wire(1));
A3  : add port map ( x(2)  , y(2)  , wire(1)  , result (2)  , wire(2));
A4  : add port map ( x(3)  , y(3)  , wire(2)  , result (3)  , wire(3));
A5  : add port map ( x(4)  , y(4)  , wire(3)  , result (4)  , wire(4));
A6  : add port map ( x(5)  , y(5)  , wire(4)  , result (5)  , wire(5));
A7  : add port map ( x(6)  , y(6)  , wire(5)  , result (6)  , wire(6));
A8  : add port map ( x(7)  , y(7)  , wire(6)  , result (7)  , wire(7));
A9  : add port map ( x(8)  , y(8)  , wire(7)  , result (8)  , wire(8));
A10 : add port map ( x(9)  , y(9)  , wire(8)  , result (9)  , wire(9));
A11 : add port map ( x(10) , y(10) , wire(9)  , result (10) , wire(10));
A12 : add port map ( x(11) , y(11) , wire(10) , result (11) , wire(11));
A13 : add port map ( x(12) , y(12) , wire(11) , result (12) , wire(12));
A14 : add port map ( x(13) , y(13) , wire(12) , result (13) , wire(13));
A15 : add port map ( x(14) , y(14) , wire(13) , result (14) , wire(14));
A16 : add port map ( x(15) , y(15) , wire(14) , result (15) , wire(15));
A17 : add port map ( x(16) , y(16) , wire(15) , result (16) , wire(16));
A18 : add port map ( x(17) , y(17) , wire(16) , result (17) , wire(17));
A19 : add port map ( x(18) , y(18) , wire(17) , result (18) , wire(18));
A20 : add port map ( x(19) , y(19) , wire(18) , result (19) , wire(19));
A21 : add port map ( x(20) , y(20) , wire(19) , result (20) , wire(20));
A22 : add port map ( x(21) , y(21) , wire(20) , result (21) , wire(21));
A23 : add port map ( x(22) , y(22) , wire(21) , result (22) , wire(22));
A24 : add port map ( x(23) , y(23) , wire(22) , result (23) , wire(23));
A25 : add port map ( x(24) , y(24) , wire(23) , result (24) , wire(24));
A26 : add port map ( x(25) , y(25) , wire(24) , result (25) , wire(25));
A27 : add port map ( x(26) , y(26) , wire(25) , result (26) , wire(26));
A28 : add port map ( x(27) , y(27) , wire(26) , result (27) , wire(27));
A29 : add port map ( x(28) , y(28) , wire(27) , result (28) , wire(28));
A30 : add port map ( x(29) , y(29) , wire(28) , result (29) , wire(29));
A31 : add port map ( x(30) , y(30) , wire(29) , result (30) , wire(30));
A32 : add port map ( x(31) , y(31) , wire(30) , result (31) , carryout);
end behavioral;
