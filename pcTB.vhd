
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY pcTB IS
END pcTB;
 
ARCHITECTURE behavior OF pcTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pc
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         datain : IN  std_logic_vector(31 downto 0);
         outp : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal datain : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal outp : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pc PORT MAP (
          rst => rst,
          clk => clk,
          datain => datain,
          outp => outp
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
      datain <= "00000000000000000000000000000001";
		wait for 50 ns;
		datain <= "00000000000000000000000000000011";

      -- insert stimulus here 

      wait;
   end process;

END;
