--------------------------------------------------------------------------------
-- Company: 
-- Engineer:

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY multiplexTB IS
END multiplexTB;
 
ARCHITECTURE behavior OF multiplexTB IS 

 
    COMPONENT multiplex
    PORT(
         i : IN  std_logic;
         R : IN  std_logic_vector(31 downto 0);
         imm : IN  std_logic_vector(31 downto 0);
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i : std_logic := '0';
   signal R : std_logic_vector(31 downto 0) := (others => '0');
   signal imm : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplex PORT MAP (
          i => i,
          R => R,
          imm => imm,
          output => output
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      i <= '0';
		R <= "00000000000000000000000000000000";
		wait for 20 ns;
		i <= '1';
		imm <= "00000000000000000000000000000001";
		wait for 20 ns;
		i <= '0';

      

      -- insert stimulus here 

      wait;
   end process;

END;
