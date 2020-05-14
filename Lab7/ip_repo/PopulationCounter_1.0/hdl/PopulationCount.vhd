----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2020 09:32:35 AM
-- Design Name: 
-- Module Name: PopulationCount - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PopulationCount is
  generic(N    : positive := 4);
  port(dataIn  : in  std_logic_vector(N-1 downto 0);
       cntOut  : out std_logic_vector(N-1 downto 0));
end PopulationCount;

architecture Behavioral of PopulationCount is

begin
    process(dataIn)
    variable s_popCount : unsigned(N - 1 downto 0);
    
    begin
        s_popCount := (others => '0');
        
        for i in 0 to N - 1 loop
            s_popCount := s_popCount + unsigned(dataIn(i downto i));                         
        end loop;
        
        cntOut <= std_logic_vector(s_popCount);
        
    end process;
    
--	s_dataOut  <= signed(S_AXIS_TDATA(31)) + signed(S_AXIS_TDATA(30)) + signed(S_AXIS_TDATA(29)) + signed(S_AXIS_TDATA(28)) +
--	              signed(S_AXIS_TDATA(27)) + signed(S_AXIS_TDATA(26)) + signed(S_AXIS_TDATA(25)) + signed(S_AXIS_TDATA(24)) + 
--	              signed(S_AXIS_TDATA(23)) + signed(S_AXIS_TDATA(22)) + signed(S_AXIS_TDATA(21)) + signed(S_AXIS_TDATA(20)) + 
--	              signed(S_AXIS_TDATA(19)) + signed(S_AXIS_TDATA(18)) + signed(S_AXIS_TDATA(17)) + signed(S_AXIS_TDATA(16)) + 
--	              signed(S_AXIS_TDATA(15)) + signed(S_AXIS_TDATA(14)) + signed(S_AXIS_TDATA(13)) + signed(S_AXIS_TDATA(12)) +  
--	              signed(S_AXIS_TDATA(11)) + signed(S_AXIS_TDATA(10)) + signed(S_AXIS_TDATA(9))  + signed(S_AXIS_TDATA(8))  + 
--	              signed(S_AXIS_TDATA(7))  + signed(S_AXIS_TDATA(6))  + signed(S_AXIS_TDATA(5))  + signed(S_AXIS_TDATA(4))  + 
--	              signed(S_AXIS_TDATA(3))  + signed(S_AXIS_TDATA(2))  + signed(S_AXIS_TDATA(1))  + signed(S_AXIS_TDATA(0));  
  
end Behavioral;