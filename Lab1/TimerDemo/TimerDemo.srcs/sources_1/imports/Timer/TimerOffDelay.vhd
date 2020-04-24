library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity TimerOffDelay is
    generic(K : positive := 10);
    port(clk      : in  std_logic;
         reset    : in  std_logic;
         enable   : in  std_logic;
         start    : in  std_logic;
         timerOut : out std_logic);
end TimerOffDelay;

architecture Behavioral of TimerOffDelay is

    signal s_count : integer := 0;

begin
    assert(K >= 2);
    
    process(clk)
    begin
        if (rising_edge(clk)) then
            if (reset = '1') then
                timerOut <= '0';
                s_count  <= 0;
            elsif (enable = '1') then
                if (s_count = 0) then
                    if (start = '1') then
                        timerOut <= '1';
                        s_count <= s_count + 1;
                    else
                        timerOut <= '0';
                    end if;
                else
                    if (s_count = (K - 1)) then
                        timerOut <= '0';
                        s_count  <= 0;
                    else
                        timerOut <= '1';
                        s_count  <= s_count + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;
end Behavioral;
