library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity CombMultDiv is
   port(clk  : in  std_logic;
        btnC : in  std_logic;
        sw   : in  std_logic_vector(15 downto 0);
        led  : out std_logic_vector(15 downto 0));
end CombMultDiv;

architecture Behavioral of CombMultDiv is

   signal s_btnC         : std_logic;
   signal s_sw           : std_logic_vector(15 downto 0);
   signal s_multResult   : std_logic_vector(15 downto 0);
   signal s_divQuotient  : std_logic_vector(7 downto 0);
   signal s_divRemainder : std_logic_vector(7 downto 0);

begin
   process(clk)
   begin
      if (rising_edge(clk)) then
         s_btnC <= btnC;
         s_sw   <= sw;
      end if;
   end process;

   s_multResult   <= std_logic_vector(unsigned(s_sw(7 downto 0))  *  unsigned(s_sw(15 downto 8)));
   s_divQuotient  <= std_logic_vector(unsigned(s_sw(7 downto 0))  /  unsigned(s_sw(15 downto 8)));
   s_divRemainder <= std_logic_vector(unsigned(s_sw(7 downto 0)) rem unsigned(s_sw(15 downto 8)));

   process(clk)
   begin
      if (rising_edge(clk)) then
         if (s_btnC = '1') then
            led <= s_multResult;
         else
            led <= s_divRemainder & s_divQuotient;
         end if;
      end if;
   end process;
end Behavioral;
