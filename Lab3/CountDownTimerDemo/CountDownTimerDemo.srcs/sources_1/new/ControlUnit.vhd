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
            
            secLSSetInc <= '0';
            secLSSetDec <= '0';
            secMSSetInc <= '0';
            secMSSetDec <= '0';
            minLSSetInc <= '0';
            minLSSetDec <= '0';
            minMSSetInc <= '0';
            minMSSetDec <= '0'; 
            
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
            
            secLSSetInc <= '0';
            secLSSetDec <= '0';
            secMSSetInc <= '0';
            secMSSetDec <= '0';
            minLSSetInc <= '0';
            minLSSetDec <= '0';
            minMSSetInc <= '0';
            minMSSetDec <= '0'; 
            
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
            
            -- enabled increment
            if (upDownEn = '1') then
            
                -- increment
                if (btnUp = '1') then
                    secLSSetInc <= '1';
                    secLSSetDec <= '0';
                    
                -- decrement 
                elsif (btnDown = '1') then
                    secLSSetInc <= '0';
                    secLSSetDec <= '1';
                
                -- do nothing
                else 
                    secLSSetInc <= '0';
                    secLSSetDec <= '0';
                end if;
            end if;
            
            -- keep other increments/decrements at 0
            secMSSetInc <= '0';
            secMSSetDec <= '0';
            minLSSetInc <= '0';
            minLSSetDec <= '0';
            minMSSetInc <= '0';
            minMSSetDec <= '0'; 
            
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
            
            -- enabled increment
            if (upDownEn = '1') then
            
                -- increment
                if (btnUp = '1') then
                    secMSSetInc <= '1';
                    secMSSetDec <= '0';
                    
                -- decrement 
                elsif (btnDown = '1') then
                    secMSSetInc <= '0';
                    secMSSetDec <= '1';
                
                -- do nothing
                else 
                    secLSSetInc <= '0';
                    secLSSetDec <= '0';
                end if;
            end if;
            
            -- keep other increments/decrements at 0
            secLSSetInc <= '0';
            secLSSetDec <= '0';
            minLSSetInc <= '0';
            minLSSetDec <= '0';
            minMSSetInc <= '0';
            minMSSetDec <= '0'; 
            
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
            
            -- enabled increment
            if (upDownEn = '1') then
            
                -- increment
                if (btnUp = '1') then
                    minLSSetInc <= '1';
                    minLSSetDec <= '0';
                    
                -- decrement 
                elsif (btnDown = '1') then
                    minLSSetInc <= '0';
                    minLSSetDec <= '1';
                
                -- do nothing
                else 
                    minLSSetInc <= '0';
                    minLSSetDec <= '0';
                end if;
            end if;
            
            -- keep other increments/decrements at 0
            secLSSetInc <= '0';
            secLSSetDec <= '0';
            secMSSetInc <= '0';
            secMSSetDec <= '0';
            minMSSetInc <= '0';
            minMSSetDec <= '0'; 
            
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
            
            -- enabled increment
            if (upDownEn = '1') then
            
                -- increment
                if (btnUp = '1') then
                    minMSSetInc <= '1';
                    minMSSetDec <= '0';
                    
                -- decrement 
                elsif (btnDown = '1') then
                    minMSSetInc <= '0';
                    minMSSetDec <= '1';
                
                -- do nothing
                else 
                    minMSSetInc <= '0';
                    minMSSetDec <= '0';
                end if;
            end if;
            
            -- keep other increments/decrements at 0
            secLSSetInc <= '0';
            secLSSetDec <= '0';
            secMSSetInc <= '0';
            secMSSetDec <= '0';
            minLSSetInc <= '0';
            minLSSetDec <= '0'; 
            
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
end Behavioral;

