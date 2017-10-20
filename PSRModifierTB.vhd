LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_signed.all;
 
ENTITY PSRModifierTB IS
END PSRModifierTB;
 
ARCHITECTURE behavior OF PSRModifierTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSRModifier
    PORT(
         ALUR : IN  std_logic_vector(31 downto 0);
         OP : IN  std_logic_vector(5 downto 0);
         NZVC : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ALUR : std_logic_vector(31 downto 0) := (others => '0');
   signal OP : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal NZVC : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSRModifier PORT MAP (
          ALUR => ALUR,
          OP => OP,
          NZVC => NZVC
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      OP <= "000000";
		ALUR <= "00000000000000000000000000000000";
		wait for 20 ns;
		OP <= "010001";
		ALUR <= "00000000000000000000000000000000";
		wait for 20 ns;
		ALUR <= "11111111111111111111111111111111";

      wait;
   end process;

END;
