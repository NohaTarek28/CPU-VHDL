LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tbMainModule IS
END tbMainModule;
 
ARCHITECTURE behavior OF tbMainModule IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MainModule
    PORT(
         START : IN  std_logic;
         CLK : IN  std_logic;
         RegFileOut1 : OUT  std_logic_vector(31 downto 0);
         RegFileOut2 : OUT  std_logic_vector(31 downto 0);
         ALUOut : OUT  std_logic_vector(31 downto 0);
         PCOut : inOUT  std_logic_vector(31 downto 0);
         DataMemOut : OUT  std_logic_vector(31 downto 0);
        -- reset_neg : IN  std_logic;
			reset     : IN std_logic
       );
    END COMPONENT;
    

   --Inputs
   signal START : std_logic := '0';
   signal CLK : std_logic := '0';
   --signal reset_neg : std_logic := '1';
   signal reset : std_logic := '0';
 	--Outputs
   signal RegFileOut1 : std_logic_vector(31 downto 0);
   signal RegFileOut2 : std_logic_vector(31 downto 0);
   signal ALUOut : std_logic_vector(31 downto 0);
   signal PCOut : std_logic_vector(31 downto 0);
   signal DataMemOut : std_logic_vector(31 downto 0);
   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MainModule PORT MAP (
          START => START,
          CLK => CLK,
          RegFileOut1 => RegFileOut1,
          RegFileOut2 => RegFileOut2,
          ALUOut => ALUOut,
          PCOut => PCOut,
          DataMemOut => DataMemOut,
 reset=>reset
        );
		

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
	begin 
  Start <= '0' ;
reset<='0';
	wait for CLK_period*10;
	  Start <= '1' ;
reset<='0';
	wait for CLK_period*10;

--      Start <= '0' ;
--		wait for CLK_period*2;
--		
--		Start <= '1' ;
--		-- reset<='0';
--		report "Test1";
--		assert(RegFileOut1="00000000000000000000000000000000" and RegFileOut2="00000000000000000000000000000000" and ALUOut="00000000000000000000000000000000" ) report "1:Fail" severity error;
--
--		--bypass 1st instruction
--		wait for clk_period/2;
--
--		--DataMem output of lw
--		wait for clk_period;
--		report "Test2";
--		assert(DataMemOut = "00000000000000000000000000001100") report "2:Fail" severity error;
--
--		--wait until sw of $t2 inside the 1st loop
--		wait for 11*clk_period;
--		report "Test3";
--		assert(RegFileOut2 = "00000000000000000000000000000010") report "3:Fail" severity error;
--
--		--first loop: wait until last iteration => $t2 = 144
--		wait for 9*clk_period * 9;
--		report "Test4";
--		assert(RegFileOut2 = "00000000000000000000000010010000") report "4:Fail" severity error;
--
--		
--		--wait until lw of Fib(0) into $s0 inside the 2nd loop
--		wait for 12*clk_period;
--		report "Test5";
--		assert(DataMemOut = "00000000000000000000000000000001") report "5:Fail" severity error;
--
--		--second loop: wait until last iteration => $s0 = 144
--		wait for 7*clk_period * 11;
--		report "Test6";
--		assert(DataMemOut = "00000000000000000000000010010000") report "6:Fail" severity error;
--
--
--		--wait until last instruction 
--		wait for 7*clk_period;
--		report "Test7";
--		assert(RegFileOut1 = "00000000000000000000000000000000" and RegFileOut2 = "11111111111111111111111111111111" and ALUOut = "00000000000000000000000000000001") report "7:Fail" severity error;
--
--		report "Test Complete";

		wait;
   end process;

END;
