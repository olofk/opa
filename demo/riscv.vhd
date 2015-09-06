-- AUTOGENERATED FILE (from genramvhd.c run on riscv.bin) --
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package demo_pkg is
  type t_word_array is array(natural range <>) of std_logic_vector(63 downto 0);
  constant demo : t_word_array(63 downto 0) := (
     0 => x"ffc1011300020137",  1 => x"0d0005930d000513",
     2 => x"0005202300b50863",  3 => x"feb54ce300450513",
     4 => x"0000006f010000ef",  5 => x"0000000000000000",
     6 => x"020706130a000713",  7 => x"0006059300060813",
     8 => x"000005130a000793",  9 => x"0000001300000013",
    10 => x"0005c88300079683", 11 => x"0015859300278793",
    12 => x"00d50533031686b3", 13 => x"00000013fef814e3",
    14 => x"0006468300071783", 15 => x"0016061300270713",
    16 => x"00f5053302d787b3", 17 => x"00008067fee814e3",
    18 => x"6f77206f6c6c6568", 19 => x"0000000000646c72",
    20 => x"fffd0002ffff0000", 21 => x"fff90006fffb0004",
    22 => x"fff5000afff70008", 23 => x"fff1000efff3000c",
    24 => x"f9fa0504fdfe0100", 25 => x"f1f20d0cf5f60908",
    26 => x"0000000000000000", 27 => x"0000000000000000",
    28 => x"0000000000000000", 29 => x"0000000000000000",
    30 => x"0000000000000000", 31 => x"0000000000000000",
    32 => x"0000000000000000", 33 => x"0000000000000000",
    34 => x"0000000000000000", 35 => x"0000000000000000",
    36 => x"0000000000000000", 37 => x"0000000000000000",
    38 => x"0000000000000000", 39 => x"0000000000000000",
    40 => x"0000000000000000", 41 => x"0000000000000000",
    42 => x"0000000000000000", 43 => x"0000000000000000",
    44 => x"0000000000000000", 45 => x"0000000000000000",
    46 => x"0000000000000000", 47 => x"0000000000000000",
    48 => x"0000000000000000", 49 => x"0000000000000000",
    50 => x"0000000000000000", 51 => x"0000000000000000",
    52 => x"0000000000000000", 53 => x"0000000000000000",
    54 => x"0000000000000000", 55 => x"0000000000000000",
    56 => x"0000000000000000", 57 => x"0000000000000000",
    58 => x"0000000000000000", 59 => x"0000000000000000",
    60 => x"0000000000000000", 61 => x"0000000000000000",
    62 => x"0000000000000000", 63 => x"0000000000000000");
end demo_pkg;
