library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.PackPhas2.all;



entity MainModule is
 GENERIC(n : integer := 32);
    Port ( START : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RegFileOut1 : out  STD_LOGIC_VECTOR (31 downto 0);
           RegFileOut2 : out  STD_LOGIC_VECTOR (31 downto 0);
           ALUOut : out  STD_LOGIC_VECTOR (31 downto 0);
           PCOut : out  STD_LOGIC_VECTOR (31 downto 0);
           DataMemOut : out  STD_LOGIC_VECTOR (31 downto 0);
			   reset :in std_logic 
			);
end MainModule;

architecture Behavioral of MainModule is

  constant PC_increment     : std_logic_vector(31 downto 0) := "00000000000000000000000000000100";
  signal cin                : std_LOGIC := '0';     
  signal coutalu            : std_LOGIC;
  signal coutadder1         : std_logic;
  signal coutadder2         : std_logic;
  signal overflow           : std_LOGIC;
  signal PC_out             : std_logic_vector(31 downto 0);
  signal MuxToWriteRegister : std_logic_vector(4 downto 0);
  signal SignExtendToSLL    : std_logic_vector(31 downto 0);
  signal SLLToAdder         : std_logic_vector(31 downto 0);
  signal ReadData1ToALU     : std_logic_vector(n-1 downto 0);
  signal ReadData2ToMux     : std_logic_vector(n-1 downto 0);
  signal MuxToALU           : std_logic_vector(n-1 downto 0);
  signal ALUToDataMemory    : std_logic_vector(n-1 downto 0);
  signal DataMemoryToMux    : std_logic_vector(n-1 downto 0);
  signal MuxToWriteData     : std_logic_vector(n-1 downto 0);
  signal AdderToMux         : std_logic_vector(31 downto 0);
  signal MuxToMux           : std_logic_vector(31 downto 0);
  signal MuxToPC            : std_logic_vector(31 downto 0);
  signal Adder1ToMux        : std_logic_vector(31 downto 0);
  signal SLLToMux           : std_logic_vector(31 downto 0);
  signal SLLOut             : std_logic_vector(31 downto 0);
  signal ShiftJump          : std_logic_vector(31 downto 0);
  signal instruction        : std_logic_vector(31 downto 0);
  signal cbne               : std_logic;
  signal cRegDst, cJump, cBranch, cMemRead, cMemToReg : std_logic;
  signal cMemWrite, cALUSrc, cRegWrite , ZeroCarry    : std_logic;
  signal cALUOp              : std_logic_vector(1 downto 0);
  signal branchand           : std_logic;
  signal Op                  : std_logic_vector(3 downto 0);
  signal andbne              : std_logic;
  signal orJump              : std_logic;
  signal enterpc             : std_logic_vector(31 downto 0);
  
begin

  SLLToMux <= Adder1ToMux(31 downto 28) & SLLOut(27 downto 0);
  ShiftJump<= "000000" & instruction(25 downto 0);
  branchand<= cbranch and  ZeroCarry;
  andbne<= (not(ZeroCarry)and cbne);
  orJump <= branchand or andbne;

  
  Memory        : DATAMEMORY     port map(not(start),ReadData2ToMux,DataMemoryToMux,cMemRead,cMemWrite,alutodatamemory,clk);   
  ALogicUnit    : ALU            port map(ReadData1ToALU, MuxToALU, Op,cin, ALUToDataMemory,coutalu,ZeroCarry,overflow); 
  MuxAlu        : MUXNEW         generic map(32) port map(ReadData2ToMux, SignExtendToSLL, cALUSrc, MuxToALU);
  MuxReg        : MUXNEW         generic map(5)  port map(instruction(20 downto 16), instruction(15 downto 11), cRegDst, MuxToWriteRegister);
  MuxMem        : MUXNEW         generic map(32) port map(ALUToDataMemory, DataMemoryToMux, cMemToReg, MuxToWriteData);
  MuxBranch     : MUXNEW         generic map(32) port map(Adder1ToMux, AdderToMux, orJump, MuxToMux);
  MuxJump       : MUXNEW         generic map(32) port map(MuxToMux, SLLToMux, cJump, MuxToPC);
  MUXPC         : MUXNEW         generic map(32) port map(pc_out,muxtomux,branchand,enterpc);
  AdderPC       : adder_32bit    port map(PC_out, PC_increment,cin, Adder1ToMux,coutadder1);     
  AdderBranch   : adder_32bit    port map(Adder1ToMux, SLLToAdder,cin,AdderToMux,coutadder2);     
  ShifterJump   : ShiftLeft2     port map(ShiftJump, SLLOut);
  ShifterBranch : ShiftLeft2     port map(SignExtendToSLL, SLLToAdder);
  ShiftExtend   : SignExtender   port map(instruction(15 downto 0), SignExtendToSLL);
  PC            : ProgramCounter port map(start,CLK, muxtopc, PC_out);
  Register1     : main           port map(start,instruction(25 downto 21),instruction(20 downto 16),MuxToWriteRegister,cRegWrite,clk,reset,MuxToWriteData,ReadData1ToALU,ReadData2ToMux);
  CU            : control        port map(instruction(31  downto 26),cRegDst,cJump,cBranch,cMemRead,cMemToReg,cALUOp,cMemWrite,cALUSrc,cRegWrite,cbne );
  acontrol      : ALUControl     port map(instruction(5 downto 0),cALUOp,Op);
  insMEM        : INSTRMEMORY     port map('1',instruction,enterpc,clk);
  
 PCOut<= pc_out;
 RegFileOut1<=ReadData1ToALU;
 RegFileOut2<=ReadData2ToMux;
 ALUOut<= ALUToDataMemory;
 DataMemOut<= DataMemoryToMux;


 
end Behavioral;