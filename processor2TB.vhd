

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY processor2TB IS
END processor2TB;
 
ARCHITECTURE behavior OF processor2TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT processor2
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal result : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: processor2 PORT MAP (
          rst => rst,
          clk => clk,
          result => result
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      rst <= '1';
		wait for 20 ns;
		rst <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;
