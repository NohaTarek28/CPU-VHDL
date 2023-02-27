library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUXNEW is
GENERIC (
N : integer   );
port (  mux_in0  : in STD_LOGIC_VECTOR (N-1 downto 0);
        mux_in1  : in STD_LOGIC_VECTOR (N-1 downto 0);
		  mux_ctrl : in STD_LOGIC;
		  mux_out  : out STD_LOGIC_VECTOR (N-1 downto 0)
);




end MUXNEW;

architecture Behavioral of MUXNEW is

begin
 mux_out <= mux_in0 when mux_ctrl = '0' else 
            mux_in1;

end Behavioral;

