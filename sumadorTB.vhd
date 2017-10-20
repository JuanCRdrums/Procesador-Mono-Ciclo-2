
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY sumadorTB IS
END sumadorTB;
 
ARCHITECTURE behavior OF sumadorTB IS 

 
    COMPONENT sumador
    PORT(
         dato1 : IN  std_logic_vector(31 downto 0);
         dato2 : IN  std_logic_vector(31 downto 0);
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    


   signal dato1 : std_logic_vector(31 downto 0) := (others => '0');
   signal dato2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumador PORT MAP (
          dato1 => dato1,
          dato2 => dato2,
          output => output
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      dato1 <= "00000000000000000000000000000001";
		dato2 <= "00000000000000000000000000000011";

      -- insert stimulus here 

      wait;
   end process;

END;
