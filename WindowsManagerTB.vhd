LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY WindowsManagerTB IS
END WindowsManagerTB;
 
ARCHITECTURE behavior OF WindowsManagerTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT WindowsManager
    PORT(
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         cwp : IN  std_logic_vector(4 downto 0);
         ncwp : OUT  std_logic_vector(4 downto 0);
         nRs1 : OUT  std_logic_vector(5 downto 0);
         nRs2 : OUT  std_logic_vector(5 downto 0);
         nRd : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal cwp : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal ncwp : std_logic_vector(4 downto 0);
   signal nRs1 : std_logic_vector(5 downto 0);
   signal nRs2 : std_logic_vector(5 downto 0);
   signal nRd : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: WindowsManager PORT MAP (
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          op => op,
          op3 => op3,
          cwp => cwp,
          ncwp => ncwp,
          nRs1 => nRs1,
          nRs2 => nRs2,
          nRd => nRd
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      rs1 <= "11000";
		rs2 <= "10000";
		rd <= "01000";
		cwp <= "00000";
		op <= "10";
		op3 <= "000000";
		wait for 20 ns;
		
      -- insert stimulus here 
		op3 <= "111101";-- suma 1 al ncwp
		wait for 10 ns;
		cwp <= ncwp;
		op3 <= "000000";
		--cwp <= ncwp;
		wait for 10 ns;
		op3 <= "111100";
		wait for 10 ns;
		cwp <= ncwp;
      wait;
   end process;

END;
