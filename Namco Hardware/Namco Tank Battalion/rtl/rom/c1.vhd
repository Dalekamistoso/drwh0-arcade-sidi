library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity c1 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of c1 is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"60",X"CA",X"88",X"10",X"F8",X"60",X"A9",X"00",X"A2",X"0F",X"95",X"00",X"CA",X"10",X"FB",X"A9",
		X"00",X"A0",X"0B",X"84",X"1F",X"A0",X"00",X"84",X"1E",X"A2",X"04",X"88",X"91",X"1E",X"D0",X"FB",
		X"C6",X"1F",X"CA",X"D0",X"F6",X"60",X"A0",X"40",X"A2",X"08",X"84",X"28",X"86",X"29",X"A0",X"FF",
		X"C8",X"A5",X"28",X"29",X"20",X"F0",X"03",X"A9",X"EA",X"2C",X"A9",X"DA",X"18",X"20",X"24",X"74",
		X"C0",X"1F",X"90",X"EC",X"20",X"6E",X"74",X"A5",X"29",X"C9",X"0B",X"D0",X"E1",X"A5",X"28",X"C9",
		X"C0",X"90",X"DB",X"60",X"20",X"5E",X"70",X"24",X"B5",X"10",X"02",X"49",X"FF",X"60",X"A9",X"02",
		X"25",X"60",X"18",X"F0",X"01",X"38",X"A9",X"01",X"25",X"61",X"69",X"00",X"4A",X"66",X"61",X"66",
		X"60",X"A9",X"4A",X"25",X"60",X"D0",X"06",X"A9",X"43",X"65",X"61",X"85",X"61",X"A5",X"60",X"85",
		X"C2",X"60",X"A9",X"03",X"2C",X"A9",X"C0",X"85",X"1F",X"20",X"96",X"74",X"8D",X"18",X"0C",X"A5",
		X"1F",X"D0",X"F6",X"60",X"A2",X"04",X"2C",X"A2",X"06",X"2C",X"A2",X"0D",X"20",X"A3",X"70",X"CA",
		X"D0",X"FA",X"60",X"A9",X"01",X"8D",X"0A",X"0C",X"A9",X"00",X"8D",X"09",X"0C",X"8D",X"0C",X"0C",
		X"8D",X"0D",X"0C",X"2C",X"A9",X"50",X"38",X"48",X"E9",X"01",X"D0",X"FC",X"68",X"E9",X"01",X"8D",
		X"18",X"0C",X"08",X"48",X"AD",X"0F",X"0C",X"30",X"03",X"4C",X"43",X"7D",X"A5",X"B8",X"30",X"07",
		X"A5",X"C0",X"F0",X"03",X"4C",X"1D",X"6C",X"68",X"28",X"D0",X"DC",X"60",X"A9",X"10",X"84",X"1E",
		X"86",X"1F",X"A0",X"1B",X"91",X"1E",X"88",X"10",X"FB",X"60",X"A2",X"08",X"A0",X"42",X"20",X"DC",
		X"70",X"A2",X"0B",X"A0",X"A2",X"20",X"DE",X"70",X"A0",X"82",X"20",X"FF",X"70",X"A0",X"9D",X"48",
		X"84",X"1E",X"A0",X"0B",X"84",X"1F",X"A0",X"00",X"A2",X"1B",X"68",X"91",X"1E",X"48",X"20",X"AE",
		X"74",X"CA",X"D0",X"F6",X"68",X"60",X"A5",X"A3",X"24",X"CE",X"30",X"05",X"F8",X"18",X"69",X"03",
		X"D8",X"60",X"A2",X"03",X"20",X"A4",X"7B",X"20",X"B5",X"6F",X"85",X"26",X"20",X"16",X"71",X"C9",
		X"0A",X"90",X"02",X"A9",X"09",X"0A",X"0A",X"0A",X"A8",X"A2",X"05",X"B9",X"CF",X"64",X"24",X"CF",
		X"30",X"03",X"B9",X"1F",X"65",X"95",X"93",X"C8",X"CA",X"10",X"F0",X"A9",X"00",X"85",X"A5",X"85",
		X"A6",X"85",X"A7",X"A5",X"93",X"20",X"90",X"71",X"BD",X"6F",X"65",X"85",X"99",X"A5",X"94",X"20",
		X"90",X"71",X"BD",X"7F",X"65",X"85",X"9A",X"A5",X"96",X"20",X"90",X"71",X"BD",X"9F",X"65",X"85",
		X"9C",X"A5",X"97",X"20",X"90",X"71",X"BD",X"AF",X"65",X"85",X"9D",X"A5",X"98",X"20",X"90",X"71",
		X"BD",X"BF",X"65",X"85",X"9E",X"A5",X"95",X"20",X"90",X"71",X"BD",X"8F",X"65",X"85",X"9B",X"60",
		X"0A",X"0A",X"65",X"26",X"AA",X"60",X"A9",X"A0",X"8D",X"A1",X"09",X"8D",X"C1",X"09",X"8D",X"E1",
		X"0A",X"8D",X"01",X"0B",X"A4",X"C9",X"D0",X"09",X"8D",X"81",X"08",X"8D",X"A1",X"08",X"20",X"D2",
		X"71",X"20",X"DA",X"71",X"30",X"2C",X"A9",X"D0",X"8D",X"3E",X"0A",X"8D",X"5E",X"0A",X"8D",X"FE",
		X"08",X"8D",X"1E",X"09",X"8D",X"5E",X"0B",X"8D",X"7E",X"0B",X"20",X"EA",X"71",X"20",X"F2",X"71",
		X"30",X"28",X"A2",X"5A",X"A9",X"A1",X"A0",X"08",X"D0",X"30",X"A2",X"42",X"A9",X"01",X"A0",X"0B",
		X"D0",X"28",X"A2",X"25",X"A9",X"C1",X"A0",X"09",X"D0",X"20",X"A2",X"5A",X"A9",X"BE",X"A0",X"0A",
		X"D0",X"0E",X"A2",X"42",X"A9",X"5E",X"A0",X"08",X"D0",X"06",X"A2",X"25",X"A9",X"9E",X"A0",X"09",
		X"84",X"2B",X"A0",X"20",X"84",X"25",X"A0",X"00",X"F0",X"08",X"84",X"2B",X"A0",X"E0",X"84",X"25",
		X"A0",X"A0",X"85",X"2A",X"A9",X"02",X"85",X"2D",X"A9",X"00",X"85",X"26",X"B5",X"A0",X"48",X"4A",
		X"4A",X"4A",X"4A",X"20",X"38",X"72",X"A5",X"2D",X"D0",X"02",X"C6",X"26",X"68",X"29",X"0F",X"20",
		X"38",X"72",X"CA",X"C6",X"2D",X"10",X"E5",X"60",X"F0",X"02",X"C6",X"26",X"24",X"B5",X"10",X"03",
		X"09",X"D0",X"2C",X"09",X"A0",X"24",X"26",X"30",X"02",X"A9",X"00",X"91",X"2A",X"98",X"18",X"65",
		X"25",X"A8",X"60",X"A5",X"1E",X"95",X"6D",X"A5",X"1F",X"95",X"6E",X"A5",X"1D",X"95",X"6C",X"60",
		X"86",X"1F",X"84",X"1E",X"85",X"1D",X"A5",X"1D",X"0A",X"0A",X"65",X"18",X"A0",X"00",X"91",X"1E",
		X"69",X"01",X"C8",X"91",X"1E",X"69",X"01",X"A0",X"20",X"91",X"1E",X"C8",X"69",X"01",X"91",X"1E",
		X"60",X"84",X"21",X"86",X"22",X"A0",X"82",X"A2",X"0B",X"84",X"1E",X"86",X"1F",X"60",X"A0",X"80",
		X"A2",X"02",X"D0",X"04",X"A0",X"40",X"A2",X"05",X"20",X"81",X"72",X"A0",X"1A",X"84",X"24",X"A4",
		X"24",X"B1",X"1E",X"C9",X"11",X"90",X"02",X"A9",X"00",X"A0",X"00",X"20",X"8D",X"74",X"C6",X"24",
		X"D0",X"ED",X"20",X"DE",X"72",X"D0",X"E4",X"60",X"A0",X"80",X"A2",X"02",X"D0",X"04",X"A0",X"40",
		X"A2",X"05",X"20",X"81",X"72",X"A0",X"1A",X"84",X"24",X"A0",X"00",X"B1",X"21",X"A4",X"24",X"91",
		X"1E",X"20",X"8F",X"74",X"C6",X"24",X"D0",X"F1",X"20",X"DE",X"72",X"D0",X"E8",X"60",X"20",X"AE",
		X"74",X"C9",X"42",X"D0",X"04",X"A5",X"1F",X"C9",X"08",X"60",X"A5",X"C7",X"4C",X"FB",X"72",X"A5",
		X"B8",X"F0",X"F7",X"A6",X"A3",X"E0",X"09",X"90",X"06",X"A5",X"C2",X"29",X"07",X"10",X"0A",X"BD",
		X"F5",X"61",X"24",X"CF",X"30",X"03",X"BD",X"FE",X"61",X"0A",X"AA",X"60",X"C6",X"BA",X"20",X"EF",
		X"72",X"BD",X"07",X"62",X"A8",X"BD",X"08",X"62",X"85",X"1F",X"84",X"1E",X"A0",X"80",X"A2",X"02",
		X"A5",X"B5",X"D0",X"04",X"A5",X"BA",X"F0",X"04",X"A0",X"40",X"A2",X"05",X"84",X"21",X"86",X"22",
		X"A0",X"00",X"A2",X"55",X"86",X"23",X"A2",X"08",X"B1",X"1E",X"85",X"24",X"06",X"24",X"A9",X"00",
		X"90",X"02",X"A9",X"01",X"20",X"8D",X"74",X"CA",X"D0",X"F2",X"20",X"86",X"74",X"C6",X"23",X"D0",
		X"E5",X"86",X"BA",X"60",X"24",X"CD",X"10",X"B4",X"20",X"EF",X"72",X"BD",X"17",X"62",X"A8",X"BD",
		X"18",X"62",X"84",X"1E",X"85",X"1F",X"A0",X"40",X"A2",X"05",X"84",X"21",X"86",X"22",X"A0",X"00",
		X"A2",X"55",X"86",X"23",X"A2",X"04",X"B1",X"1E",X"4A",X"4A",X"4A",X"4A",X"10",X"04",X"A2",X"08",
		X"B1",X"1E",X"85",X"24",X"46",X"24",X"A9",X"00",X"90",X"02",X"A9",X"01",X"20",X"8D",X"74",X"CA",
		X"D0",X"F2",X"20",X"96",X"74",X"C6",X"23",X"D0",X"E5",X"60",X"86",X"2B",X"84",X"2A",X"A0",X"00",
		X"B1",X"2A",X"85",X"28",X"E6",X"2A",X"D0",X"02",X"E6",X"2B",X"B1",X"2A",X"85",X"29",X"E6",X"2A",
		X"D0",X"02",X"E6",X"2B",X"B1",X"2A",X"A8",X"A2",X"00",X"B1",X"2A",X"81",X"28",X"20",X"7A",X"74",
		X"88",X"D0",X"F6",X"60",X"B5",X"3B",X"85",X"28",X"B5",X"3C",X"85",X"29",X"60",X"A2",X"00",X"A9",
		X"80",X"A0",X"0C",X"D0",X"26",X"A2",X"8A",X"8E",X"5E",X"0A",X"E8",X"8E",X"5F",X"0A",X"A0",X"1E",
		X"84",X"28",X"A0",X"0A",X"A9",X"80",X"D0",X"11",X"A2",X"9A",X"8E",X"A0",X"09",X"E8",X"8E",X"A1",
		X"09",X"A0",X"C0",X"84",X"28",X"A0",X"09",X"A9",X"90",X"A2",X"0C",X"86",X"2E",X"D0",X"12",X"A9",
		X"90",X"A0",X"E3",X"D0",X"08",X"24",X"B5",X"30",X"F6",X"A9",X"80",X"A0",X"FB",X"84",X"28",X"A0",
		X"09",X"84",X"29",X"18",X"65",X"2E",X"A0",X"00",X"18",X"91",X"28",X"C8",X"69",X"01",X"91",X"28",
		X"A0",X"20",X"69",X"01",X"91",X"28",X"C8",X"69",X"01",X"91",X"28",X"60",X"A5",X"29",X"C9",X"0B",
		X"D0",X"08",X"A5",X"28",X"C9",X"A2",X"90",X"0C",X"B0",X"18",X"C9",X"08",X"D0",X"06",X"A5",X"28",
		X"C9",X"5E",X"90",X"0E",X"98",X"18",X"65",X"28",X"29",X"1F",X"C9",X"02",X"F0",X"04",X"C9",X"1D",
		X"D0",X"05",X"A9",X"10",X"60",X"C8",X"E8",X"B1",X"28",X"C9",X"11",X"90",X"06",X"C9",X"90",X"B0",
		X"02",X"A9",X"00",X"60",X"8A",X"0A",X"0A",X"0A",X"AA",X"A9",X"04",X"85",X"23",X"60",X"18",X"A5",
		X"28",X"69",X"20",X"90",X"02",X"E6",X"29",X"85",X"28",X"60",X"38",X"A5",X"28",X"E9",X"20",X"B0",
		X"02",X"C6",X"29",X"85",X"28",X"60",X"E6",X"1E",X"D0",X"02",X"E6",X"1F",X"60",X"91",X"21",X"E6",
		X"21",X"D0",X"02",X"E6",X"22",X"60",X"38",X"A5",X"1E",X"E9",X"01",X"B0",X"02",X"C6",X"1F",X"85",
		X"1E",X"60",X"18",X"A5",X"1E",X"69",X"20",X"90",X"02",X"E6",X"1F",X"85",X"1E",X"60",X"38",X"A5",
		X"1E",X"E9",X"20",X"B0",X"02",X"C6",X"1F",X"85",X"1E",X"60",X"86",X"1F",X"84",X"1E",X"85",X"1D",
		X"A8",X"F0",X"34",X"88",X"88",X"30",X"3A",X"F0",X"40",X"A0",X"00",X"20",X"96",X"74",X"B1",X"1E",
		X"85",X"1B",X"A0",X"20",X"B1",X"1E",X"85",X"1C",X"05",X"1B",X"8A",X"A2",X"01",X"B4",X"1B",X"F0",
		X"0C",X"C0",X"60",X"90",X"0D",X"C0",X"80",X"90",X"04",X"C0",X"A0",X"90",X"05",X"CA",X"10",X"ED",
		X"18",X"60",X"38",X"AA",X"60",X"A0",X"00",X"20",X"AE",X"74",X"B1",X"1E",X"85",X"1B",X"C8",X"D0",
		X"D3",X"A0",X"20",X"20",X"A2",X"74",X"4C",X"FA",X"74",X"20",X"86",X"74",X"A0",X"01",X"B1",X"1E",
		X"85",X"1B",X"A0",X"21",X"D0",X"BE",X"A8",X"F0",X"0F",X"88",X"88",X"30",X"14",X"F0",X"1B",X"20",
		X"C9",X"74",X"20",X"46",X"75",X"F0",X"F8",X"60",X"20",X"F5",X"74",X"20",X"46",X"75",X"F0",X"F8",
		X"60",X"20",X"01",X"75",X"20",X"46",X"75",X"F0",X"F8",X"60",X"20",X"09",X"75",X"20",X"46",X"75",
		X"F0",X"F8",X"60",X"A9",X"00",X"60",X"F0",X"FB",X"A2",X"01",X"B5",X"1B",X"C9",X"10",X"F0",X"13",
		X"90",X"F1",X"29",X"F0",X"C9",X"90",X"F0",X"12",X"C9",X"80",X"F0",X"0E",X"C9",X"40",X"F0",X"0A",
		X"CA",X"10",X"E7",X"A5",X"9D",X"C5",X"8F",X"A9",X"01",X"60",X"A5",X"60",X"C5",X"9C",X"A9",X"01",
		X"60",X"A4",X"6D",X"84",X"1E",X"A4",X"6E",X"84",X"1F",X"A4",X"6C",X"84",X"1D",X"F0",X"0F",X"88",
		X"88",X"30",X"14",X"F0",X"1B",X"20",X"C9",X"74",X"20",X"AC",X"75",X"F0",X"F8",X"60",X"20",X"F5",
		X"74",X"20",X"AC",X"75",X"F0",X"F8",X"60",X"20",X"01",X"75",X"20",X"AC",X"75",X"F0",X"F8",X"60",
		X"20",X"09",X"75",X"20",X"AC",X"75",X"F0",X"F8",X"60",X"A9",X"00",X"60",X"F0",X"FB",X"A2",X"01",
		X"B5",X"1B",X"C9",X"10",X"F0",X"0B",X"90",X"F1",X"29",X"F0",X"C9",X"50",X"F0",X"04",X"CA",X"10",
		X"EF",X"18",X"A9",X"01",X"60",X"B5",X"00",X"18",X"69",X"03",X"49",X"F8",X"29",X"F8",X"85",X"1E",
		X"A9",X"02",X"06",X"1E",X"2A",X"06",X"1E",X"2A",X"95",X"31",X"B5",X"01",X"4A",X"4A",X"4A",X"18",
		X"65",X"1E",X"95",X"30",X"60",X"B5",X"31",X"85",X"1E",X"B5",X"30",X"46",X"1E",X"6A",X"46",X"1E",
		X"6A",X"29",X"F8",X"49",X"F8",X"38",X"E9",X"01",X"95",X"00",X"B5",X"30",X"0A",X"0A",X"0A",X"18",
		X"69",X"06",X"95",X"01",X"60",X"B5",X"6C",X"49",X"01",X"C5",X"1D",X"18",X"08",X"A5",X"37",X"69",
		X"0B",X"4A",X"4A",X"4A",X"29",X"06",X"49",X"06",X"28",X"D0",X"10",X"69",X"02",X"C9",X"08",X"D0",
		X"0A",X"A4",X"A7",X"C0",X"06",X"F0",X"09",X"C0",X"0C",X"F0",X"05",X"A6",X"58",X"95",X"48",X"60",
		X"A9",X"0A",X"D0",X"F7",X"A4",X"B8",X"F0",X"0D",X"F8",X"18",X"65",X"53",X"85",X"53",X"A5",X"54",
		X"69",X"00",X"85",X"54",X"D8",X"60",X"D5",X"01",X"D0",X"0F",X"98",X"D5",X"00",X"D0",X"0A",X"A9",
		X"00",X"95",X"31",X"95",X"01",X"95",X"00",X"85",X"19",X"60",X"A9",X"08",X"A8",X"D0",X"03",X"A9",
		X"04",X"A8",X"85",X"19",X"84",X"1A",X"B5",X"36",X"C9",X"02",X"90",X"01",X"E8",X"29",X"01",X"F0",
		X"08",X"B5",X"00",X"38",X"E5",X"1A",X"95",X"00",X"60",X"A5",X"19",X"18",X"75",X"00",X"95",X"00",
		X"60",X"B5",X"30",X"85",X"1E",X"B5",X"31",X"85",X"1F",X"B5",X"36",X"85",X"1D",X"29",X"02",X"D0",
		X"03",X"A0",X"01",X"2C",X"A0",X"20",X"B1",X"1E",X"84",X"1A",X"85",X"1C",X"A0",X"00",X"84",X"19",
		X"B1",X"1E",X"85",X"1B",X"A8",X"25",X"1C",X"29",X"F0",X"AA",X"98",X"05",X"1C",X"60",X"38",X"60",
		X"B5",X"1B",X"F0",X"FA",X"C9",X"10",X"B0",X"F7",X"A4",X"1D",X"F0",X"0F",X"88",X"88",X"30",X"08",
		X"F0",X"03",X"A9",X"1A",X"2C",X"A9",X"11",X"2C",X"A9",X"08",X"2C",X"A9",X"FF",X"18",X"75",X"1B",
		X"A8",X"B9",X"EF",X"65",X"BE",X"CB",X"65",X"D0",X"02",X"49",X"FF",X"18",X"60",X"A5",X"1D",X"29",
		X"02",X"D0",X"03",X"A9",X"08",X"2C",X"A9",X"10",X"E0",X"00",X"F0",X"03",X"38",X"E9",X"04",X"A8",
		X"8A",X"49",X"01",X"AA",X"B5",X"1B",X"85",X"20",X"88",X"B9",X"13",X"66",X"30",X"06",X"C5",X"20",
		X"D0",X"F6",X"18",X"60",X"38",X"60",X"A5",X"1B",X"29",X"03",X"85",X"1B",X"A5",X"1C",X"29",X"03",
		X"85",X"1C",X"A5",X"1D",X"A0",X"00",X"29",X"02",X"D0",X"0E",X"C4",X"1B",X"F0",X"06",X"A0",X"02",
		X"C4",X"1B",X"D0",X"03",X"C8",X"C4",X"1C",X"60",X"C4",X"1B",X"F0",X"06",X"A0",X"01",X"C4",X"1B",
		X"D0",X"F5",X"C8",X"C8",X"C4",X"1C",X"60",X"A4",X"1B",X"F0",X"12",X"88",X"88",X"30",X"05",X"F0",
		X"09",X"20",X"AE",X"74",X"20",X"96",X"74",X"4C",X"4D",X"77",X"20",X"AE",X"74",X"A2",X"18",X"CA",
		X"CA",X"CA",X"30",X"1A",X"B5",X"6E",X"F0",X"F7",X"C5",X"1F",X"D0",X"F3",X"B5",X"6D",X"C5",X"1E",
		X"D0",X"ED",X"86",X"19",X"A2",X"0A",X"B5",X"3C",X"F0",X"04",X"CA",X"CA",X"10",X"F8",X"60",X"A5",
		X"B8",X"F0",X"0E",X"A2",X"00",X"24",X"B5",X"10",X"02",X"A2",X"08",X"BD",X"04",X"0C",X"29",X"80",
		X"60",X"20",X"71",X"75",X"90",X"09",X"20",X"5E",X"70",X"C9",X"D0",X"90",X"02",X"A9",X"00",X"60",
		X"A4",X"1D",X"C0",X"01",X"D0",X"03",X"20",X"AE",X"74",X"C0",X"02",X"D0",X"03",X"20",X"96",X"74",
		X"A5",X"1E",X"95",X"3B",X"A5",X"1F",X"95",X"3C",X"60",X"A5",X"B8",X"F0",X"07",X"A9",X"1F",X"85",
		X"59",X"8D",X"0D",X"0C",X"60",X"20",X"06",X"77",X"F0",X"03",X"4C",X"41",X"78",X"20",X"37",X"77",
		X"30",X"26",X"20",X"A0",X"77",X"86",X"58",X"A6",X"19",X"D0",X"0C",X"A9",X"80",X"A6",X"58",X"95",
		X"48",X"05",X"13",X"85",X"13",X"D0",X"03",X"20",X"05",X"76",X"20",X"A9",X"77",X"A9",X"00",X"A6",
		X"19",X"95",X"6E",X"10",X"7A",X"20",X"64",X"77",X"30",X"75",X"A9",X"C0",X"95",X"48",X"85",X"13",
		X"20",X"A9",X"77",X"A5",X"6A",X"95",X"3B",X"A5",X"6B",X"95",X"3C",X"D0",X"62",X"A6",X"16",X"4C");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
