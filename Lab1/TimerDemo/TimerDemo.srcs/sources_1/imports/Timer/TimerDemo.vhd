library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity TimerDemo is
    port(clk : in  std_logic;
         sw  : in  std_logic_vector (2 downto 0);
         led : out std_logic_vector (0 downto 0));
end TimerDemo;

architecture Wrapper of TimerDemo is

begin
    timer : entity work.TimerOffDelay(Behavioral)
        generic map(K => 1000000000)
        port map(clk      => clk,
                 reset    => sw(0),
                 enable   => sw(1),
                 start    => sw(2),
                 timerOut => led(0));
end Wrapper;
