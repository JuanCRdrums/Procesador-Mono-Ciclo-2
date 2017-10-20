
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.STD_LOGIC_ARITH.ALL;


entity WindowsManager is
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           cwp : in  STD_LOGIC_VECTOR (4 downto 0):= "00000";
           ncwp : out  STD_LOGIC_VECTOR (4 downto 0):= "00000";
           nRs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nRs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nRd : out  STD_LOGIC_VECTOR (5 downto 0));
end WindowsManager;

architecture Behavioral of WindowsManager is

signal intrs1,intrs2,intrd: integer range 0 to 	39:= 0;


begin

process(rs1,rs2,rd,op,op3,cwp)
begin
	if(op = "10" and op3 = "111100" and cwp > "00000") then-- save
		ncwp <= conv_std_logic_vector(conv_integer(cwp) - 1,5);
	end if;
	
	if (op = "10" and op3 = "111101") then-- restore
		ncwp <= conv_std_logic_vector(conv_integer(cwp) + 1,5);
	end if;
	
	
	if (rs1 >= "11000" and rs1 <= "11111") then
		intrs1 <= conv_integer(rs1)- (conv_integer(cwp)*16);
	end if;
	
	if (rs1 >= "10000" and rs1 <= "10111") then
		intrs1 <= conv_integer(rs1)+ (conv_integer(cwp)*16);
	end if;
	
	if (rs1 >= "01000" and rs1 <= "01111") then
		intrs1 <= conv_integer(rs1)+ (conv_integer(cwp)*16);
	end if;
	
	if (rs1 >= "00000" and rs1 <= "00111") then
		intrs1 <= conv_integer(rs1);
	end if;
	
	if (rs2 >= "11000" and rs2 <= "11111") then
		intrs2 <= conv_integer(rs2)- (conv_integer(cwp)*16);
	end if;
	
	if (rs2 >= "10000" and rs2 <= "10111") then
		intrs2 <= conv_integer(rs2)+ (conv_integer(cwp)*16);
	end if;
	
	if (rs2 >= "01000" and rs2 <= "01111") then
		intrs2 <= conv_integer(rs2)+ (conv_integer(cwp)*16);
	end if;
	
	if (rs2 >= "00000" and rs2 <= "00111") then
		intrs2 <= conv_integer(rs2);
	end if;
	
	if (rd >= "11000" and rd <= "11111") then
		intrd <= conv_integer(rd)- (conv_integer(cwp)*16);
	end if;
	
	if (rd >= "10000" and rd <= "10111") then
		intrd <= conv_integer(rd)+ (conv_integer(cwp)*16);
	end if;
	
	if (rd >= "01000" and rd <= "01111") then
		intrd <= conv_integer(rd)+ (conv_integer(cwp)*16);
	end if;
	
	if (rd >= "00000" and rd <= "00111") then
		intrd <= conv_integer(rd);
	end if;


end process;

nRs1 <= conv_std_logic_vector(intrs1,6);
nRs2 <= conv_std_logic_vector(intrs2,6);
nRd <= conv_std_logic_vector(intrd,6);


end Behavioral;

