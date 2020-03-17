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
use IEEE.NUMERIC_STD.all;

entity Nexys4DisplayDriver is
	generic(MAX_VAL : positive);
	port(clk        : in  std_logic;
         enable     : in  std_logic; 
         digitEn    : in  std_logic_vector(7 downto 0);     
         digVal0    : in  std_logic_vector(3 downto 0);
         digVal1    : in  std_logic_vector(3 downto 0);
         digVal2    : in  std_logic_vector(3 downto 0);
         digVal3    : in  std_logic_vector(3 downto 0);
         digVal4    : in  std_logic_vector(3 downto 0);
         digVal5    : in  std_logic_vector(3 downto 0);
         digVal6    : in  std_logic_vector(3 downto 0);
         digVal7    : in  std_logic_vector(3 downto 0);
         decPtEn    : in  std_logic_vector(7 downto 0);
         dispEn_n   : out std_logic_vector(7 downto 0);
         dispSeg_n  : out std_logic_vector(6 downto 0);
         dispPt_n   : out std_logic);
end Nexys4DisplayDriver;

architecture Structural of Nexys4DisplayDriver is
begin
end Structural;