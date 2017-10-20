
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY DatapathTB IS
END DatapathTB;
 
ARCHITECTURE behavior OF DatapathTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT datapath
    PORT(
         rstP : IN  std_logic;
         clkP : IN  std_logic;
         ins : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rstP : std_logic := '0';
   signal clkP : std_logic := '0';

 	--Outputs
   signal ins : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clkP_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: datapath PORT MAP (
          rstP => rstP,
          clkP => clkP,
          ins => ins
        );

   -- Clock process definitions
   clkP_process :process
   begin
		clkP <= '0';
		wait for clkP_period/2;
		clkP <= '1';
		wait for clkP_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      rstP <= '1';
		wait for 20 ns;
		rstP <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
	