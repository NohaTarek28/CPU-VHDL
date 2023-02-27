library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use work.mianpack.all;



entity main is

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
end main;


architecture Behavioral of main is

SIGNAL L : STD_LOGIC_VECTOR (31 downto 0);
SIGNAL out1,out2,out3,out4,
out5,out6,out7,out8,
 out9,out10,out11,out12 , 
 out13,out14,out15 , 
 out16,out17,out18,out19 , 
 out20,out21,out22,out23, 
 out24,out25,out26,out27 , 
 out28,out29,out30,out31,out32 : STD_LOGIC_VECTOR (31 downto 0);


begin

 d1 : decoder   PORT MAP ( write_selc , write_ena ,L);
 r1 : register1 PORT MAP (star, write_data , out1  , CLK , rst, L(0));
 r2 : register1 PORT MAP (star, write_data , out2  , CLK , rst, L(1));
 r3 : register1 PORT MAP (star, write_data , out3  , CLK , rst, L(2));
 r4 : register1 PORT MAP (star, write_data , out4  , CLK , rst, L(3));
 r5 : register1 PORT MAP (star, write_data , out5  , CLK , rst, L(4));
 r6 : register1 PORT MAP (star,write_data , out6  , CLK , rst, L(5));
 r7 : register1 PORT MAP (star,write_data , out7  , CLK , rst, L(6));
 r8 : register1 PORT MAP (star,write_data , out8  , CLK , rst, L(7));
 r9 : register1 PORT MAP (star,write_data , out9  , CLK , rst, L(8));
r10 : register1 PORT MAP (star,write_data , out10 , CLK , rst, L(9));
r11 : register1 PORT MAP (star,write_data , out11 , CLK , rst, L(10));
r12 : register1 PORT MAP (star,write_data , out12 , CLK , rst, L(11));
r13 : register1 PORT MAP (star,write_data , out13 , CLK , rst, L(12));
r14 : register1 PORT MAP (star,write_data , out14 , CLK , rst, L(13));
r15 : register1 PORT MAP (star,write_data , out15 , CLK , rst, L(14));
r16 : register1 PORT MAP (star,write_data , out16 , CLK , rst, L(15));
r17 : register1 PORT MAP (star,write_data , out17 , CLK , rst, L(16));
r18 : register1 PORT MAP (star,write_data , out18 , CLK , rst, L(17));
r19 : register1 PORT MAP (star,write_data , out19 , CLK , rst, L(18));
r20 : register1 PORT MAP (star,write_data , out20 , CLK , rst, L(19));
r21 : register1 PORT MAP (star,write_data , out21 , CLK , rst, L(20));
r22 : register1 PORT MAP (star,write_data , out22 , CLK , rst, L(21));
r23 : register1 PORT MAP (star,write_data , out23 , CLK , rst, L(22));
r24 : register1 PORT MAP (star,write_data , out24 , CLK , rst, L(23));
r25 : register1 PORT MAP (star,write_data , out25 , CLK , rst, L(24));
r26 : register1 PORT MAP (star,write_data , out26 , CLK , rst, L(25));
r27 : register1 PORT MAP (star,write_data , out27 , CLK , rst, L(26));
r28 : register1 PORT MAP (star,write_data , out28 , CLK , rst, L(27));
r29 : register1 PORT MAP (star,write_data , out29 , CLK , rst, L(28));
r30 : register1 PORT MAP (star,write_data , out30 , CLK , rst, L(29));
r31 : register1 PORT MAP (star,write_data , out31 , CLK , rst, L(30));
r32 : register1 PORT MAP (star,write_data , out32 , CLK , rst, L(31));



m1: mux PORT MAP ( out1,out2 ,out3 ,out4,
out5,out6 ,out7 ,out8,
out9,out10 ,out11 ,out12,
out13,out14 ,out15 ,out16,
out17,out18 ,out19 ,out20,
out21,out22 ,out23 ,out24,
out25,out26 ,out27 ,out28,
out29,out30 ,out31,out32,read_Selc1,Data1);

m2: mux PORT MAP ( out1,out2 ,out3 ,out4,
out5,out6 ,out7 ,out8,
out9,out10 ,out11 ,out12,
out13,out14 ,out15 ,out16,
out17,out18 ,out19 ,out20,
out21,out22 ,out23 ,out24,
out25,out26 ,out27 ,out28,
out29,out30 ,out31,out32,read_Selc2,Data2);




end Behavioral;

