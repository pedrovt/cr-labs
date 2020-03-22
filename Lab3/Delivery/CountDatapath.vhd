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
    
    signal s_SEC_LS_FINISHED, s_SEC_MS_FINISHED, s_MIN_LS_FINISHED                       : std_logic;
    signal s_SEC_MS_cntEnable, s_MIN_LS_cntEnable, s_MIN_MS_cntEnable, s_MIN_MS_FINISHED : std_logic;
    
begin   
      
      -- Enables for each counter
      s_SEC_MS_cntEnable <= runFlag and s_SEC_LS_FINISHED;
      s_MIN_LS_cntEnable <= s_SEC_MS_cntEnable and s_SEC_MS_FINISHED;
      s_MIN_MS_cntEnable <= s_MIN_LS_cntEnable and s_MIN_LS_FINISHED; 
      
      -- Counters
      SEC_LS_COUNTER : entity work.CounterDown4(Behavioral)
                        generic map(MAX_VAL => 9)
                        port map(reset      => reset,
                                 clk        => clk,
                                 clkEnable  => clkEnable,
                                 cntEnable  => runFlag,
                                 setIncrem  => secLSSetInc,
                                 setDecrem  => secLSSetDec,
                                 valOut     => secLSCntVal,    
                                 termCnt    => s_SEC_LS_FINISHED);
                                 
      SEC_MS_COUNTER : entity work.CounterDown4(Behavioral)
                        generic map(MAX_VAL => 5)
                        port map(reset      => reset,
                                 clk        => clk,
                                 clkEnable  => clkEnable,
                                 cntEnable  => s_SEC_MS_cntEnable,
                                 setIncrem  => secMSSetInc,
                                 setDecrem  => secMSSetDec,
                                 valOut     => secMSCntVal,    
                                 termCnt    => s_SEC_MS_FINISHED);
      
      MIN_LS_COUNTER : entity work.CounterDown4(Behavioral)
                        generic map(MAX_VAL => 9)
                        port map(reset      => reset,
                                 clk        => clk,
                                 clkEnable  => clkEnable,
                                 cntEnable  => s_MIN_LS_cntEnable,
                                 setIncrem  => minLSSetInc,
                                 setDecrem  => minLSSetDec,
                                 valOut     => minLSCntVal,    
                                 termCnt    => s_MIN_LS_FINISHED);
                                 
      MIN_MS_COUNTER : entity work.CounterDown4(Behavioral)
                        generic map(MAX_VAL => 5)
                        port map(reset      => reset,
                                 clk        => clk,
                                 clkEnable  => clkEnable,
                                 cntEnable  => s_MIN_MS_cntEnable,
                                 setIncrem  => minMSSetInc,
                                 setDecrem  => minMSSetDec,
                                 valOut     => minMSCntVal,    
                                 termCnt    => s_MIN_MS_FINISHED);
                                
       zeroFlag <= s_SEC_LS_FINISHED AND s_SEC_MS_FINISHED AND s_MIN_LS_FINISHED AND s_MIN_MS_FINISHED;
                                 
end Behavioral;
