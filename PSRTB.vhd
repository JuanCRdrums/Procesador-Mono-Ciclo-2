
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
 
--USE ieee.numeric_std.ALL;
 
ENTITY PSRTB IS
END PSRTB;
 
ARCHITECTURE behavior OF PSRTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR
    PORT(
         NZVC : in  STD_LOGIC_VECTOR (3 downto 0);
				nCWP: in std_logic_vector(4 downto 0);
           C : out  STD_LOGIC;
			  CWP: out std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal NZVC : std_logic_vector(3 downto 0) := (others => '0');
	signal nCWP: std_logic_vector(4 downto 0):= (others => '0');

 	--Outputs
   signal C : std_logic;
	signal CWP: std_logic_vector(4 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR PORT MAP (
          NZVC => NZVC,
          C => C,
			 nCWP => nCWP,
			 CWP => CWP
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      NZVC <= "1000";
		nCWP <= "00000";
		wait for 20 ns;
		NZVC <= "0011";
		nCWP <= "00001";

      -- insert stimulus here 

      wait;
   end process;

END;
