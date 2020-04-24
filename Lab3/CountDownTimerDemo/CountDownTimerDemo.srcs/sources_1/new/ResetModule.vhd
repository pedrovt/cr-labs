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

entity ResetModule is
    generic(N              : positive := 4);
    port (  sysClk         : in  std_logic;
            resetIn_n      : in  std_logic;
            resetOut       : out std_logic
         );
end ResetModule; 

architecture Behavioral of ResetModule is

   signal s_shiftReg : std_logic_vector((N - 1) downto 0) := (others => '0');

begin
   assert(N >= 2);

   shift_proc : process(resetIn_n, sysClk)
   begin
      if (resetIn_n = '0') then
         s_shiftReg <= (others => '0');
      elsif (rising_edge(sysClk)) then
         s_shiftReg((N - 1) downto 1) <= s_shiftReg((N - 2) downto 0);
         s_shiftReg(0) <= '1';
      end if;
   end process;

   resetOut <= not s_shiftReg(N - 1);
end Behavioral;