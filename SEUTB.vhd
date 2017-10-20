
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY SEUTB IS
END SEUTB;
 
ARCHITECTURE behavior OF SEUTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEU
    PORT(
         imm : IN  std_logic_vector(12 downto 0);
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal imm : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU PORT MAP (
          imm => imm,
          output => output
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      imm <= "1111111101110";
		wait for 20 ns;
		imm <= "0000000000011";

      -- insert stimulus here 

      wait;
   end process;

END;
