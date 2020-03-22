----------------------------------------------------------------------------------
-- Company: University of Aveiro
-- Engineer: Paulo Vasconcelos Pedro Teixeira
-- 
-- Create Date: 16.03.2020 16:05:20
-- Design Name: 
-- Module Name: CounterDown4
-- Project Name: CountDownTimerDemo
-- Target Devices: XC7A100TCSG324-1
-- Tool Versions: 1
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision: 1
-- Revision 1 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity CounterDown4 is
	generic(MAX_VAL : positive);
	port(reset      : in  std_logic;
		 clk        : in  std_logic;
		 clkEnable  : in  std_logic;
		 cntEnable  : in  std_logic;
		 setIncrem  : in  std_logic;
		 setDecrem  : in  std_logic;
		 valOut     : out std_logic_vector(3 downto 0);
		 termCnt    : out std_logic);
end CounterDown4;

architecture Behavioral of CounterDown4 is

    subtype TCount is positive range 0 to MAX_VAL;
	
	signal s_value : TCount;

begin
	process(clk)
	begin	
		if (rising_edge(clk)) then
			if (reset = '1') then
				s_value <= MAX_VAL;
            elsif (cntEnable = '0' and clkEnable = '1') then	
					-- ######################
					-- Setting situations (more priority)
					
					-- decrement
					if (setDecrem = '1') then
						-- wrap value 
						if (s_value = 0) then
							s_value <= MAX_VAL;
						else
							s_value <= s_value - 1;
						end if;

					
					-- increment
					elsif (setIncrem = '1') then
						--  wrap value
						if (s_value = MAX_VAL) then
							s_value <= 0;
						else
							s_value <= s_value + 1;
						end if;
                    end if;
                    
            -- ######################
            -- Default sitation
            elsif (clkEnable = '1' and cntEnable = '1') then
                -- wrap value 
                if (s_value = 0) then
                    s_value <= MAX_VAL;
                else
                    s_value <= s_value - 1;
                end if;
            end if;
        end if;
	end process;

	valOut  <= std_logic_vector(to_unsigned(s_value, 4));

	termCnt <= '1' when (s_value = 0) else '0';
end Behavioral;
