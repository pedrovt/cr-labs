library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RegInputsCore is
    port(clk    : in  std_logic;
         reset  : in  std_logic;
         enable : in  std_logic;
         cnt1   : out std_logic_vector(3 downto 0);
         cnt2   : out std_logic_vector(3 downto 0);
         cntSum : out std_logic_vector(4 downto 0));
end RegInputsCore;

architecture Behavioral of RegInputsCore is

    signal s_cnt1, s_cnt2 : unsigned(3 downto 0);

begin
    process(clk)
    begin
        if (rising_edge(clk)) then
            if (reset = '1') then
                s_cnt1 <= "0000";
                s_cnt2 <= "0000";
            elsif (enable = '1') then
                s_cnt1 <= s_cnt1 + 1;
                s_cnt2 <= s_cnt2 - 1;
            end if;          
        end if;
    end process;
     
    cnt1 <= std_logic_vector(s_cnt1);
    cnt2 <= std_logic_vector(s_cnt2);

    cntSum <= std_logic_vector(('0' & s_cnt1) + ('0' & s_cnt2));
end Behavioral;
