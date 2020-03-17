----------------------------------------------------------------------------------
-- Company: University of Aveiro
-- Engineer: Paulo Vasconcelos, Pedro Teixeira
-- 
-- Create Date: 16.03.2020 16:05:20
-- Design Name: 
-- Module Name: ResetModule
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
    port (  clk100MHz : in  std_logic;
            dispRefEn : out std_logic;
            pulse2Hz  : out std_logic;
            pulse1Hz  : out std_logic;
            blink2Hz  : out std_logic;
            blink1Hz  : out std_logic
         );
end PulseGenerator; 


architecture Behavioral of PulseGenerator is
begin
end Behavioral;
