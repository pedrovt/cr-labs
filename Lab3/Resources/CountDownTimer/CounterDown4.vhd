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
            elsif
				if (clkEnable = '1') then

					-- dccrement
					if (cntEnable = '1' or setDecrem = '1' and setIncrem = '0') then
						-- todo wrap value 
						if (s_value = MAX_VAL) 
							s_value <= 0;

						s_value <= s_value - 1;

						
					end if;

					-- increment
					elsif (setIncrem = '1' and setDecrem = '0') then;
						-- todo wrap value
						if (s_value = MAX_VAL) 
							s_value <= 0;
				
						-- increment
						s_value <= s_value + 1;
						
						end if;
				end if;
	end process;

	
	valOut  <= std_logic_vector(to_unsigned(s_value, 4));

	termCnt <= '1' when (s_value = 0) else '0';
end Behavioral;
