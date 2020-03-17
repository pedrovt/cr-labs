----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2020 04:48:34 PM
-- Design Name: 
-- Module Name: ClkDividerN - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ClkDividerN is
	generic(k 	: natural := 50);
	port(clkIn	: in  std_logic;
		 clkOut	: out std_logic);
end ClkDividerN;

architecture Behavioral of ClkDividerN is

	signal s_divCounter : natural;

begin
	assert(K >= 2);
	
	process(clkIn)
	begin
		if (rising_edge(clkIn)) then
			if (s_divCounter = k - 1) then
				clkOut		 <= '0';
				s_divCounter <= 0;
			else
				if (s_divCounter = (k / 2 - 1)) then
					clkOut	 <= '1';
				end if;
				s_divCounter <= s_divCounter + 1;
			end if;
		end if;
	end process;
end Behavioral;
