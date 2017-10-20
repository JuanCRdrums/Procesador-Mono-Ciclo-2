
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY ControlUnitTB IS
END ControlUnitTB;
 
ARCHITECTURE behavior OF ControlUnitTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ControlUnit
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         aluop : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal aluop : std_logic_vector(5 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ControlUnit PORT MAP (
          op => op,
          op3 => op3,
          aluop => aluop
        );


   -- Stimulus process
   stim_proc: process
   begin		
     op <= "01";
	  op3 <= "000000";
	  wait for 20 ns;
	  op3 <= "000100";

      -- insert stimulus here 

      wait;
   end process;

END;
