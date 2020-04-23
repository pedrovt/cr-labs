library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Nexys4DisplayDriver is
  port(clk       : in  std_logic;
       enable    : in std_logic;
       digitEn   : in  std_logic_vector(7 downto 0);
       digVal0   : in  std_logic_vector(3 downto 0);
       digVal1   : in  std_logic_vector(3 downto 0);
       digVal2   : in  std_logic_vector(3 downto 0);
       digVal3   : in  std_logic_vector(3 downto 0);
       digVal4   : in  std_logic_vector(3 downto 0);
       digVal5   : in  std_logic_vector(3 downto 0);
       digVal6   : in  std_logic_vector(3 downto 0);
       digVal7   : in  std_logic_vector(3 downto 0);
       decPtEn   : in  std_logic_vector(7 downto 0);
       dispEn_n  : out std_logic_vector(7 downto 0);
       dispSeg_n : out std_logic_vector(6 downto 0);
       dispPt_n  : out std_logic);
end Nexys4DisplayDriver;

architecture Behavioral of Nexys4DisplayDriver is
    signal s_enableDigit : STD_LOGIC;
    signal s_currentV    : STD_LOGIC_VECTOR(3 downto 0);
    signal s_counter     : unsigned(2 downto 0) := "000";
    signal s_DispSeg     : STD_LOGIC_VECTOR(6 downto 0);

begin

    -- 3bit Counter
    ctr3b:  process(clk, enable)
            begin
                if (rising_edge(clk) and enable = '1') then
                    s_counter <= s_counter + 1;
                end if;
            end process;
    
    -- Decoder 3 to 8 for clock
    dc3t8:  process(s_counter)
            begin
                case s_counter is
                    when "000" => dispEn_n <= "11111110";
                    when "001" => dispEn_n <= "11111101";
                    when "010" => dispEn_n <= "11111011";
                    when "011" => dispEn_n <= "11110111";
                    when "100" => dispEn_n <= "11101111";
                    when "101" => dispEn_n <= "11011111";
                    when "110" => dispEn_n <= "10111111";
                    when "111" => dispEn_n <= "01111111";
                end case;
            end process;

    -- Mux 8:1 for DigValue Selection
    dvMux: process(s_counter, digVal0, digVal1, digVal2, digVal3, digVal4, digVal5, digVal6, digVal7)
            begin
                case s_counter is
                    when "000" => s_currentV <= digVal0;
                    when "001" => s_currentV <= digVal1;
                    when "010" => s_currentV <= digVal2;
                    when "011" => s_currentV <= digVal3;
                    when "100" => s_currentV <= digVal4;
                    when "101" => s_currentV <= digVal5;
                    when "110" => s_currentV <= digVal6;
                    when "111" => s_currentV <= digVal7;
                end case;
            end process;


    -- Mux 8:1 for Enable Selection
    dgMux:  process(digitEn, s_counter)
            begin
                case s_counter is
                    when "000" => s_enableDigit <= digitEn(0);
                    when "001" => s_enableDigit <= digitEn(1);
                    when "010" => s_enableDigit <= digitEn(2);
                    when "011" => s_enableDigit <= digitEn(3);
                    when "100" => s_enableDigit <= digitEn(4);
                    when "101" => s_enableDigit <= digitEn(5);
                    when "110" => s_enableDigit <= digitEn(6);
                    when "111" => s_enableDigit <= digitEn(7);
                end case;
            end process;

    -- Mux 8:1 for point selection
    ptMux:  process(decPtEn, s_counter)
            begin
                case s_counter is
                    when "000" => dispPt_n <= not decPtEn(0);
                    when "001" => dispPt_n <= not decPtEn(1);
                    when "010" => dispPt_n <= not decPtEn(2);
                    when "011" => dispPt_n <= not decPtEn(3);
                    when "100" => dispPt_n <= not decPtEn(4);
                    when "101" => dispPt_n <= not decPtEn(5);
                    when "110" => dispPt_n <= not decPtEn(6);
                    when "111" => dispPt_n <= not decPtEn(7);
                end case;
            end process;

    -- Binary Segment Decoder 
    segDec: process(s_currentV)
            begin
                case s_currentV is 
                    when "0000" => s_DispSeg <= "1000000";     -- 0 
                    when "0001" => s_DispSeg <= "1111001";     -- 1
                    when "0010" => s_DispSeg <= "0100100";     -- 2
                    when "0011" => s_DispSeg <= "0110000";     -- 3
                    when "0100" => s_DispSeg <= "0011001";     -- 4
                    when "0101" => s_DispSeg <= "0010010";     -- 5
                    when "0110" => s_DispSeg <= "0000010";     -- 6
                    when "0111" => s_DispSeg <= "1111000";     -- 7
                    when "1000" => s_DispSeg <= "0000000";     -- 8
                    when "1001" => s_DispSeg <= "0010000";     -- 9
                    when "1010" => s_DispSeg <= "0001000";     -- A
                    when "1011" => s_DispSeg <= "0000011";     -- B
                    when "1100" => s_DispSeg <= "1000110";     -- C
                    when "1101" => s_DispSeg <= "0100001";     -- D
                    when "1110" => s_DispSeg <= "0000110";     -- E
                    when "1111" => s_DispSeg <= "0001110";     -- F
                    when others => s_DispSeg <= "1111111";     -- NOTHING
                end case;
            end process;
    
    -- MUX 2:1 for segment
    sgMux: process(s_DispSeg, s_enableDigit)
           begin
              if (s_enableDigit = '1') then
                dispSeg_n <= s_DispSeg;
              else
                dispSeg_n <= "1111111";
              end if;
           end process;

end Behavioral;
