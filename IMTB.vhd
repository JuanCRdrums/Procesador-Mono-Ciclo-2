--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:50:24 09/28/2017
-- Design Name:   
-- Module Name:   C:/Users/user/Dropbox/U/ARQUITECTURA DE COMPUTADORES/ProcesadorMonociclo/IMTB.vhd
-- Project Name:  ProcesadorMonociclo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: instructionMemory
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY IMTB IS
END IMTB;
 
ARCHITECTURE behavior OF IMTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT instructionMemory
    PORT(
         rst : IN  std_logic;
         EN : IN  std_logic;
         ADDR : IN  std_logic_vector(31 downto 0);
         DATA : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal EN : std_logic := '0';
   signal ADDR : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal DATA : std_logic_vector(31 downto 0); 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: instructionMemory PORT MAP (
          rst => rst,
          EN => EN,
          ADDR => ADDR,
          DATA => DATA
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		rst <= '1';
		wait for 20 ns;
		rst <= '0';
		ADDR <= "00000000000000000000000000000000";
		wait for 20 ns;
		ADDR <= "00000000000000000000000000000001";
		wait for 20 ns;
		ADDR <= "00000000000000000000000000000010";
		wait for 20 ns;
		ADDR <= "00000000000000000000000000000100";

      

      -- insert stimulus here 

      wait;
   end process;

END;
