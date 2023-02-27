library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--use IEEE.NUMERIC_STD.ALL;



entity ALUControl is
    Port ( funct : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOp : in  STD_LOGIC_VECTOR (1 downto 0);
           Operation : out  STD_LOGIC_VECTOR (3 downto 0));
end ALUControl;

architecture Behavioral of ALUControl is
begin

process(ALUOp, funct)
begin

	case ALUOp is
      when "00" => -- addition
			Operation <= "0010";

      when "01" => -- subtraction
			Operation <= "0110";
			
		when "10" => -- determined by funct code
            case funct is
                  when "100000" => 
                        Operation <= "0010"; -- add

                  when "100010" => 
                        Operation <= "0110"; -- sub 
								
						when "100100" => 
                         Operation <= "0000"; -- and

                  when "100101" => 
                         Operation <= "0001"; -- or

					   when "100111" => 
                         Operation <= "1100"; -- nor
								 
						when others => null;
				end case;
		when others => null;
	end case;
end process;			

end Behavioral;

