library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity d1 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of d1 is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"5F",X"76",X"A6",X"16",X"20",X"C5",X"75",X"20",X"81",X"76",X"F0",X"35",X"29",X"F0",X"A4",X"16",
		X"F0",X"0A",X"E0",X"40",X"D0",X"0E",X"C9",X"40",X"D0",X"0A",X"F0",X"99",X"E0",X"50",X"D0",X"04",
		X"C9",X"50",X"F0",X"91",X"C9",X"A0",X"B0",X"08",X"E0",X"90",X"F0",X"B9",X"E0",X"80",X"F0",X"B5",
		X"A2",X"01",X"B5",X"1B",X"F0",X"08",X"C9",X"10",X"90",X"2B",X"C9",X"40",X"90",X"21",X"CA",X"10",
		X"F1",X"A9",X"FF",X"85",X"19",X"A6",X"16",X"B5",X"01",X"B4",X"00",X"A6",X"17",X"20",X"46",X"76",
		X"A6",X"16",X"B5",X"01",X"B4",X"00",X"A6",X"18",X"20",X"46",X"76",X"A5",X"19",X"D0",X"9E",X"A6",
		X"16",X"20",X"4F",X"76",X"60",X"A2",X"01",X"20",X"B0",X"76",X"B0",X"39",X"85",X"21",X"A2",X"00",
		X"20",X"B0",X"76",X"B0",X"30",X"A8",X"10",X"1C",X"A5",X"21",X"10",X"18",X"A9",X"00",X"A8",X"91",
		X"1E",X"98",X"A4",X"1A",X"91",X"1E",X"20",X"64",X"77",X"30",X"D4",X"20",X"90",X"77",X"A9",X"80",
		X"95",X"47",X"D0",X"CB",X"98",X"10",X"02",X"49",X"FF",X"A0",X"00",X"91",X"1E",X"A5",X"21",X"10",
		X"02",X"49",X"FF",X"10",X"DD",X"20",X"DD",X"76",X"B0",X"03",X"4C",X"41",X"78",X"86",X"21",X"20",
		X"B0",X"76",X"10",X"02",X"A9",X"00",X"A6",X"21",X"B4",X"19",X"10",X"C8",X"B5",X"6C",X"85",X"1D",
		X"85",X"20",X"B5",X"6D",X"85",X"1E",X"85",X"21",X"B4",X"6E",X"84",X"1F",X"84",X"22",X"60",X"A5",
		X"22",X"C5",X"1C",X"F0",X"04",X"B0",X"17",X"90",X"12",X"A2",X"80",X"A5",X"1B",X"29",X"E0",X"85",
		X"17",X"A5",X"21",X"29",X"E0",X"C5",X"17",X"F0",X"07",X"B0",X"03",X"A2",X"01",X"2C",X"A2",X"00",
		X"86",X"17",X"A2",X"80",X"A5",X"1B",X"29",X"1F",X"85",X"18",X"A5",X"21",X"29",X"1F",X"C5",X"18",
		X"F0",X"07",X"B0",X"03",X"A2",X"02",X"2C",X"A2",X"03",X"86",X"18",X"20",X"54",X"70",X"29",X"01",
		X"AA",X"B5",X"17",X"30",X"09",X"C5",X"20",X"F0",X"1A",X"20",X"BE",X"74",X"90",X"28",X"8A",X"49",
		X"01",X"AA",X"B5",X"17",X"30",X"0D",X"C5",X"20",X"F0",X"09",X"A6",X"22",X"A4",X"21",X"20",X"BA",
		X"74",X"90",X"13",X"A5",X"20",X"A6",X"22",X"A4",X"21",X"20",X"BA",X"74",X"B0",X"11",X"A5",X"61",
		X"C5",X"9E",X"B0",X"0B",X"90",X"46",X"20",X"5E",X"70",X"C5",X"9B",X"B0",X"E6",X"90",X"40",X"20",
		X"54",X"70",X"08",X"A5",X"20",X"28",X"30",X"03",X"49",X"03",X"2C",X"49",X"02",X"A6",X"22",X"A4",
		X"21",X"20",X"BA",X"74",X"90",X"29",X"A5",X"1D",X"49",X"01",X"A6",X"22",X"A4",X"21",X"20",X"BA",
		X"74",X"90",X"1C",X"A5",X"20",X"49",X"01",X"A6",X"22",X"A4",X"21",X"20",X"BA",X"74",X"90",X"0F",
		X"A5",X"20",X"A6",X"22",X"A4",X"21",X"85",X"1D",X"84",X"1E",X"86",X"1F",X"A9",X"80",X"2C",X"A9",
		X"00",X"85",X"58",X"0A",X"A8",X"91",X"21",X"C8",X"91",X"21",X"A0",X"20",X"91",X"21",X"C8",X"91",
		X"21",X"60",X"A0",X"03",X"A2",X"04",X"24",X"B5",X"10",X"02",X"A2",X"0C",X"CA",X"BD",X"00",X"0C",
		X"0A",X"90",X"04",X"88",X"10",X"F6",X"60",X"BD",X"BC",X"79",X"A8",X"60",X"03",X"01",X"02",X"00",
		X"FF",X"FF",X"FF",X"FF",X"02",X"00",X"03",X"01",X"A2",X"00",X"20",X"BC",X"78",X"A9",X"E3",X"85",
		X"1B",X"A9",X"09",X"85",X"1C",X"20",X"CF",X"78",X"4C",X"48",X"7A",X"48",X"98",X"48",X"8A",X"48",
		X"E6",X"8D",X"E6",X"8B",X"20",X"A2",X"79",X"B0",X"02",X"84",X"5E",X"A5",X"8B",X"29",X"07",X"D0",
		X"66",X"A5",X"6E",X"F0",X"5F",X"A5",X"B8",X"F0",X"CF",X"20",X"A2",X"79",X"90",X"0C",X"A9",X"FF",
		X"A4",X"5E",X"85",X"5E",X"30",X"12",X"C4",X"6C",X"F0",X"0E",X"C4",X"6C",X"D0",X"0C",X"98",X"A6",
		X"6E",X"A4",X"6D",X"20",X"BA",X"74",X"90",X"18",X"A4",X"6C",X"A6",X"6D",X"A5",X"6E",X"84",X"1D",
		X"86",X"1E",X"85",X"1F",X"A5",X"5B",X"F0",X"04",X"C6",X"5B",X"10",X"0D",X"A9",X"00",X"F0",X"06",
		X"A9",X"04",X"85",X"5B",X"A9",X"01",X"8D",X"0B",X"0C",X"A9",X"00",X"A8",X"91",X"6D",X"C8",X"91",
		X"6D",X"A0",X"20",X"91",X"6D",X"C8",X"91",X"6D",X"A2",X"00",X"A0",X"40",X"84",X"18",X"20",X"66",
		X"72",X"20",X"53",X"72",X"4C",X"21",X"7B",X"85",X"1D",X"0A",X"18",X"65",X"1D",X"AA",X"85",X"16",
		X"B5",X"6E",X"D0",X"41",X"24",X"57",X"10",X"EC",X"20",X"5E",X"70",X"29",X"01",X"0A",X"AA",X"A1",
		X"62",X"F0",X"08",X"8A",X"49",X"02",X"AA",X"A1",X"62",X"D0",X"D9",X"E6",X"A6",X"E6",X"A5",X"A9",
		X"00",X"85",X"57",X"85",X"8E",X"B5",X"63",X"85",X"1F",X"A9",X"63",X"24",X"B5",X"10",X"02",X"A9",
		X"7B",X"85",X"1E",X"20",X"5E",X"70",X"29",X"01",X"F0",X"01",X"E8",X"B5",X"66",X"85",X"1D",X"A6",
		X"16",X"A0",X"50",X"D0",X"A7",X"A5",X"8B",X"29",X"08",X"D0",X"76",X"20",X"BC",X"78",X"F0",X"05",
		X"8A",X"29",X"01",X"F0",X"0A",X"A4",X"6A",X"84",X"1B",X"A4",X"6B",X"84",X"1C",X"D0",X"06",X"84",
		X"1C",X"A4",X"6D",X"84",X"1B",X"20",X"CF",X"78",X"A6",X"16",X"A0",X"50",X"84",X"18",X"20",X"66",
		X"72",X"20",X"53",X"72",X"48",X"20",X"16",X"71",X"A8",X"68",X"C0",X"12",X"B0",X"0C",X"24",X"CF",
		X"30",X"04",X"C0",X"06",X"B0",X"04",X"24",X"58",X"10",X"37",X"A4",X"8A",X"D0",X"33",X"20",X"16",
		X"75",X"B0",X"2E",X"A5",X"33",X"F0",X"07",X"A5",X"35",X"D0",X"26",X"A0",X"04",X"2C",X"A0",X"02",
		X"A6",X"16",X"B5",X"6C",X"AA",X"96",X"36",X"A6",X"16",X"B5",X"6D",X"AA",X"96",X"30",X"A6",X"16",
		X"B5",X"6E",X"AA",X"96",X"31",X"98",X"AA",X"20",X"E5",X"75",X"20",X"5A",X"76",X"A9",X"00",X"85",
		X"8F",X"A5",X"8A",X"F0",X"04",X"C6",X"8A",X"10",X"75",X"A5",X"8B",X"29",X"01",X"F0",X"52",X"A5",
		X"31",X"D0",X"3B",X"24",X"12",X"30",X"2D",X"20",X"6F",X"77",X"D0",X"62",X"38",X"66",X"12",X"A5",
		X"6E",X"F0",X"5B",X"85",X"31",X"A5",X"6D",X"85",X"30",X"A5",X"6C",X"85",X"36",X"A2",X"00",X"86",
		X"37",X"A5",X"B8",X"F0",X"07",X"A9",X"11",X"85",X"5A",X"8D",X"0C",X"0C",X"20",X"E5",X"75",X"20",
		X"5A",X"76",X"D0",X"3A",X"20",X"6F",X"77",X"F0",X"02",X"46",X"12",X"4C",X"9E",X"7B",X"A2",X"00",
		X"86",X"16",X"A9",X"02",X"85",X"17",X"0A",X"85",X"18",X"20",X"02",X"78",X"E6",X"37",X"4C",X"9E",
		X"7B",X"A5",X"8B",X"29",X"02",X"F0",X"03",X"A2",X"02",X"2C",X"A2",X"04",X"B5",X"31",X"F0",X"0E",
		X"86",X"16",X"8A",X"49",X"06",X"85",X"17",X"A9",X"00",X"85",X"18",X"20",X"02",X"78",X"68",X"AA",
		X"68",X"A8",X"68",X"40",X"F8",X"18",X"A9",X"01",X"75",X"A0",X"95",X"A0",X"D8",X"60",X"F8",X"38",
		X"A5",X"C0",X"E9",X"01",X"85",X"C0",X"D8",X"60",X"AD",X"1E",X"0C",X"85",X"CE",X"AD",X"1F",X"0C",
		X"85",X"CF",X"A0",X"73",X"A2",X"60",X"20",X"9A",X"73",X"A9",X"02",X"2C",X"1D",X"0C",X"30",X"02",
		X"A9",X"03",X"85",X"CA",X"A0",X"CC",X"A2",X"09",X"20",X"61",X"7C",X"A0",X"10",X"AD",X"1B",X"0C",
		X"30",X"09",X"2C",X"1C",X"0C",X"10",X"0D",X"A0",X"15",X"D0",X"09",X"A0",X"20",X"2C",X"1C",X"0C",
		X"10",X"02",X"A0",X"FF",X"84",X"CC",X"A0",X"59",X"A2",X"60",X"20",X"9A",X"73",X"A5",X"CC",X"30",
		X"0E",X"A0",X"61",X"A2",X"60",X"20",X"9A",X"73",X"A0",X"AA",X"20",X"78",X"6E",X"F0",X"07",X"A0",
		X"69",X"A2",X"60",X"20",X"9A",X"73",X"20",X"68",X"7F",X"85",X"CD",X"10",X"06",X"A0",X"00",X"A2",
		X"60",X"D0",X"04",X"A0",X"0A",X"A2",X"60",X"20",X"9A",X"73",X"0E",X"1A",X"0C",X"6A",X"0E",X"19",
		X"0C",X"6A",X"29",X"C0",X"85",X"CB",X"D0",X"07",X"A0",X"44",X"A2",X"60",X"4C",X"9A",X"73",X"30",
		X"09",X"A0",X"20",X"A2",X"60",X"20",X"9A",X"73",X"F0",X"07",X"A0",X"14",X"A2",X"60",X"20",X"9A",
		X"73",X"24",X"CB",X"70",X"06",X"A0",X"38",X"A2",X"60",X"D0",X"E1",X"A0",X"2C",X"A2",X"60",X"D0",
		X"DB",X"84",X"2A",X"86",X"2B",X"09",X"A0",X"A0",X"00",X"91",X"2A",X"60",X"48",X"8A",X"48",X"8D",
		X"18",X"0C",X"A6",X"C8",X"F0",X"08",X"CA",X"86",X"C8",X"D0",X"03",X"8E",X"08",X"0C",X"A9",X"00",
		X"2C",X"05",X"0C",X"10",X"0C",X"2C",X"06",X"0C",X"10",X"07",X"2C",X"07",X"0C",X"30",X"40",X"A9",
		X"80",X"85",X"C6",X"20",X"B4",X"70",X"AD",X"05",X"0C",X"10",X"F8",X"AD",X"06",X"0C",X"10",X"F3",
		X"AD",X"07",X"0C",X"10",X"EE",X"A9",X"01",X"8D",X"08",X"0C",X"A2",X"20",X"24",X"C6",X"30",X"14",
		X"8D",X"03",X"0C",X"20",X"B4",X"70",X"8D",X"03",X"0C",X"E6",X"C1",X"24",X"CB",X"10",X"24",X"70",
		X"03",X"20",X"A4",X"7B",X"A9",X"00",X"85",X"C1",X"20",X"A4",X"7B",X"A9",X"30",X"85",X"C8",X"A2",
		X"00",X"A5",X"C0",X"C9",X"98",X"B0",X"02",X"A2",X"01",X"8E",X"02",X"0C",X"68",X"AA",X"68",X"8D",
		X"10",X"0C",X"40",X"A5",X"C1",X"C9",X"02",X"F0",X"DB",X"D0",X"E0",X"E0",X"04",X"B0",X"06",X"38",
		X"A9",X"00",X"8D",X"0F",X"02",X"60",X"18",X"60",X"B0",X"F1",X"2C",X"07",X"0C",X"30",X"F7",X"2C",
		X"0F",X"02",X"30",X"F2",X"A9",X"80",X"8D",X"0F",X"02",X"98",X"A2",X"02",X"8E",X"0B",X"02",X"A2",
		X"02",X"4A",X"3E",X"08",X"02",X"CA",X"10",X"FA",X"CE",X"0B",X"02",X"D0",X"F2",X"AD",X"08",X"02",
		X"29",X"0F",X"C9",X"0F",X"D0",X"D0",X"AD",X"09",X"02",X"C9",X"00",X"D0",X"C9",X"AD",X"0A",X"02",
		X"C9",X"1A",X"D0",X"C2",X"8C",X"0B",X"02",X"A0",X"7A",X"A2",X"60",X"20",X"9A",X"73",X"AC",X"0B",
		X"02",X"18",X"60",X"78",X"A9",X"0C",X"D8",X"85",X"01",X"A9",X"00",X"85",X"00",X"A8",X"91",X"00",
		X"C8",X"D0",X"FB",X"C8",X"8C",X"0A",X"0C",X"A2",X"00",X"A9",X"00",X"85",X"00",X"85",X"01",X"A0",
		X"02",X"8D",X"18",X"0C",X"8A",X"91",X"00",X"18",X"69",X"11",X"C8",X"D0",X"F8",X"AA",X"E8",X"E6",
		X"01",X"A5",X"01",X"C9",X"0C",X"D0",X"EA",X"A9",X"00",X"85",X"01",X"A0",X"02",X"A6",X"02",X"8D",
		X"18",X"0C",X"8A",X"D1",X"00",X"D0",X"22",X"18",X"69",X"11",X"C8",X"D0",X"F6",X"AA",X"E8",X"E6",
		X"01",X"A5",X"01",X"C9",X"0C",X"D0",X"E8",X"A6",X"02",X"E8",X"E0",X"10",X"D0",X"BB",X"A9",X"BB",
		X"85",X"00",X"A9",X"BF",X"85",X"01",X"4C",X"BE",X"7D",X"51",X"00",X"A2",X"BC",X"29",X"0F",X"D0",
		X"02",X"A2",X"B8",X"86",X"00",X"A5",X"01",X"4A",X"4A",X"18",X"69",X"A1",X"85",X"01",X"A9",X"08",
		X"85",X"03",X"A9",X"00",X"85",X"02",X"A8",X"A9",X"B0",X"8D",X"18",X"0C",X"91",X"02",X"C8",X"D0",
		X"FB",X"E6",X"03",X"A5",X"03",X"C9",X"0C",X"D0",X"EE",X"A5",X"00",X"8D",X"E4",X"09",X"A5",X"01",
		X"8D",X"04",X"0A",X"A9",X"BD",X"8D",X"A4",X"0A",X"A9",X"B1",X"8D",X"C4",X"0A",X"A9",X"C2",X"8D",
		X"E4",X"0A",X"A5",X"01",X"C9",X"BF",X"F0",X"0B",X"8D",X"18",X"0C",X"AD",X"0F",X"0C",X"10",X"F8",
		X"4C",X"43",X"7D",X"A9",X"00",X"85",X"00",X"A9",X"60",X"85",X"01",X"A2",X"00",X"A0",X"00",X"8D",
		X"18",X"0C",X"8A",X"18",X"71",X"00",X"C8",X"D0",X"FA",X"AA",X"E6",X"01",X"A5",X"01",X"29",X"07",
		X"D0",X"ED",X"A5",X"01",X"18",X"E9",X"60",X"4A",X"4A",X"4A",X"A8",X"8A",X"D9",X"F5",X"7F",X"D0",
		X"0E",X"C0",X"03",X"D0",X"D6",X"A9",X"BB",X"8D",X"E2",X"09",X"A9",X"BF",X"4C",X"48",X"7E",X"A9",
		X"B0",X"8D",X"E2",X"09",X"98",X"18",X"69",X"A1",X"8D",X"02",X"0A",X"A9",X"BD",X"8D",X"A2",X"0A",
		X"A9",X"BF",X"8D",X"C2",X"0A",X"A9",X"C2",X"8D",X"E2",X"0A",X"AD",X"02",X"0A",X"C9",X"BF",X"D0",
		X"35",X"A9",X"80",X"85",X"01",X"85",X"03",X"85",X"05",X"85",X"07",X"85",X"09",X"85",X"0B",X"85",
		X"0D",X"85",X"0F",X"A9",X"48",X"85",X"00",X"A9",X"58",X"85",X"02",X"A9",X"68",X"85",X"04",X"A9",
		X"78",X"85",X"06",X"A9",X"88",X"85",X"08",X"A9",X"97",X"85",X"0A",X"A9",X"A7",X"85",X"0C",X"A9",
		X"B7",X"85",X"0E",X"4C",X"66",X"68",X"8D",X"18",X"0C",X"AD",X"0F",X"0C",X"10",X"F8",X"4C",X"43",
		X"7D",X"20",X"BF",X"7E",X"20",X"E7",X"7E",X"AD",X"07",X"0C",X"0A",X"AD",X"01",X"08",X"2A",X"8D",
		X"01",X"08",X"29",X"0F",X"C9",X"0C",X"D0",X"06",X"EE",X"00",X"08",X"EE",X"00",X"08",X"60",X"AD",
		X"00",X"08",X"29",X"0E",X"AA",X"20",X"D7",X"7E",X"B0",X"0C",X"6A",X"6A",X"30",X"01",X"E8",X"B0",
		X"03",X"D6",X"00",X"60",X"F6",X"00",X"60",X"A0",X"00",X"B9",X"00",X"0C",X"10",X"06",X"C8",X"C0",
		X"04",X"D0",X"F6",X"60",X"98",X"18",X"60",X"A2",X"00",X"B4",X"00",X"E0",X"0A",X"90",X"01",X"C8",
		X"C0",X"57",X"90",X"4C",X"C0",X"5F",X"B0",X"48",X"E8",X"B4",X"00",X"C0",X"4F",X"90",X"41",X"C0",
		X"57",X"B0",X"3D",X"E8",X"E0",X"10",X"D0",X"E1",X"A9",X"A0",X"85",X"88",X"A2",X"00",X"BD",X"41",
		X"7F",X"30",X"1E",X"0A",X"0A",X"0A",X"0A",X"0A",X"09",X"1A",X"A8",X"BD",X"41",X"7F",X"4A",X"4A",
		X"4A",X"29",X"03",X"09",X"08",X"85",X"89",X"A5",X"88",X"84",X"88",X"A0",X"00",X"91",X"88",X"85",
		X"88",X"BD",X"41",X"7F",X"0A",X"30",X"02",X"E6",X"88",X"E8",X"A5",X"88",X"C9",X"C5",X"D0",X"CE",
		X"60",X"06",X"09",X"80",X"80",X"80",X"80",X"80",X"80",X"07",X"08",X"80",X"80",X"19",X"80",X"80",
		X"80",X"80",X"16",X"80",X"14",X"0B",X"0C",X"80",X"80",X"80",X"4E",X"10",X"80",X"80",X"11",X"4F",
		X"15",X"17",X"13",X"80",X"80",X"80",X"80",X"0D",X"AD",X"18",X"0C",X"49",X"FF",X"60",X"41",X"4E",
		X"4B",X"20",X"53",X"45",X"41",X"52",X"43",X"48",X"0D",X"53",X"54",X"4E",X"4B",X"50",X"53",X"31",
		X"09",X"4C",X"44",X"59",X"09",X"5A",X"20",X"3A",X"42",X"55",X"46",X"44",X"41",X"54",X"41",X"31",
		X"0D",X"09",X"42",X"45",X"51",X"09",X"52",X"20",X"3A",X"53",X"54",X"50",X"31",X"31",X"30",X"09",
		X"09",X"53",X"4F",X"4E",X"4F",X"20",X"4D",X"41",X"4D",X"41",X"0D",X"09",X"44",X"45",X"59",X"0D",
		X"09",X"44",X"45",X"59",X"0D",X"09",X"42",X"4D",X"49",X"09",X"52",X"20",X"3A",X"53",X"54",X"50",
		X"31",X"30",X"32",X"0D",X"09",X"42",X"45",X"51",X"09",X"52",X"20",X"3A",X"53",X"54",X"50",X"31",
		X"30",X"35",X"0D",X"09",X"4A",X"53",X"52",X"09",X"41",X"20",X"3A",X"53",X"42",X"32",X"30",X"41",
		X"44",X"31",X"0D",X"53",X"54",X"50",X"31",X"30",X"32",X"09",X"4A",X"53",X"52",X"09",X"41",X"20",
		X"3A",X"44",X"45",X"43",X"41",X"86",X"09",X"49",X"1E",X"0A",X"DB",X"79",X"43",X"7D",X"6C",X"7C");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
