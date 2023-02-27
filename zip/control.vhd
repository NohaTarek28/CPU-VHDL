library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity control is
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
end control;

architecture Behavioral of control is

begin
    process (Opcode)
    begin
      RegWrite <= '0';  --Deassert for next command
      case OpCode is
          when "000000" => -- And, Or, Add, Sub, sit: Ox00
           RegDst <= '1';
			  jump<= '0';
           Branch <= '0';
           MemRead <= '0';
           MemtoReg <= '0';
           ALUOP<= "10";
           MemWrite <= '0';
           ALUSrc <= '0';
			  RegWrite <= '1'  after 10 ns;
			  bne<='0';
			  
			  
          when "100011" => -- Load Nord (1w): Ox23
           RegDst <= '0';
           Jump <= '0';
           Branch<= '0';
           MemRead <= '1';
           MemtoReg <= '1';
           ALUOP <= "00";
           MemWrite <= '0';
           ALUSrc <= '1';
           RegWrite <= '1'  after 10 ns;
			  bne<='0';
			  
			 when "101011" => -- Store Mord (sw): Ox28
           RegDst <= 'X'; -- Don't care
           Jump<= '0';
           Branch <= '0';
           MemRead<= '0';
           MemtoReg <= 'X';
           ALUOP <= "00";
           MemWrite <= '1';
           ALUSrc <= '1';
           RegWrite<= '0';
			  bne<='0';
			  
			 when "000010" =>-- Jump (j): Ox02
           RegDst<= 'X';
           Jump<= '1';
           Branch <= '0';
           MemRead <= '0';
           MemToReg <= 'X';
           ALUOp <= "00";
           MemWrite<= '0';
           ALUSrc <= '0';
           RegWrite <= '0';
			  bne<='0';
			  
         when "000100" => -- Branch Equal (beq):Ox04
          RegDst<= 'X';
          Jump<= '0';
          Branch <= '1';
          MemRead <= '0';
          MemtoReg <= 'X'; 
          ALUOP<= "01";
          MemWrite <= '0';
          ALUSrc <= '0';
          RegWrite <='0';
			 bne<='0';
			
			when "000101" => --Branch Not Equal
			 RegDst<= 'X';
          Jump<= '0';
          Branch <= '0';
          MemRead <= '0';
          MemtoReg <= 'X'; 
          ALUOP<= "01";
          MemWrite <= '0';
          ALUSrc <= '0';
          RegWrite <='0';
			 bne<='1';
		
			  
          when others => null; -- Implement other commands down here
           RegDst <= '0';
           Jump<= '0';
           Branch <= '0';
           MemRead <= '0';
           MemtoReg <='0';
           ALUOP<= "00";
           MemWrite <= '0';
           ALUSrc<= '0';
           RegWrite <= '0';
			  bne<='0';
			  
      end case;
end process;


end Behavioral;

