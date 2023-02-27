library IEEE;
use IEEE.STD_LOGIC_1164.all;

package PackPhas2 is

component ProgramCounter is
GENERIC (n : integer := 32);
port( -- input
st: in std_logic;
      CLK        : in  std_logic;
      --reset_neg  : in  std_logic;
      input      : in  std_logic_vector(31 downto 0);

      -- output
      output : out std_logic_vector(31 downto 0) );
end component;



component ALU is
PORT(
data1 : in std_logic_vector(31 downto 0);
data2 : in std_logic_vector(31 downto 0);
aluop : in std_logic_vector(3 downto 0);
cin : in std_logic;
dataout : out std_logic_vector(31 downto 0);
cflag : out std_logic;
zflag : out std_logic;
oflag : out std_logic);

end component;



component SignExtender is
port (SE_in : in STD_LOGIC_VECTOR (15 DOWNTO 0);
SE_out : out STD_LOGIC_VECTOR (31 DOWNTO 0)
);
end component;



component DATAMEMORY is
Generic(words : natural :=64;wordsize: natural :=32; addresssize: natural := 32);
port ( LoadIt: in STD_LOGIC;
INPUT : in STD_LOGIC_VECTOR (wordsize-1 downto 0);
OUTPUT : out STD_LOGIC_VECTOR (wordsize-1 downto 0);
MEM_READ : in STD_LOGIC;
MEM_WRITE : in STD_LOGIC;
ADDRESS : in STD_LOGIC_VECTOR (addresssize-1 downto 0);
CLK       : in STD_LOGIC);

end component;


component INSTRMEMORY is
Generic(words : natural :=64;wordsize: natural :=32; addresssize: natural := 32);
port(
LoadIt: in Std_logic ;
DATA: out STD_LOGIC_VECTOR(wordsize-1 downto 0);
ADDRESS: in STD_LOGIC_VECTOR(addresssize-1 downto 0);
CLK       : in STD_LOGIC
);
end component;


component MUXNEW is
GENERIC (N : integer );
port (  mux_in0  : in STD_LOGIC_VECTOR (N-1 downto 0);
        mux_in1  : in STD_LOGIC_VECTOR (N-1 downto 0);
		  mux_ctrl : in STD_LOGIC;
		  mux_out  : out STD_LOGIC_VECTOR (N-1 downto 0)
);
end component;

component ALUControl is
    Port ( funct : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOp : in  STD_LOGIC_VECTOR (1 downto 0);
           Operation : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component control is
    Port ( Opcode : in  STD_LOGIC_VECTOR (5 downto 0);
           RegDst : out  STD_LOGIC;
           Jump : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemtoReg : out  STD_LOGIC;
           ALUOP : out  STD_LOGIC_VECTOR(1 downto 0);
           MemWrite : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
			  Bne : out STD_LOGIC);
end component;

component main is
    Port ( 
	 star: in STD_LOGIC;
	 read_selc1 : in  STD_LOGIC_VECTOR (4 downto 0);
           read_selc2 : in  STD_LOGIC_VECTOR (4 downto 0);
           write_selc : in  STD_LOGIC_VECTOR (4 downto 0);
           write_ena  : in  STD_LOGIC;
                  clk : in  STD_LOGIC;
						rst : in  STD_LOGIC;
          write_data  : in  STD_LOGIC_VECTOR (31 downto 0);
                Data1 : out STD_LOGIC_VECTOR (31 downto 0);
                Data2 : out  STD_LOGIC_VECTOR(31 downto 0));
end component;

component adder_32bit is
    Port ( x : in  STD_LOGIC_VECTOR (31 downto 0);
           y : in  STD_LOGIC_VECTOR (31 downto 0);
           z : in  STD_LOGIC;
      result : OUT  STD_LOGIC_VECTOR (31 downto 0);
    carryout : OUT  STD_LOGIC);
end component;

component ShiftLeft2 is
	port( input : in STD_LOGIC_VECTOR (31 DOWNTO 0);
			output : out STD_LOGIC_VECTOR (31 DOWNTO 0));
end component;

end PackPhas2;

package body PackPhas2 is

end PackPhas2;