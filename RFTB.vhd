
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY RFTB IS
END RFTB;
 
ARCHITECTURE behavior OF RFTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RF
    PORT(
         RD : IN  std_logic_vector(5 downto 0);
         DWR : IN  std_logic_vector(31 downto 0);
         RS1 : IN  std_logic_vector(5 downto 0);
         RS2 : IN  std_logic_vector(5 downto 0);
         CRS1 : OUT  std_logic_vector(31 downto 0);
         CRS2 : OUT  std_logic_vector(31 downto 0);
         rst : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RD : std_logic_vector(5 downto 0) := (others => '0');
   signal DWR : std_logic_vector(31 downto 0) := (others => '0');
   signal RS1 : std_logic_vector(5 downto 0) := (others => '0');
   signal RS2 : std_logic_vector(5 downto 0) := (others => '0');
   signal rst : std_logic := '0';

 	--Outputs
   signal CRS1 : std_logic_vector(31 downto 0);
   signal CRS2 : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RF PORT MAP (
          RD => RD,
          DWR => DWR,
          RS1 => RS1,
          RS2 => RS2,
          CRS1 => CRS1,
          CRS2 => CRS2,
          rst => rst
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      rst <= '1';
		wait for 5 ns;
		RS1 <= "000001";
		RS2 <= "000010";
		wait for 20 ns;
		rst <= '0';
		DWR <= "00000000000000000000000000000001";
		RD <= "010000";
		wait for 20 ns;
		DWR <= "00000000000000000000000000000010";
		RD <= "100111";
		wait for 20 ns;
		DWR <= "00000000000000000000000000000011";
		RD <= "000011";
      -- insert stimulus here 

      wait;
   end process;

END;
