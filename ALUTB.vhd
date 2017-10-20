
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY ALUTB IS
END ALUTB;
 
ARCHITECTURE behavior OF ALUTB IS 
  
    COMPONENT ALU
    PORT(c: in std_logic;
         op : IN  std_logic_vector(5 downto 0);
         d1 : IN  std_logic_vector(31 downto 0);
         d2 : IN  std_logic_vector(31 downto 0);
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(5 downto 0) := (others => '0');
   signal d1 : std_logic_vector(31 downto 0) := (others => '0');
   signal d2 : std_logic_vector(31 downto 0) := (others => '0');
	signal c : std_logic:= '0';

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          op => op,
          d1 => d1,
          d2 => d2,
			 c => c,
          output => output
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		-- insert stimulus here 
		d1 <= "00000000000000000000000000000001";
		d2 <= "00000000000000000000000000000010";
		c <= '1';
		op <= "000000";
      wait for 10 ns;
		op <= "000100";
		wait for 10 ns;
		op <= "000001";
		wait for 10 ns;
		op <= "000010";
		wait for 10 ns;
		op <= "000011";
		wait for 10 ns;
		op <= "010000";
      wait for 10 ns;
		op <= "010100";
		wait for 10 ns;
		op <= "010001";
		wait for 10 ns;
		op <= "010010";
		wait for 10 ns;
		op <= "010011";
		wait for 10 ns;
		op <= "001000";
		wait for 10 ns;
		op <= "011000";
		wait for 10 ns;
		op <= "001100";
		wait for 10 ns;
		op <= "011100";
		wait for 10 ns;
		op <= "100101";
		wait for 10 ns;
		op <= "100110";
		wait for 10 ns;
		op <= "111111";
   end process;

END;
