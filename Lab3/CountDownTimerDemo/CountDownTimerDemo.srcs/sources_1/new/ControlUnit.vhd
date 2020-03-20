----------------------------------------------------------------------------------
-- Company: University of Aveiro
-- Engineer: Paulo Vasconcelos Pedro Teixeira
-- 
-- Create Date: 16.03.2020 16:05:20
-- Design Name: 
-- Module Name: ControlUnit
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

entity ControlUnit is
    port (  reset      : in  std_logic;
            clk        : in  std_logic;
            btnStart   : in  std_logic;
            btnSet     : in  std_logic;
            btnUp      : in  std_logic;
            btnDown    : in  std_logic;
            upDownEn   : in  std_logic;
            zeroFlag   : in  std_logic;
            runFlag    : out std_logic;
            setFlags   : out std_logic_vector(3 downto 0);
            secLSSetInc: out std_logic;
            secLSSetDec: out std_logic;
            secMSSetInc: out std_logic;
            secMSSetDec: out std_logic;
            minLSSetInc: out std_logic;
            minLSSetDec: out std_logic;
            minMSSetInc: out std_logic;
            minMSSetDec: out std_logic
        );
end ControlUnit; 

-- [PEDRO] TODO Improve code based on printscreen
architecture Behavioral of ControlUnit is

    type TState is (STOPPED, RUNNING, CHANGE_SEC_LS, CHANGE_SEC_MS, CHANGE_MIN_LS, CHANGE_MIN_MS);
    signal s_currentState, s_nextState : TState;
    
begin
    
    sync_proc:  process(clk)
    begin
        if ((clk = '1') AND (clk'EVENT)) then
            if (reset = '1') then
                s_currentState <= STOPPED;
            else
                s_currentState <= s_nextState;
            end if;
        end if;
    end process;
    
    comb_proc: process(s_currentState, btnDown, btnSet, btnStart, btnUp, clk, reset, upDownEn, zeroFlag)
    begin
        case (s_currentState) is 
        
        -- #########################################
        -- STOPPED clock : no increment or decrement. Clock can be started or be adjusted 
        when STOPPED =>
            runFlag    <= '0';
            setFlags   <= "0000";       -- no digit being changed
            
            -- Update state
            if (btnStart = '1') then
                s_nextState <= RUNNING;
            else
                s_nextState <= STOPPED;
            end if;
        
        -- #########################################
        -- RUNNING clock : no increment or decrement. no adjustments allowed
        when RUNNING =>
            runFlag    <= '1';
            setFlags   <= "0000";       -- no digit being changed
            
            -- Update state
            if (btnSet = '1') then
                s_nextState <= CHANGE_SEC_LS;
            else
                s_nextState <= RUNNING;
            end if;
            
        -- #########################################
        -- CHANGE_SEC_LS clock : increment or decrement based on upDownEn
        when CHANGE_SEC_LS =>
            runFlag    <= '1';
            setFlags   <= "0001";       -- digit ---X
             
            -- Update state
            if (btnSet = '1') then
                s_nextState <= CHANGE_SEC_MS;
            else
                s_nextState <= CHANGE_SEC_LS;
            end if;
         
        -- #########################################
        -- CHANGE_SEC_MS clock : increment or decrement based on upDownEn
         when CHANGE_SEC_MS =>
            runFlag    <= '1';
            setFlags   <= "0010";       -- digit --X-
               
            -- Update state
            if (btnSet = '1') then
                s_nextState <= CHANGE_MIN_LS;
            else
                s_nextState <= CHANGE_SEC_MS;
            end if;
          
          -- #########################################
          -- CHANGE_MIN_LS clock : increment or decrement based on upDownEn
          when CHANGE_MIN_LS =>
            runFlag    <= '1';
            setFlags   <= "0100";       -- digit -X--
            
            -- Update state
            if (btnSet = '1') then
                s_nextState <= CHANGE_MIN_MS;
            else
                s_nextState <= CHANGE_MIN_LS;
            end if;
          
          -- #########################################
          -- CHANGE_MIN_MS clock : increment or decrement based on upDownEn
          when CHANGE_MIN_MS =>
            runFlag    <= '1';
            setFlags   <= "0000";       -- digit X---
                 
            -- Update state
            if (btnSet = '1') then
                s_nextState <= STOPPED;
            else
                s_nextState <= CHANGE_MIN_MS;
            end if;
         
         -- #########################################
         -- Fallback situation 
         when others =>
            s_nextState <= STOPPED;
         end case;
                
    end process;

    -- #########################################
    -- Change Seconds/Minutes Increment/Decrements
    -- Thanks to prof. Arnaldo for this suggestion to make
    -- the code easier to maintain

    -- Ignores both keys being pressed ( btnUp != btnDown is verified )
    setFlags <= s_setFlags;
     
    secLSSetInc <= s_setFlags(0) and upDownEn = '1' and btnUp = '1' and btnDown = '0';
    secLSSetDec <= s_setFlags(0) and upDownEn = '1' and btnUp = '0' and btnDown = '1';

    secMSSetInc <= s_setFlags(1) and upDownEn = '1' and btnUp = '1' and btnDown = '0';
    secMSSetDec <= s_setFlags(1) and upDownEn = '1' and btnUp = '0' and btnDown = '1';

    minLSSetInc <= s_setFlags(2) and upDownEn = '1' and btnUp = '1' and btnDown = '0';
    minLSSetDec <= s_setFlags(2) and upDownEn = '1' and btnUp = '0' and btnDown = '1';

    minMSSetInc <= s_setFlags(3) and upDownEn = '1' and btnUp = '1' and btnDown = '0';
    minMSSetDec <= s_setFlags(3) and upDownEn = '1' and btnUp = '0' and btnDown = '1'; 

end Behavioral;

