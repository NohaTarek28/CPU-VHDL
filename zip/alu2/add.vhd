library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity add is

Port ( x : in STD_LOGIC;
       y : in STD_LOGIC;
     cin : in STD_LOGIC;
    sum  : out STD_LOGIC;
    cout : out STD_LOGIC);

end add;

architecture Behavioral of add is 
begin
sum  <= ( x xor y) xor cin;
cout <= (x and y ) or ((x xor y)and cin);
end Behavioral;

