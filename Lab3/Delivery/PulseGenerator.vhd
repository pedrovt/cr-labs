----------------------------------------------------------------------------------
-- Company: University of Aveiro
-- Engineer: Paulo Vasconcelos, Pedro Teixeira
-- 
-- Create Date: 16.03.2020 16:05:20
-- Design Name: 
-- Module Name: PulseGenerator
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

entity PulseGenerator is
    generic(N : positive := 5);
    port (  clk100MHz       : in  std_logic;
            pulseDisplay    : out std_logic;   
            pulse2Hz        : out std_logic;      -- duty cycle 1/50M
            pulse1Hz        : out std_logic;      -- duty cycle 1/100M
            blink2Hz        : out std_logic;      -- duty cycle 50%
            blink1Hz        : out std_logic       -- duty cycle 50%
         );
end PulseGenerator; 

-- usar frequencia de refresh de ~1525 (100 Mhz / 2^16) Hz
architecture Behavioral of PulseGenerator is
    
    signal s_counter    : natural;

begin
    process(clk100MHz)
    begin
        if (rising_edge(clk100MHz)) then

            -- Display Reference Enable
            if (s_counter rem 65536 = 0) then
                pulseDisplay <= '1';
            else
                pulseDisplay <= '0';
            end if;

            if (s_counter >= 100000000) then
                pulseDisplay <= '0';      
                pulse1Hz     <= '0';
                blink1Hz     <= '0';
                s_counter    <= 0;
            else
                -- 2 Hz Pulse
                if (s_counter rem 50000000 = 0) then
                    pulse2Hz <= '1';
                else
                    pulse2Hz <= '0';
                end if;

                -- 1 Hz Pulse
                if (s_counter = 0) then
                    pulse1Hz <= '1';
                else
                    pulse1Hz <= '0';
                end if;

                -- 2 Hz Blink
                if ((s_counter / 25000000) rem 2 = 0) then
                    blink2Hz <= '1';
                else
                    blink2Hz <= '0';
                end if;

                -- 1 Hz Blink
                if ((s_counter / 50000000) rem 2 = 0) then
                    blink1Hz <= '1';
                else
                    blink1Hz <= '0';
            end if;

            s_counter <= s_counter + 1;

            end if;
        end if;
    end process;    
end Behavioral;

