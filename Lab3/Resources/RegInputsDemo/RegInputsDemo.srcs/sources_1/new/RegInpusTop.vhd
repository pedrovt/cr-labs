library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegInpusTop is
    port(clk : in  std_logic;
         sw  : in  std_logic_vector(1 downto 0);
         led : out std_logic_vector(12 downto 0));
end RegInpusTop;

architecture Shell of RegInpusTop is

    component clk_wiz_0
        port(clk_in1  : in     std_logic;
             reset    : in     std_logic;
             clk_out1 : out    std_logic);
    end component;
    
    signal s_asyncEn : std_logic;
    signal s_syncEn : std_logic;

begin
    system_core : entity work.RegInputsCore(Behavioral)
        port map(clk    => clk,
                 reset  => sw(0),
                 enable => s_syncEn,
                 cnt1   => led(3 downto 0),
                 cnt2   => led(7 downto 4),
                 cntSum => led(12 downto 8));
                 
    ext_async_sig_emulator : clk_wiz_0
        port map(clk_in1  => clk,
                 reset    => sw(1),
                 clk_out1 => s_asyncEn);
                 
    process(clk)
    begin
        if (rising_edge(clk)) then
            s_syncEn <= s_asyncEn;
        end if;
    end process;
end Shell;
