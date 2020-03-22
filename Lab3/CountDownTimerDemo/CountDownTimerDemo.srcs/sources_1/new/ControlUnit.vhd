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

architecture Behavioral of ControlUnit is

    type TState is (STOPPED, RUNNING, CHANGE_SEC_LS, CHANGE_SEC_MS, CHANGE_MIN_LS, CHANGE_MIN_MS);
    signal s_currentState, s_nextState : TState;
    signal s_setFlags : std_logic_vector(3 downto 0);
    
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
            s_setFlags <= "0000"; 
            
            -- Update state
            if (btnStart = '1' and zeroFlag = '0') then
                s_nextState <= RUNNING;
            elsif (btnSet = '1') then
                s_nextState <= CHANGE_SEC_LS;
                s_SetFlags <= "0001"; 
            else
                s_nextState <= STOPPED;
            end if;
        
        -- #########################################
        -- RUNNING clock : no increment or decrement. no adjustments allowed
        when RUNNING =>
            
            s_setFlags <= "0000"; 
            
            -- Update state
            if (btnStart = '1' or zeroFlag = '1') then
                s_nextState <= STOPPED;
            else
                runFlag    <= '1';
                s_nextState <= RUNNING;
            end if;
            
        -- #########################################
        -- CHANGE_SEC_LS clock : increment or decrement based on upDownEn
        when CHANGE_SEC_LS =>
           
            s_setFlags <= "0001";       -- digit ---X
             
            -- Update state
            if (btnSet = '1') then
                s_nextState <= CHANGE_SEC_MS;
                s_setFlags <= "0010";
            else
                s_nextState <= CHANGE_SEC_LS;
            end if;
         
        -- #########################################
        -- CHANGE_SEC_MS clock : increment or decrement based on upDownEn
         when CHANGE_SEC_MS =>
          
            s_setFlags <= "0010";       -- digit --X-
               
            -- Update state
            if (btnSet = '1') then
                s_nextState <= CHANGE_MIN_LS;
                s_setFlags <= "0100";
            else
                s_nextState <= CHANGE_SEC_MS;
            end if;
          
          -- #########################################
          -- CHANGE_MIN_LS clock : increment or decrement based on upDownEn
          when CHANGE_MIN_LS =>
           
            s_setFlags <= "0100";       -- digit -X--
            
            -- Update state
            if (btnSet = '1') then
                s_nextState <= CHANGE_MIN_MS;
                s_setFlags <= "1000";
            else
                s_nextState <= CHANGE_MIN_LS;
            end if;
          
          -- #########################################
          -- CHANGE_MIN_MS clock : increment or decrement based on upDownEn
          when CHANGE_MIN_MS =>

            s_setFlags <= "1000"; 
            
            -- Update state
            if (btnSet = '1') then
                s_nextState <= STOPPED;
                s_setFlags <= "0000";
            else
                s_nextState <= CHANGE_MIN_MS;
            end if;
         
         -- #########################################
         -- Fallback situation 
         when others =>
         
            s_setFlags <= "0000"; 
            s_nextState <= STOPPED;
         end case;
                
    end process;

    -- #########################################
    -- Change Seconds/Minutes Increment/Decrements
    -- Thanks to prof. Arnaldo for this suggestion to make
    -- the code easier to maintain

    -- Ignores both keys being pressed ( btnUp != btnDown is verified )
    setFlags <= s_setFlags;
     
    secLSSetInc <= s_setFlags(0) and upDownEn  and btnUp ;
    secLSSetDec <= s_setFlags(0) and upDownEn  and btnDown;

    secMSSetInc <= s_setFlags(1) and upDownEn  and btnUp ;
    secMSSetDec <= s_setFlags(1) and upDownEn  and btnDown;

    minLSSetInc <= s_setFlags(2) and upDownEn  and btnUp ;
    minLSSetDec <= s_setFlags(2) and upDownEn  and btnDown;

    minMSSetInc <= s_setFlags(3) and upDownEn  and btnUp ;
    minMSSetDec <= s_setFlags(3) and upDownEn  and btnDown; 

end Behavioral;

