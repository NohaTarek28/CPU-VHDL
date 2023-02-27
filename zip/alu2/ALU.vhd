library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;


entity ALU is
PORT(
  data1 : in std_logic_vector(31 downto 0);
  data2 : in std_logic_vector(31 downto 0);
  aluop : in std_logic_vector(3 downto 0);
    cin : in std_logic;
dataout : out std_logic_vector(31 downto 0);
  cflag : out std_logic;
  zflag : out std_logic;
  oflag : out std_logic);
 
end ALU;

architecture Behavioral of ALU is
component adder_32bit is 
  Port (   x : in  STD_LOGIC_VECTOR (31 downto 0);
           y : in  STD_LOGIC_VECTOR (31 downto 0);
           z : in  STD_LOGIC;
      result : OUT  STD_LOGIC_VECTOR (31 downto 0);
    carryout : OUT  STD_LOGIC);
end component;


component and_32bit is
Port (
      a_in : in  STD_LOGIC_VECTOR (31 downto 0);
      b_in : in  STD_LOGIC_VECTOR (31 downto 0);
     c_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component mux2to1 is 
  port (
    in0,in1  :in std_logic_vector (31 downto 0);
    selector : in std_logic;
    third    :out std_logic_vector (31 downto 0));
end component ;

component mux16to1 is 
Port ( 
        x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15 : in std_logic_vector(31 downto 0);
        se : in std_logic_vector(3 downto 0);
         y : out std_logic_vector (31 downto 0));
end component;

component norr is 
port(
         s : in std_logic_vector (31 downto 0);
         f : in std_logic_vector (31 downto 0);
         n : out std_logic_vector (31 downto 0));
end component;

component orrr is 

port(
         l : in std_logic_vector (31 downto 0);
         m : in std_logic_vector (31 downto 0);
         n : out std_logic_vector (31 downto 0));
end component;
 
 component nott is 
 port ( 
 x : in std_logic_vector (31 downto 0);
  
 y :out std_logic_vector (31 downto 0));

 end component;

signal andresult  : STD_LOGIC_VECTOR ( 31 downto 0);
signal orresult   : STD_LOGIC_VECTOR ( 31 downto 0);
signal addresult  : STD_LOGIC_VECTOR ( 31 downto 0);
signal norresult  : STD_LOGIC_VECTOR ( 31 downto 0);
signal notresult  : STD_LOGIC_VECTOR ( 31 downto 0);
signal mux2output : STD_LOGIC_VECTOR ( 31 downto 0);
signal result     : STD_LOGIC_VECTOR ( 31 downto 0);
signal temp1,temp2      : STD_LOGIC_VECTOR ( 32 downto 0);
signal temp       : STD_LOGIC;









begin

mux1 : mux16to1 port map
 (
 x0  => andresult,
 x1  => orresult,
 x2  => addresult,
 x3  => "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
 x4  => "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
 x5  => "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
 x6  => addresult,
 x7  => "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
 x8  => "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
 x9  => "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
 x10 => "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
 x11 => "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
 x12 => norresult,
 x13 => "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ,
 x14 => "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ,
 x15 => "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ,
 se   => aluop       ,
 y    => result    ) ;
 

add1 : adder_32bit port map( x => data1,			  
           y => mux2output,
           z => aluop(2),
      result => addresult,
    carryout => temp);
	 
	 
temp1 <= (data1(31)& data1 )+ (data2(31) & data2); 
temp2 <= (data1(31)& data1 )-(data2(31) & data2);


oflag <= (temp1(31) xor temp1(32)) when aluop = "0010" else 
         (temp2(31) xor temp2(32)) when aluop = "0110" else
			'Z';

cflag <= temp1(32) when aluop ="0010" else 
         temp2(32)when aluop = "0110" else
			'Z';


and1  : and_32bit port map(data1,data2,andresult);


or1   : orrr  port map (data1,data2,orresult);


negmux: mux2to1 port map  (in0 => data2,
                           in1 => notresult,
                           selector => aluop(2),
                           third => mux2output);
									
norr1 : norr port map ( data1, data2,norresult);									
									
									
notber: nott port map (data2,notresult);

zflag <='1' when result = x"00000000" else '0';

dataout <= result;
end Behavioral;