----------------------------------------------------------------------------------
-- Author: Paulo Vasconcelos
-- Date: 2020 march
----------------------------------------------------------------------------------


-- ==========================
-- = NEXYS 4 DISPLAY DRIVER =
-- ==========================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nexys4DisplayDriver is
    port(   clk         : in  std_logic;
            enable      : in  std_logic;
            digitEn     : in  std_logic_vector(7 downto 0);
            digVal0     : in  std_logic_vector(3 downto 0);
            digVal1     : in  std_logic_vector(3 downto 0);
            digVal2     : in  std_logic_vector(3 downto 0);
            digVal3     : in  std_logic_vector(3 downto 0);
            digVal4     : in  std_logic_vector(3 downto 0);
            digVal5     : in  std_logic_vector(3 downto 0);
            digVal6     : in  std_logic_vector(3 downto 0);
            digVal7     : in  std_logic_vector(3 downto 0);
            decPtEn     : in  std_logic_vector(7 downto 0);
            dispEn_n    : out std_logic_vector(7 downto 0);
            dispSeg_n   : out std_logic_vector(6 downto 0);
            dispPt_n    : out std_logic);
end Nexys4DisplayDriver;

architecture Structural of Nexys4DisplayDriver is

    component binaryCounter3Bits
        port(   clk : in  std_logic;
                o   : out std_logic_vector(2 downto 0));
    end component;

    component sevenSegDecoder
        port(   i   : in  std_logic_vector(3 downto 0);
                o   : out std_logic_vector(6 downto 0));
    end component;

    component decoder3to8
        port(   s   : in  std_logic_vector(2 downto 0);
                o   : out std_logic_vector(7 downto 0));
    end component;

    component mux8to1
        port(   x000,x001,x010,x011,x000,x001,x010,x011 : in  std_logic;
                s                                       : in  std_logic_vector(2 downto 0);
                o                                       : out std_logic);
    end component;

    component mux32to4
        port(   x000,x001,x010,x011,x000,x001,x010,x011 : in  std_logic_vector(3 downto 0);
                s                                       : in  std_logic_vector(2 downto 0);
                o                                       : out std_logic_vector(3 downto 0));
    end component;

    component mux14to7
        port(   x0,x1   : in  std_logic_vector(6 downto 0);
                s       : in  std_logic;
                o       : out std_logic_vector(6 downto 0));
    end component;

    signal s_counter        : std_logic_vector(2 downto 0);
    signal s_digValMuxed    : std_logic_vector(3 downto 0);
    signal s_digValDecoded  : std_logic_vector(6 downto 0);
    signal s_nDispPt_n      : std_logic;
    signal s_nDispEn_n      : std_logic_vector(7 downto 0);
    signal s_enabledClock   : std_logic;

begin

    binCounter  : binaryCounter3Bits    port map (s_enabledClock,s_counter);
    sevSegDec   : sevenSegDecoder       port map (s_digValMuxed,s_digValDecoded);
    dec3to8     : decoder3to8           port map (s_counter,s_nDispEn_n);
    pointMux    : mux8to1               port map (decPtEn(0),decPtEn(1),decPtEn(2),decPtEn(3),decPtEn(4),decPtEn(5),decPtEn(6),decPtEn(7),s_counter,s_nDispPt_n);
    digitMux    : mux8to1               port map (digitEn(0),digitEn(1),digitEn(2),digitEn(3),digitEn(4),digitEn(5),digitEn(6),digitEn(7),s_counter,s_nDispEn_n);
    muxDigVal   : mux32to4              port map (digVal0,digVal1,digVal2,digVal3,digVal4,digVal5,digVal6,digVal7,s_counter,s_digValMuxed);
    muxDigClean : mux14to7              port map ('1111111',s_digValMuxed,dispSeg_n);

    s_enabledClock  <= clk and enable;
    dispPt_n        <= not s_nDispPt_n;
    dispEn_n        <= not s_nDispEn_n;

end Structural;



-- =========================
-- = BINARY COUNTER 3 BITS =
-- =========================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity binaryCounter3Bits is
    port(   clk  : in  std_logic;
            o    : out std_logic_vector(2 downto 0));
end binaryCounter3Bits;

architecture Behavioral of binaryCounter3Bits is

    signal count : std_logic_vector(2 downto 0);

begin

    process(clk)
    begin
        if(clk'Event and clk='1') then
            count <= count+'1';
        end if;
    end process;

    o <= count;

end Behavioral;

architecture Structural of binaryCounter3Bits is

    component flipFlopDPET is
        port(   clk, D      : in  std_logic;
                nSet, nRst  : in  std_logic;
                Q, nQ       : out std_logic);
    end component;

    signal s_ff0,s_ff1,s_ff2 : std_logic;
    signal s_nff0,s_nff1,s_nff2 : std_logic;

begin

    ff0 : flipFlopDPET port map (clk,s_nff0,'1','1',s_ff0,s_nff0);
    ff1 : flipFlopDPET port map (s_nff0,s_nff1,'1','1',s_ff1,s_nff1);
    ff2 : flipFlopDPET port map (s_nff1,s_nff2,'1','1',s_ff2,s_nff2);

    o(0) <= s_ff0;
    o(1) <= s_ff1;
    o(2) <= s_ff2;

end Structural;



-- ===============
-- = FLIP-FLOP D =
-- ===============
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flipFlopDPET is
    port(   clk, D      : in  std_logic;
            nSet, nRst  : in  std_logic;
            Q, nQ       : out std_logic);
end flipFlopDPET;

architecture Behavior of flipFlopDPET is

begin
  
    process(clk, nSet, nRst)
    begin
        if(nRst='0') then
            Q <= '0';
            nQ <= '1';
        elsif(nSet = '0') then
            Q <= '1';
            nQ <= '0';
        elsif((clk = '1')and(clk'EVENT)) then
            Q <= D;
            nQ <= not D;
        end if;
    end process;

end Behavior;



-- ==========================
-- = SEVEN SEGMENTS DECODER =
-- ==========================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevenSegDecoder is
    port ( i    : in  std_logic_vector(3 downto 0);
           o    : out std_logic_vector(6 downto 0));
end sevenSegDecoder;

architecture Behavioral of sevenSegDecoder is

begin
    
    process(i)
        type values is array(0 to 15) of std_logic_vector(6 downto 0);
        variable prog: values := (  conv_std_logic_vector("1000000", 7), -- 0
                                    conv_std_logic_vector("1111001", 7), -- 1
                                    conv_std_logic_vector("0100100", 7), -- 2
                                    conv_std_logic_vector("0110000", 7), -- 3
                                    conv_std_logic_vector("0011001", 7), -- 4
                                    conv_std_logic_vector("0010010", 7), -- 5
                                    conv_std_logic_vector("0000010", 7), -- 6
                                    conv_std_logic_vector("1111000", 7), -- 7
                                    conv_std_logic_vector("0000000", 7), -- 8
                                    conv_std_logic_vector("0010000", 7), -- 9
                                    conv_std_logic_vector("0001000", 7), -- A
                                    conv_std_logic_vector("0000011", 7), -- B
                                    conv_std_logic_vector("1000110", 7), -- C
                                    conv_std_logic_vector("0100001", 7), -- D
                                    conv_std_logic_vector("0000110", 7), -- E
                                    conv_std_logic_vector("0001110", 7));-- F
        variable pos: INTEGER;
    begin
        pos := conv_integer(add);
        dOut <= prog(pos);
    end process;

end Behavioral;



-- ==================
-- = DECODER 3 TO 8 =
-- ==================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder3to8 is
    port(   s   : in  std_logic_vector(2 downto 0);
            o   : out std_logic_vector(7 downto 0));
end decoder3to8;

architecture Logic of decoder3to8 is

begin

    o(0) <= (not s(2)) and (not s(1)) and (not s(0));
    o(1) <= (not s(2)) and (not s(1)) and      s(0);
    o(2) <= (not s(2)) and      s(1)  and (not s(0));
    o(3) <= (not s(2)) and      s(1)  and      s(0);
    o(4) <=      s(2)  and (not s(1)) and (not s(0));
    o(5) <=      s(2)  and (not s(1)) and      s(0);
    o(6) <=      s(2)  and      s(1)  and (not s(0));
    o(7) <=      s(2)  and      s(1)  and      s(0);

end Logic;



-- ==================
-- = DECODER 3 TO 8 =
-- ==================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder3to8 is
    port(   s   : in  std_logic_vector(2 downto 0);
            o   : out std_logic_vector(7 downto 0));
end decoder3to8;

architecture Logic of decoder3to8 is

begin

    o(0) <= (not s(2)) and (not s(1)) and (not s(0));
    o(1) <= (not s(2)) and (not s(1)) and      s(0);
    o(2) <= (not s(2)) and      s(1)  and (not s(0));
    o(3) <= (not s(2)) and      s(1)  and      s(0);
    o(4) <=      s(2)  and (not s(1)) and (not s(0));
    o(5) <=      s(2)  and (not s(1)) and      s(0);
    o(6) <=      s(2)  and      s(1)  and (not s(0));
    o(7) <=      s(2)  and      s(1)  and      s(0);

end Logic;



-- ==============
-- = MUX 2 TO 1 =
-- ==============
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2to1 is
    port(   x0,x1   : in  std_logic;
            s       : in  std_logic;
            o       : out std_logic);
end mux2to1;

architecture Logic of mux2to1 is

begin

    o <= (x0 and not s) or (x1 and s);

end Logic;



-- ==============
-- = MUX 4 TO 1 =
-- ==============
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4to1 is
    port(   x00,x01,x10,x11 : in  std_logic;
            s               : in  std_logic_vector(1 downto 0);
            o               : out std_logic);
end mux4to1;

architecture Structural of mux4to1 is

    component mux2to1 is
        port(   x0,x1   : in  std_logic;
                s       : in  std_logic;
                o       : out std_logic);
    end component;

    signal mOut0,mOut1 : std_logic;

begin

    mux0 : mux2to1 port map (x00,x01,s(0),mOut0);
    mux1 : mux2to1 port map (x10,x11,s(0),mOut1);
    mux2 : mux2to1 port map (mOut0,mOut1,s(1),o);

end Structural;



-- ==============
-- = MUX 8 TO 1 =
-- ==============
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8to1 is
    port(   x000,x001,x010,x011,x100,x101,x110,x111 : in  std_logic;
            s                                       : in  std_logic_vector(2 downto 0);
            o                                       : out std_logic);
end mux8to1;

architecture Structural of mux8to1 is

    component mux2to1 is
        port(   x00,x01,x10,x11 : in  std_logic;
                s               : in  std_logic_vector(1 downto 0);
                o               : out std_logic);
    end component;

    component mux4to1 is
        port(   x0,x1   : in  std_logic;
                s       : in  std_logic;
                o       : out std_logic);
    end component;

    signal mOut0,mOut1 : std_logic;

begin

    mux0 : mux4to1 port map (x000,x001,x010,x011,s(1 downto 0),mOut0);
    mux1 : mux4to1 port map (x100,x101,x110,x111,s(1 downto 0),mOut1);
    mux2 : mux2to1 port map (mOut0,mOut1,s(2),o);

end Structural;



-- ===============
-- = MUX 32 TO 4 =
-- ===============
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux32to4 is
    port(   x000,x001,x010,x011,x100,x101,x110,x111 : in  std_logic_vector(3 downto 0);
            s                                       : in  std_logic_vector(2 downto 0);
            o                                       : out std_logic_vector(3 downto 0));
end mux32to4;

architecture Structural of mux32to4 is

    component mux8to1 is
        port(   x000,x001,x010,x011,x100,x101,x110,x111 : in  std_logic;
                s                                       : in  std_logic_vector(2 downto 0);
                o                                       : out std_logic);
    end component;

begin

    mux0 : mux8to1 port map (x000(0),x001(0),x010(0),x011(0),x100(0),x101(0),x110(0),x111(0),s,o(0));
    mux1 : mux8to1 port map (x000(1),x001(1),x010(1),x011(1),x100(1),x101(1),x110(1),x111(1),s,o(1));
    mux2 : mux8to1 port map (x000(2),x001(2),x010(2),x011(2),x100(2),x101(2),x110(2),x111(2),s,o(2));
    mux3 : mux8to1 port map (x000(3),x001(3),x010(3),x011(3),x100(3),x101(3),x110(3),x111(3),s,o(3));

end Structural;



-- ===============
-- = MUX 14 TO 7 =
-- ===============
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux14to7 is
    port(   x0, x1  : in  std_logic_vector(6 downto 0);
            s       : in  std_logic;
            o       : out std_logic_vector(6 downto 0));
end mux14to7;

architecture Structural of mux14to7 is

    component mux2to1 is
        port(   x0,x1   : in  std_logic;
                s       : in  std_logic;
                o       : out std_logic);
    end component;

begin

    mux0 : mux2to1 port map (x0(0),x1(0),s,o(0));
    mux1 : mux2to1 port map (x0(1),x1(1),s,o(1));
    mux2 : mux2to1 port map (x0(2),x1(2),s,o(2));
    mux3 : mux2to1 port map (x0(3),x1(3),s,o(3));
    mux4 : mux2to1 port map (x0(4),x1(4),s,o(4));
    mux5 : mux2to1 port map (x0(5),x1(5),s,o(5));
    mux6 : mux2to1 port map (x0(6),x1(6),s,o(6));

end Structural;