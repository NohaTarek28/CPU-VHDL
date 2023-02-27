LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_signed.ALL;

 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testtrial IS
END testtrial;
 
ARCHITECTURE behavior OF testtrial IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         data1 : IN  std_logic_vector(31 downto 0);
         data2 : IN  std_logic_vector(31 downto 0);
         aluop : IN  std_logic_vector(3 downto 0);
         cin : IN  std_logic;
         dataout : OUT  std_logic_vector(31 downto 0);
         cflag : OUT  std_logic;
         zflag : OUT  std_logic;
         oflag : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal data1 : std_logic_vector(31 downto 0) := (others => '0');
   signal data2 : std_logic_vector(31 downto 0) := (others => '0');
   signal aluop : std_logic_vector(3 downto 0) := (others => '0');
   signal cin : std_logic := '0';

 	--Outputs
   signal dataout : std_logic_vector(31 downto 0);
   signal cflag : std_logic;
   signal zflag : std_logic;
   signal oflag : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          data1 => data1,
          data2 => data2,
          aluop => aluop,
          cin => cin,
          dataout => dataout,
          cflag => cflag,
          zflag => zflag,
          oflag => oflag
        );

   -- Clock process definitions
  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	



data1 <= x"00000009"	;
data2<= x"0000000A";
aluop<= "0010";
wait for 100 ns;

data1<= x"0000000C";
data2<= x"0000000A";
aluop<= "0110";
wait for 100 ns;
 
data1<= x"FFFFFFF9";
data2<= x"FFFFFFFA";
aluop<= "0010";
wait for 100 ns;
 
data1<= x"FFFFFFF9";
data2<= x"FFFFFFFA";
aluop<= "0110";
wait for 100 ns;
 
data1<= x"00000001";
data2<= x"00000001";
aluop<= "0110";
wait for 100 ns;

data1<= x"7FFFFFFF";
data2<= x"7FFFFFFF";
aluop<= "0010";
wait for 100 ns;

data1<= x"0F0F0F0F";
data2<= x"F0F0F0FF";
aluop<= "0000";
wait for 100 ns;

data1<= x"0F0F0F0F";
data2<= x"F0F0F0FF";
aluop<= "0001";
wait for 100 ns;

data1<= x"0F0F0F0F";
data2<= x"F0F0F0FF";
aluop<= "1100";
wait for 100 ns;
      wait;
   end process;


      -- insert stimulus here 


END;
