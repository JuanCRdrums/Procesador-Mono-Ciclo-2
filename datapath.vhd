library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity datapath is
    Port ( rstP : in  STD_LOGIC;
           clkP : in  STD_LOGIC;
           ins : out  STD_LOGIC_vector (31 downto 0));
end datapath;

architecture Behavioral of datapath is

component instructionMemory is
port (rst : in  STD_LOGIC;
      EN : in std_logic;
      ADDR : in std_logic_vector(31 downto 0);
      DATA : out std_logic_vector(31 downto 0));
end component;

component pc is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           datain : in  STD_LOGIC_VECTOR (31 downto 0);
           outp : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component sumador is
    Port ( dato1 : in  STD_LOGIC_VECTOR (31 downto 0);
           dato2 : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal pc0: std_logic_vector(31 downto 0);
signal pc1: std_logic_vector(31 downto 0);
signal address: std_logic_vector(31 downto 0);
signal suma4: std_logic_vector(31 downto 0):= "00000000000000000000000000000001";
signal sEn : std_logic:= '0';
signal instruction: std_logic_vector(31 downto 0);

begin

nPc: pc
port map(
	rst => rstP,
   clk => clkP,
   datain => pc0,
   outp => pc1
	);
	
pca : pc
port map(
	rst => rstP,
   clk => clkP,
   datain => pc1,
   outp => address
	);
	
sum: sumador
port map(
	dato1 => suma4,
	dato2 => address,
	output => pc0
	);
	
IM: instructionMemory
port map(
	rst => rstP,
   EN => sEn,
   ADDR => address,
   DATA => instruction
	);
	
ins <= instruction;
	

end Behavioral;