----------------------------------------------------------------------------------
-- Company: University of Aveiro
-- Engineer: Paulo Vasconcelos, Pedro Teixeira
-- 
-- Create Date: 16.03.2020 16:05:20
-- Design Name: 
-- Module Name: CountDatapath
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

entity CountDatapath is
    port (   clk            : in  std_logic;
             clkEnable      : in  std_logic;
             reset          : in  std_logic;
             runFlag        : in  std_logic;
             secLSSetInc    : in  std_logic;
             secLSSetDec    : in  std_logic;
             secMSSetInc    : in  std_logic;
             secMSSetDec    : in  std_logic;
             minLSSetInc    : in  std_logic;
             minLSSetDec    : in  std_logic;
             minMSSetInc    : in  std_logic;
             minMSSetDec    : in  std_logic;
             secLSCntVal    : out std_logic_vector(3 downto 0);
             secMSCntVal    : out std_logic_vector(3 downto 0);
             minLSCntVal    : out std_logic_vector(3 downto 0);
             minMSCntVal    : out std_logic_vector(3 downto 0);
             zeroFlag       : out std_logic
        );
end CountDatapath; 


architecture Behavioral of CountDatapath is
begin
end Behavioral;
