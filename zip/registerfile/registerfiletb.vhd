LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY registerfiletb IS
END registerfiletb;
 
ARCHITECTURE behavior OF registerfiletb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main
    PORT(
        read_selc1 : IN  std_logic_vector(4 downto 0);
        read_selc2 : IN  std_logic_vector(4 downto 0);
        write_selc : IN  std_logic_vector(4 downto 0);
         write_ena : IN  std_logic;
               clk : IN  std_logic;
               rst : IN  std_logic;
        write_data : IN  std_logic_vector(31 downto 0);
             Data1 : OUT  std_logic_vector(31 downto 0);
             Data2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal read_selc1 : std_logic_vector(4 downto 0) := (others => '0');
   signal read_selc2 : std_logic_vector(4 downto 0) := (others => '0');
   signal write_selc : std_logic_vector(4 downto 0) := (others => '0');
   signal write_ena  : std_logic := '0';
   signal clk        : std_logic := '0';
   signal rst        : std_logic := '0';
   signal write_data : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Data1 : std_logic_vector(31 downto 0);
   signal Data2 : std_logic_vector(31 downto 0);

   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          read_selc1 => read_selc1,
          read_selc2 => read_selc2,
          write_selc => write_selc,
          write_ena => write_ena,
          clk => clk,
          rst => rst,
          write_data => write_data,
          Data1 => Data1,
          Data2 => Data2
        );

   -- Clock process definitions
  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		read_selc1 <="00010";
read_selc2 <= "00010";
write_selc<="00010";
clk <= '1';
rst <= '0';
write_data<= x"00000009";
wait for 100 ns;


read_selc1 <="00010";
read_selc2 <= "00001";
write_selc<="00001";
clk <= '1';
rst <= '0';
write_data<= x"0000000A";
wait for 100 ns;




read_selc1 <="00001";
read_selc2 <= "00010";
write_selc<="00010";
clk <= '1';
rst <= '0';
write_data<= x"0f0f0f09";
wait for 100 ns;




read_selc1 <="00010";
read_selc2 <= "00010";
write_selc<="00010";
clk <= '1';
rst <= '1';
write_data<= x"00000009";
wait for 100 ns;


read_selc1 <="00010";
read_selc2 <= "00010";
write_selc<="00010";
clk<='0';
rst<='0';
write_data<= x"00000009";
wait for 100 ns;


read_selc1 <="00010";
read_selc2 <= "00010";
write_selc<="00010";
clk<='1';
rst<='1';
write_data<= x"00000009";
wait for 100 ns;


read_selc1 <="00011";
read_selc2 <= "00010";
write_selc<="00011";
clk<='0';
rst<='0';
write_data<= x"fffffff7";
wait for 100 ns;


read_selc1 <="00011";
read_selc2 <= "00010";
write_selc<="00011";
clk<='1';
rst<='0';
write_data<= x"fffffff7";
wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
