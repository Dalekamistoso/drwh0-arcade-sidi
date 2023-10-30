library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity gravitar_pgm_rom4 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(11 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of gravitar_pgm_rom4 is
	type rom is array(0 to  4095) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"04",X"03",X"05",X"05",X"04",X"05",X"03",X"FB",X"FB",X"FB",X"FA",X"FB",X"FA",X"FA",X"FA",X"FA",
		X"FA",X"FB",X"FB",X"FA",X"FB",X"FA",X"06",X"06",X"06",X"06",X"08",X"08",X"08",X"08",X"08",X"08",
		X"08",X"08",X"08",X"08",X"08",X"A6",X"CF",X"B5",X"4D",X"AA",X"BD",X"31",X"C1",X"C9",X"A8",X"F0",
		X"0D",X"A9",X"00",X"A2",X"07",X"1D",X"E4",X"02",X"CA",X"10",X"FA",X"AA",X"D0",X"31",X"A6",X"CF",
		X"B5",X"E9",X"A0",X"00",X"84",X"23",X"94",X"E9",X"85",X"24",X"20",X"7D",X"C3",X"A6",X"CF",X"BD",
		X"7A",X"01",X"D0",X"18",X"FE",X"7A",X"01",X"B5",X"4D",X"F0",X"11",X"A8",X"B9",X"80",X"C0",X"85",
		X"7E",X"A9",X"10",X"85",X"24",X"20",X"7D",X"C3",X"C6",X"7E",X"10",X"F9",X"4C",X"7F",X"C0",X"A6",
		X"CF",X"B5",X"E9",X"48",X"B5",X"4D",X"0A",X"18",X"65",X"CF",X"AA",X"68",X"9D",X"71",X"04",X"60",
		X"00",X"01",X"05",X"0B",X"13",X"A2",X"0E",X"A9",X"00",X"1D",X"BF",X"03",X"CA",X"10",X"FA",X"A6",
		X"CF",X"15",X"88",X"D0",X"1D",X"A6",X"CF",X"B5",X"00",X"C9",X"08",X"D0",X"0B",X"20",X"56",X"53",
		X"20",X"6F",X"53",X"A9",X"0C",X"4C",X"AA",X"C0",X"A9",X"0A",X"A6",X"CF",X"95",X"00",X"A9",X"FF",
		X"85",X"30",X"60",X"A6",X"CF",X"B5",X"F6",X"29",X"03",X"AA",X"BD",X"42",X"C1",X"AA",X"A9",X"04",
		X"85",X"24",X"A4",X"CF",X"8A",X"0A",X"65",X"CF",X"A8",X"B9",X"44",X"01",X"10",X"03",X"4C",X"D4",
		X"C0",X"20",X"54",X"C1",X"CA",X"C6",X"24",X"10",X"E9",X"4C",X"45",X"C1",X"01",X"FE",X"FD",X"01",
		X"00",X"01",X"FF",X"FD",X"FF",X"01",X"01",X"FE",X"FD",X"01",X"00",X"00",X"00",X"F4",X"70",X"BC",
		X"C2",X"37",X"C2",X"9C",X"C0",X"40",X"C0",X"F4",X"70",X"BC",X"C2",X"37",X"C8",X"C8",X"40",X"66",
		X"A8",X"60",X"A8",X"CE",X"58",X"14",X"D0",X"60",X"40",X"66",X"A8",X"60",X"A8",X"96",X"20",X"02",
		X"02",X"FD",X"FE",X"FD",X"FF",X"02",X"00",X"FD",X"02",X"02",X"02",X"FD",X"FE",X"FD",X"00",X"FF",
		X"50",X"50",X"50",X"50",X"50",X"50",X"50",X"50",X"50",X"50",X"50",X"50",X"50",X"50",X"50",X"20",
		X"20",X"00",X"00",X"00",X"98",X"A8",X"08",X"00",X"00",X"88",X"A8",X"00",X"00",X"98",X"00",X"A8",
		X"40",X"40",X"04",X"09",X"0E",X"A6",X"CF",X"B5",X"F6",X"29",X"01",X"F0",X"05",X"A2",X"10",X"4C",
		X"54",X"C1",X"A2",X"0F",X"A5",X"0D",X"38",X"FD",X"FE",X"C0",X"85",X"38",X"A5",X"0E",X"FD",X"0F",
		X"C1",X"10",X"0A",X"49",X"FF",X"48",X"A5",X"38",X"49",X"FF",X"85",X"38",X"68",X"85",X"39",X"A5",
		X"0F",X"38",X"FD",X"ED",X"C0",X"85",X"3A",X"A5",X"10",X"FD",X"DC",X"C0",X"10",X"0A",X"49",X"FF",
		X"48",X"A5",X"3A",X"49",X"FF",X"85",X"3A",X"68",X"85",X"3B",X"D0",X"43",X"A5",X"3A",X"DD",X"20",
		X"C1",X"B0",X"3C",X"A5",X"39",X"D0",X"38",X"A5",X"38",X"DD",X"20",X"C1",X"B0",X"2F",X"BD",X"31",
		X"C1",X"29",X"40",X"F0",X"0C",X"20",X"8A",X"A5",X"20",X"C0",X"C8",X"20",X"EB",X"E0",X"4C",X"CD",
		X"C1",X"A4",X"CF",X"BD",X"31",X"C1",X"10",X"0A",X"29",X"20",X"F0",X"06",X"B9",X"3C",X"01",X"F0",
		X"01",X"60",X"96",X"4D",X"20",X"31",X"5B",X"A9",X"06",X"A6",X"CF",X"95",X"00",X"A2",X"00",X"60",
		X"B9",X"ED",X"C0",X"85",X"38",X"B9",X"DC",X"C0",X"85",X"39",X"B9",X"FE",X"C0",X"85",X"3A",X"B9",
		X"0F",X"C1",X"85",X"3B",X"60",X"A4",X"CF",X"B9",X"3C",X"01",X"D0",X"3B",X"A2",X"01",X"BD",X"34",
		X"01",X"D0",X"31",X"20",X"6F",X"A5",X"20",X"75",X"C2",X"20",X"28",X"C2",X"A5",X"7F",X"F0",X"24",
		X"86",X"86",X"A2",X"05",X"A9",X"00",X"B5",X"0B",X"95",X"80",X"CA",X"10",X"F7",X"20",X"8A",X"C2",
		X"20",X"67",X"54",X"A4",X"CF",X"A9",X"1C",X"99",X"00",X"00",X"20",X"C2",X"E1",X"20",X"03",X"E1",
		X"68",X"68",X"A2",X"00",X"CA",X"10",X"C7",X"60",X"A9",X"00",X"85",X"7F",X"A5",X"38",X"38",X"E5",
		X"3C",X"85",X"7B",X"A5",X"39",X"E5",X"3D",X"10",X"0A",X"49",X"FF",X"48",X"A5",X"7B",X"49",X"FF",
		X"85",X"7B",X"68",X"85",X"7C",X"A5",X"3A",X"38",X"E5",X"3E",X"85",X"7D",X"A5",X"3B",X"E5",X"3F",
		X"10",X"0A",X"49",X"FF",X"48",X"A5",X"7D",X"49",X"FF",X"85",X"7D",X"68",X"85",X"7E",X"D0",X"14",
		X"A5",X"7D",X"C9",X"50",X"B0",X"0E",X"A5",X"7C",X"D0",X"0A",X"A5",X"7B",X"C9",X"50",X"B0",X"04",
		X"A9",X"FF",X"85",X"7F",X"60",X"BD",X"08",X"01",X"85",X"38",X"BD",X"0C",X"01",X"85",X"39",X"BD",
		X"14",X"01",X"85",X"3A",X"BD",X"18",X"01",X"85",X"3B",X"60",X"A6",X"86",X"BD",X"0C",X"01",X"C5",
		X"10",X"D0",X"05",X"BD",X"08",X"01",X"C5",X"0F",X"90",X"05",X"A9",X"FE",X"4C",X"A1",X"C2",X"A9",
		X"01",X"85",X"10",X"49",X"FF",X"9D",X"0C",X"01",X"BD",X"18",X"01",X"C5",X"0E",X"D0",X"05",X"BD",
		X"14",X"01",X"C5",X"0D",X"90",X"05",X"A9",X"FE",X"4C",X"BD",X"C2",X"A9",X"01",X"85",X"0E",X"49",
		X"FF",X"9D",X"18",X"01",X"60",X"A4",X"2A",X"B9",X"FB",X"02",X"38",X"D0",X"01",X"60",X"18",X"A9",
		X"10",X"65",X"44",X"90",X"03",X"E6",X"45",X"18",X"71",X"6A",X"85",X"44",X"A5",X"45",X"69",X"00",
		X"85",X"45",X"A9",X"00",X"85",X"22",X"B1",X"68",X"85",X"21",X"A2",X"03",X"06",X"21",X"26",X"22",
		X"CA",X"10",X"F9",X"A5",X"22",X"C9",X"08",X"90",X"04",X"09",X"F0",X"85",X"22",X"A5",X"46",X"18",
		X"65",X"21",X"85",X"46",X"A5",X"47",X"65",X"22",X"85",X"47",X"A5",X"0D",X"38",X"E5",X"44",X"85",
		X"21",X"A5",X"0E",X"E5",X"45",X"10",X"0C",X"49",X"FF",X"85",X"22",X"A5",X"21",X"49",X"FF",X"85",
		X"21",X"A5",X"22",X"F0",X"04",X"38",X"4C",X"52",X"C3",X"A5",X"21",X"C9",X"40",X"B0",X"23",X"A5",
		X"0F",X"38",X"E5",X"46",X"85",X"23",X"A5",X"10",X"E5",X"47",X"10",X"0C",X"49",X"FF",X"85",X"24",
		X"A5",X"23",X"49",X"FF",X"85",X"23",X"A5",X"24",X"F0",X"04",X"38",X"4C",X"52",X"C3",X"A5",X"23",
		X"C9",X"88",X"60",X"A9",X"00",X"9D",X"E4",X"02",X"99",X"EC",X"02",X"20",X"BD",X"BE",X"20",X"C0",
		X"C8",X"20",X"EB",X"E0",X"A2",X"06",X"AD",X"EB",X"02",X"1D",X"E4",X"02",X"CA",X"10",X"FA",X"AA",
		X"D0",X"03",X"20",X"07",X"E1",X"A9",X"50",X"85",X"23",X"A9",X"02",X"85",X"24",X"A5",X"D0",X"F0",
		X"20",X"F8",X"18",X"A6",X"CF",X"A5",X"23",X"7D",X"62",X"01",X"9D",X"62",X"01",X"A5",X"24",X"7D",
		X"64",X"01",X"9D",X"64",X"01",X"BD",X"66",X"01",X"69",X"00",X"9D",X"66",X"01",X"20",X"A2",X"C3",
		X"D8",X"60",X"A5",X"F0",X"29",X"C0",X"C9",X"C0",X"F0",X"27",X"BD",X"66",X"01",X"DD",X"16",X"05",
		X"90",X"1F",X"BD",X"64",X"01",X"DD",X"14",X"05",X"90",X"17",X"F6",X"42",X"20",X"DB",X"E0",X"A5",
		X"F0",X"0A",X"2A",X"2A",X"29",X"03",X"A8",X"BD",X"16",X"05",X"18",X"79",X"D2",X"C3",X"9D",X"16",
		X"05",X"60",X"01",X"02",X"03",X"A6",X"CF",X"B5",X"00",X"C9",X"08",X"D0",X"0B",X"B5",X"4D",X"AA",
		X"BD",X"31",X"C1",X"29",X"08",X"F0",X"01",X"60",X"A5",X"4F",X"29",X"01",X"D0",X"33",X"A2",X"03",
		X"BD",X"34",X"01",X"F0",X"29",X"DE",X"34",X"01",X"D0",X"24",X"E0",X"02",X"B0",X"1A",X"A4",X"CF",
		X"B9",X"3C",X"01",X"D0",X"10",X"B9",X"F6",X"00",X"29",X"01",X"D0",X"06",X"20",X"37",X"54",X"4C",
		X"15",X"C4",X"20",X"4C",X"54",X"4C",X"1B",X"C4",X"20",X"22",X"C4",X"20",X"04",X"9D",X"CA",X"10",
		X"CF",X"60",X"A9",X"F8",X"9D",X"18",X"01",X"86",X"21",X"A6",X"CF",X"A9",X"03",X"A6",X"21",X"9D",
		X"0C",X"01",X"AD",X"0A",X"60",X"9D",X"14",X"01",X"9D",X"08",X"01",X"60",X"03",X"A6",X"35",X"A5",
		X"1D",X"29",X"02",X"85",X"35",X"D0",X"01",X"60",X"8A",X"29",X"02",X"F0",X"01",X"60",X"A5",X"1D",
		X"29",X"01",X"F0",X"01",X"60",X"A2",X"03",X"BD",X"EC",X"02",X"F0",X"03",X"4C",X"DC",X"C4",X"20",
		X"DF",X"E0",X"A5",X"10",X"9D",X"08",X"02",X"A5",X"0F",X"9D",X"1F",X"02",X"A5",X"0E",X"9D",X"4D",
		X"02",X"A5",X"0D",X"9D",X"64",X"02",X"A9",X"00",X"9D",X"7B",X"02",X"9D",X"36",X"02",X"A4",X"CF",
		X"B9",X"00",X"00",X"C9",X"18",X"D0",X"05",X"A9",X"0E",X"4C",X"8E",X"C4",X"A9",X"38",X"9D",X"EC",
		X"02",X"A4",X"11",X"B9",X"FF",X"C7",X"18",X"65",X"17",X"9D",X"A8",X"02",X"B9",X"8F",X"C7",X"65",
		X"16",X"9D",X"8A",X"02",X"B9",X"2F",X"C8",X"18",X"65",X"14",X"9D",X"D5",X"02",X"B9",X"BF",X"C7",
		X"65",X"13",X"9D",X"B7",X"02",X"A0",X"FF",X"BD",X"8A",X"02",X"10",X"07",X"98",X"9D",X"99",X"02",
		X"4C",X"C9",X"C4",X"C8",X"98",X"9D",X"99",X"02",X"88",X"BD",X"B7",X"02",X"10",X"07",X"98",X"9D",
		X"C6",X"02",X"4C",X"DA",X"C4",X"C8",X"98",X"9D",X"C6",X"02",X"A2",X"00",X"CA",X"30",X"03",X"4C",
		X"57",X"C4",X"60",X"AD",X"7D",X"01",X"29",X"01",X"F0",X"03",X"4C",X"55",X"C4",X"60",X"A5",X"37",
		X"D0",X"4E",X"AD",X"0A",X"60",X"A6",X"CF",X"D5",X"E7",X"B0",X"45",X"B5",X"4D",X"C9",X"03",X"D0",
		X"03",X"4C",X"41",X"C5",X"AD",X"0A",X"60",X"10",X"04",X"38",X"4C",X"0E",X"C5",X"18",X"29",X"03",
		X"65",X"2A",X"AA",X"CA",X"8A",X"4A",X"29",X"07",X"A8",X"A9",X"07",X"85",X"21",X"B9",X"E4",X"02",
		X"F0",X"15",X"A6",X"ED",X"BD",X"F0",X"02",X"D0",X"08",X"A9",X"03",X"99",X"8F",X"04",X"4C",X"8F",
		X"C6",X"CA",X"10",X"F0",X"4C",X"3C",X"C5",X"88",X"10",X"02",X"A0",X"07",X"C6",X"21",X"10",X"DD",
		X"60",X"A2",X"00",X"A5",X"10",X"10",X"01",X"E8",X"A5",X"0E",X"10",X"02",X"E8",X"E8",X"8A",X"0A",
		X"85",X"21",X"A5",X"4F",X"29",X"01",X"18",X"65",X"21",X"A8",X"B9",X"86",X"C5",X"A8",X"A9",X"07",
		X"85",X"21",X"B9",X"E4",X"02",X"F0",X"15",X"A6",X"ED",X"BD",X"F0",X"02",X"D0",X"08",X"A9",X"03",
		X"99",X"8F",X"04",X"4C",X"8F",X"C6",X"CA",X"10",X"F0",X"4C",X"81",X"C5",X"88",X"10",X"02",X"A0",
		X"07",X"C6",X"21",X"10",X"DD",X"60",X"06",X"07",X"05",X"07",X"00",X"04",X"01",X"03",X"A6",X"CF",
		X"BD",X"3C",X"01",X"D0",X"08",X"A2",X"01",X"20",X"9E",X"C5",X"CA",X"10",X"FA",X"60",X"A4",X"CF",
		X"B9",X"88",X"00",X"F0",X"20",X"BD",X"34",X"01",X"D0",X"1B",X"BD",X"F9",X"02",X"D0",X"16",X"A5",
		X"CF",X"D0",X"05",X"A4",X"49",X"4C",X"BA",X"C5",X"A4",X"4A",X"AD",X"0A",X"60",X"D9",X"C6",X"C5",
		X"B0",X"03",X"4C",X"CE",X"C5",X"60",X"08",X"10",X"20",X"40",X"50",X"60",X"70",X"80",X"86",X"21",
		X"BD",X"08",X"01",X"9D",X"2C",X"02",X"85",X"38",X"BD",X"0C",X"01",X"9D",X"15",X"02",X"85",X"39",
		X"BD",X"14",X"01",X"9D",X"71",X"02",X"85",X"3A",X"BD",X"18",X"01",X"9D",X"5A",X"02",X"85",X"3B",
		X"20",X"6F",X"A5",X"20",X"99",X"A4",X"A5",X"55",X"0A",X"A8",X"A5",X"38",X"38",X"E5",X"3A",X"A5",
		X"39",X"E5",X"3B",X"10",X"01",X"C8",X"B9",X"7E",X"C6",X"85",X"22",X"AD",X"0A",X"60",X"29",X"07",
		X"18",X"65",X"22",X"A8",X"A6",X"21",X"B9",X"2F",X"C8",X"9D",X"E2",X"02",X"B9",X"BF",X"C7",X"9D",
		X"C4",X"02",X"B9",X"FF",X"C7",X"9D",X"B5",X"02",X"B9",X"8F",X"C7",X"9D",X"97",X"02",X"48",X"A0",
		X"FF",X"68",X"10",X"04",X"98",X"4C",X"3B",X"C6",X"C8",X"98",X"88",X"9D",X"A6",X"02",X"BD",X"C4",
		X"02",X"10",X"04",X"98",X"4C",X"49",X"C6",X"C8",X"98",X"9D",X"D3",X"02",X"A5",X"CF",X"D0",X"05",
		X"A5",X"00",X"4C",X"57",X"C6",X"A5",X"01",X"C9",X"18",X"90",X"0E",X"C9",X"1C",X"D0",X"05",X"A9",
		X"30",X"4C",X"66",X"C6",X"A9",X"0A",X"4C",X"77",X"C6",X"A5",X"CF",X"D0",X"05",X"A4",X"4D",X"4C",
		X"74",X"C6",X"A4",X"4E",X"B9",X"86",X"C6",X"9D",X"F9",X"02",X"20",X"E3",X"E0",X"60",X"20",X"28",
		X"38",X"30",X"10",X"18",X"00",X"08",X"28",X"28",X"1C",X"00",X"00",X"08",X"18",X"28",X"00",X"A9",
		X"00",X"9D",X"3A",X"02",X"9D",X"7F",X"02",X"B9",X"17",X"02",X"9D",X"23",X"02",X"B9",X"00",X"02",
		X"9D",X"0C",X"02",X"B9",X"5C",X"02",X"9D",X"68",X"02",X"B9",X"45",X"02",X"9D",X"51",X"02",X"AD",
		X"0A",X"60",X"10",X"05",X"98",X"18",X"69",X"08",X"A8",X"B1",X"70",X"9D",X"F0",X"02",X"B1",X"72",
		X"85",X"21",X"AD",X"0A",X"60",X"31",X"74",X"18",X"65",X"21",X"29",X"3F",X"A8",X"B9",X"2F",X"C8",
		X"9D",X"D9",X"02",X"B9",X"BF",X"C7",X"9D",X"BB",X"02",X"B9",X"FF",X"C7",X"9D",X"AC",X"02",X"B9",
		X"8F",X"C7",X"9D",X"8E",X"02",X"48",X"A0",X"FF",X"68",X"10",X"04",X"98",X"4C",X"F2",X"C6",X"C8",
		X"98",X"88",X"9D",X"9D",X"02",X"BD",X"BB",X"02",X"10",X"04",X"98",X"4C",X"00",X"C7",X"C8",X"98",
		X"9D",X"CA",X"02",X"20",X"E3",X"E0",X"60",X"A2",X"0E",X"BD",X"EC",X"02",X"F0",X"6E",X"BD",X"36",
		X"02",X"18",X"7D",X"A8",X"02",X"9D",X"36",X"02",X"BD",X"1F",X"02",X"7D",X"8A",X"02",X"9D",X"1F",
		X"02",X"BD",X"08",X"02",X"7D",X"99",X"02",X"9D",X"08",X"02",X"10",X"0C",X"C9",X"FA",X"B0",X"05",
		X"A9",X"01",X"9D",X"EC",X"02",X"4C",X"41",X"C7",X"C9",X"06",X"90",X"05",X"A9",X"01",X"9D",X"EC",
		X"02",X"BD",X"7B",X"02",X"18",X"7D",X"D5",X"02",X"9D",X"7B",X"02",X"BD",X"64",X"02",X"7D",X"B7",
		X"02",X"9D",X"64",X"02",X"BD",X"4D",X"02",X"7D",X"C6",X"02",X"9D",X"4D",X"02",X"10",X"0C",X"C9",
		X"F8",X"B0",X"05",X"A9",X"01",X"9D",X"EC",X"02",X"4C",X"74",X"C7",X"C9",X"08",X"90",X"05",X"A9",
		X"01",X"9D",X"EC",X"02",X"DE",X"EC",X"02",X"D0",X"03",X"20",X"80",X"C7",X"CA",X"10",X"8A",X"60",
		X"A9",X"00",X"9D",X"08",X"02",X"9D",X"4D",X"02",X"9D",X"1F",X"02",X"9D",X"64",X"02",X"60",X"10",
		X"0F",X"0F",X"0E",X"0E",X"0D",X"0C",X"0B",X"0A",X"08",X"07",X"06",X"04",X"03",X"01",X"00",X"00",
		X"FE",X"FD",X"FB",X"F9",X"F8",X"F7",X"F5",X"F4",X"F3",X"F2",X"F1",X"F1",X"F0",X"F0",X"F0",X"F0",
		X"F0",X"F0",X"F1",X"F1",X"F2",X"F3",X"F4",X"F5",X"F7",X"F8",X"F9",X"FB",X"FD",X"FE",X"FF",X"00",
		X"01",X"03",X"04",X"06",X"07",X"08",X"0A",X"0B",X"0C",X"0D",X"0E",X"0E",X"0F",X"0F",X"0F",X"10",
		X"0F",X"0F",X"0E",X"0E",X"0D",X"0C",X"0B",X"0A",X"08",X"07",X"06",X"04",X"03",X"01",X"00",X"00",
		X"FE",X"FD",X"FB",X"F9",X"F8",X"F7",X"F5",X"F4",X"F3",X"F2",X"F1",X"F1",X"F0",X"F0",X"F0",X"F0",
		X"F0",X"F0",X"F1",X"F1",X"F2",X"F3",X"F4",X"F5",X"F7",X"F8",X"F9",X"FB",X"FD",X"FE",X"FF",X"00",
		X"B0",X"50",X"D0",X"20",X"50",X"60",X"50",X"20",X"E0",X"90",X"20",X"A0",X"20",X"90",X"10",X"00",
		X"70",X"E0",X"60",X"E0",X"70",X"20",X"E0",X"B0",X"A0",X"B0",X"E0",X"30",X"B0",X"50",X"10",X"00",
		X"50",X"B0",X"30",X"E0",X"B0",X"A0",X"B0",X"E0",X"20",X"70",X"E0",X"60",X"E0",X"70",X"FF",X"00",
		X"90",X"20",X"A0",X"20",X"90",X"E0",X"20",X"50",X"60",X"50",X"20",X"D0",X"50",X"B0",X"F0",X"00",
		X"B0",X"50",X"D0",X"20",X"50",X"60",X"50",X"20",X"E0",X"90",X"20",X"A0",X"20",X"90",X"10",X"00",
		X"70",X"E0",X"60",X"E0",X"70",X"20",X"E0",X"B0",X"A0",X"B0",X"E0",X"30",X"B0",X"50",X"10",X"00",
		X"50",X"B0",X"30",X"E0",X"B0",X"A0",X"B0",X"E0",X"20",X"70",X"E0",X"60",X"E0",X"70",X"FF",X"A2",
		X"07",X"A5",X"4F",X"29",X"01",X"D0",X"02",X"A2",X"0F",X"A0",X"07",X"BD",X"BF",X"03",X"F0",X"3B",
		X"BD",X"29",X"03",X"18",X"7D",X"83",X"03",X"9D",X"29",X"03",X"BD",X"1A",X"03",X"7D",X"74",X"03",
		X"9D",X"1A",X"03",X"BD",X"0B",X"03",X"7D",X"65",X"03",X"9D",X"0B",X"03",X"BD",X"56",X"03",X"18",
		X"7D",X"B0",X"03",X"9D",X"56",X"03",X"BD",X"47",X"03",X"7D",X"A1",X"03",X"9D",X"47",X"03",X"BD",
		X"38",X"03",X"7D",X"92",X"03",X"9D",X"38",X"03",X"DE",X"BF",X"03",X"CA",X"88",X"10",X"BC",X"60",
		X"A4",X"87",X"C8",X"C0",X"03",X"90",X"02",X"A0",X"00",X"84",X"87",X"A9",X"04",X"85",X"23",X"B9",
		X"FD",X"C8",X"A8",X"A5",X"38",X"99",X"1A",X"03",X"A5",X"39",X"99",X"0B",X"03",X"A5",X"3A",X"99",
		X"47",X"03",X"A5",X"3B",X"99",X"38",X"03",X"AD",X"0A",X"60",X"29",X"3F",X"09",X"08",X"99",X"BF",
		X"03",X"20",X"64",X"C9",X"20",X"6B",X"C9",X"C8",X"C6",X"23",X"10",X"D7",X"60",X"00",X"05",X"0A",
		X"A9",X"F8",X"99",X"A1",X"03",X"AD",X"0A",X"60",X"99",X"B0",X"03",X"29",X"07",X"18",X"79",X"A1",
		X"03",X"99",X"A1",X"03",X"A9",X"FF",X"99",X"92",X"03",X"60",X"A9",X"00",X"99",X"92",X"03",X"99",
		X"A1",X"03",X"AD",X"0A",X"60",X"99",X"B0",X"03",X"29",X"07",X"18",X"79",X"A1",X"03",X"99",X"A1",
		X"03",X"60",X"A9",X"00",X"99",X"65",X"03",X"99",X"74",X"03",X"AD",X"0A",X"60",X"99",X"83",X"03",
		X"29",X"07",X"18",X"79",X"74",X"03",X"99",X"74",X"03",X"60",X"A9",X"F8",X"99",X"74",X"03",X"AD",
		X"0A",X"60",X"99",X"83",X"03",X"29",X"07",X"18",X"79",X"74",X"03",X"99",X"74",X"03",X"A9",X"FF",
		X"99",X"65",X"03",X"60",X"AD",X"0A",X"60",X"30",X"E1",X"10",X"C7",X"AD",X"0A",X"60",X"30",X"90",
		X"10",X"A8",X"A6",X"CF",X"B5",X"4D",X"AA",X"BD",X"31",X"C1",X"29",X"20",X"D0",X"39",X"A9",X"00",
		X"A2",X"07",X"1D",X"E4",X"02",X"CA",X"10",X"FA",X"A0",X"40",X"AA",X"D0",X"0E",X"98",X"05",X"F2",
		X"85",X"F2",X"A9",X"FD",X"25",X"F5",X"85",X"F5",X"4C",X"B4",X"C9",X"98",X"49",X"FF",X"25",X"F2",
		X"85",X"F2",X"A5",X"D0",X"F0",X"0E",X"A5",X"F0",X"29",X"C0",X"C9",X"C0",X"F0",X"06",X"A9",X"02",
		X"05",X"F5",X"85",X"F5",X"4C",X"C7",X"C9",X"AD",X"43",X"01",X"10",X"05",X"A9",X"10",X"4C",X"C3",
		X"C9",X"A9",X"04",X"05",X"F2",X"85",X"F2",X"60",X"A2",X"01",X"86",X"21",X"A5",X"D0",X"D0",X"01",
		X"60",X"A9",X"FF",X"85",X"4D",X"85",X"4E",X"A6",X"21",X"A0",X"07",X"BD",X"66",X"01",X"D9",X"2E",
		X"04",X"D0",X"11",X"BD",X"64",X"01",X"D9",X"26",X"04",X"D0",X"09",X"BD",X"62",X"01",X"D9",X"1E",
		X"04",X"D0",X"01",X"18",X"90",X"5E",X"A9",X"1E",X"85",X"00",X"85",X"01",X"A9",X"00",X"85",X"38",
		X"85",X"39",X"85",X"3A",X"94",X"4D",X"BD",X"62",X"01",X"85",X"7B",X"BD",X"64",X"01",X"85",X"7C",
		X"BD",X"66",X"01",X"85",X"7D",X"A5",X"38",X"BE",X"46",X"04",X"99",X"46",X"04",X"86",X"38",X"A5",
		X"39",X"BE",X"3E",X"04",X"99",X"3E",X"04",X"86",X"39",X"A5",X"3A",X"BE",X"36",X"04",X"99",X"36",
		X"04",X"86",X"3A",X"A5",X"7B",X"BE",X"1E",X"04",X"99",X"1E",X"04",X"86",X"7B",X"A5",X"7C",X"BE",
		X"26",X"04",X"99",X"26",X"04",X"86",X"7C",X"A5",X"7D",X"BE",X"2E",X"04",X"99",X"2E",X"04",X"86",
		X"7D",X"88",X"10",X"C1",X"88",X"10",X"84",X"C6",X"21",X"30",X"03",X"4C",X"D7",X"C9",X"A5",X"4D",
		X"30",X"06",X"C5",X"4E",X"90",X"02",X"C6",X"4E",X"A5",X"CF",X"49",X"01",X"0A",X"0A",X"05",X"CF",
		X"69",X"05",X"85",X"41",X"A0",X"16",X"A5",X"41",X"F0",X"22",X"29",X"03",X"85",X"CF",X"C6",X"CF",
		X"46",X"41",X"46",X"41",X"A6",X"CF",X"B5",X"4D",X"30",X"0F",X"85",X"4C",X"A9",X"3C",X"85",X"7A",
		X"A9",X"02",X"85",X"37",X"A0",X"1E",X"84",X"00",X"60",X"4C",X"74",X"CA",X"A2",X"00",X"86",X"CF",
		X"CA",X"86",X"3F",X"84",X"00",X"60",X"A2",X"08",X"A0",X"07",X"BD",X"5A",X"04",X"1D",X"59",X"04",
		X"1D",X"58",X"04",X"F0",X"29",X"BD",X"5A",X"04",X"99",X"1E",X"04",X"BD",X"63",X"04",X"99",X"46",
		X"04",X"CA",X"BD",X"5A",X"04",X"99",X"26",X"04",X"BD",X"63",X"04",X"99",X"3E",X"04",X"CA",X"BD",
		X"5A",X"04",X"99",X"2E",X"04",X"BD",X"63",X"04",X"99",X"36",X"04",X"4C",X"E0",X"CA",X"CA",X"CA",
		X"88",X"CA",X"10",X"C6",X"60",X"A2",X"08",X"A0",X"07",X"B9",X"1E",X"04",X"9D",X"5A",X"04",X"B9",
		X"46",X"04",X"9D",X"63",X"04",X"CA",X"B9",X"26",X"04",X"9D",X"5A",X"04",X"B9",X"3E",X"04",X"9D",
		X"63",X"04",X"CA",X"B9",X"2E",X"04",X"9D",X"5A",X"04",X"B9",X"36",X"04",X"9D",X"63",X"04",X"88",
		X"CA",X"10",X"D6",X"60",X"A5",X"4F",X"29",X"1F",X"D0",X"12",X"C6",X"7A",X"D0",X"0E",X"A6",X"CF",
		X"B5",X"4D",X"C9",X"05",X"90",X"03",X"20",X"E2",X"E4",X"4C",X"74",X"CA",X"A9",X"40",X"85",X"30",
		X"A9",X"01",X"85",X"CE",X"A6",X"4C",X"20",X"71",X"CB",X"A6",X"35",X"A5",X"1D",X"29",X"01",X"85",
		X"35",X"F0",X"27",X"8A",X"29",X"01",X"D0",X"22",X"A5",X"4C",X"18",X"69",X"08",X"85",X"4C",X"C6",
		X"37",X"10",X"10",X"C9",X"1D",X"90",X"06",X"20",X"E5",X"CA",X"20",X"E2",X"E4",X"20",X"74",X"CA",
		X"4C",X"6A",X"CB",X"A6",X"4C",X"A9",X"01",X"9D",X"36",X"04",X"A9",X"0E",X"85",X"EB",X"85",X"EC",
		X"60",X"A5",X"4F",X"29",X"07",X"D0",X"26",X"A5",X"1D",X"48",X"29",X"04",X"F0",X"0E",X"BC",X"36",
		X"04",X"C8",X"C0",X"1B",X"90",X"02",X"A0",X"00",X"98",X"9D",X"36",X"04",X"68",X"29",X"08",X"F0",
		X"0C",X"BC",X"36",X"04",X"88",X"10",X"02",X"A0",X"1A",X"98",X"9D",X"36",X"04",X"60",X"A2",X"07",
		X"BD",X"C2",X"CB",X"9D",X"26",X"04",X"BD",X"DA",X"CB",X"9D",X"3E",X"04",X"BD",X"CA",X"CB",X"9D",
		X"1E",X"04",X"BD",X"E2",X"CB",X"9D",X"46",X"04",X"BD",X"D2",X"CB",X"9D",X"36",X"04",X"CA",X"10",
		X"DF",X"60",X"13",X"38",X"53",X"72",X"75",X"80",X"92",X"99",X"50",X"00",X"50",X"50",X"00",X"00",
		X"50",X"00",X"02",X"0F",X"0A",X"0D",X"12",X"0D",X"13",X"01",X"12",X"12",X"0F",X"0C",X"04",X"05",
		X"04",X"03",X"04",X"12",X"05",X"08",X"01",X"03",X"0D",X"05",X"48",X"8A",X"48",X"98",X"48",X"D8",
		X"BA",X"E0",X"D0",X"90",X"10",X"BD",X"06",X"01",X"C9",X"90",X"B0",X"06",X"29",X"F0",X"C9",X"50",
		X"D0",X"03",X"4C",X"08",X"CC",X"4C",X"05",X"CC",X"8D",X"80",X"89",X"8D",X"C0",X"88",X"20",X"8A",
		X"CC",X"20",X"37",X"E1",X"A5",X"D6",X"C9",X"12",X"90",X"0C",X"24",X"F9",X"30",X"08",X"A9",X"04",
		X"85",X"FC",X"A9",X"FF",X"85",X"F9",X"A5",X"FC",X"30",X"10",X"A5",X"D6",X"85",X"40",X"20",X"2A",
		X"E7",X"A5",X"40",X"C5",X"D6",X"F0",X"03",X"20",X"FF",X"E0",X"20",X"31",X"CD",X"20",X"C0",X"CC",
		X"A5",X"E0",X"29",X"0F",X"D0",X"03",X"20",X"06",X"E5",X"E6",X"FB",X"E6",X"02",X"A5",X"FA",X"30",
		X"07",X"AD",X"00",X"78",X"29",X"10",X"F0",X"28",X"AD",X"00",X"78",X"29",X"40",X"F0",X"1E",X"A5",
		X"03",X"D0",X"14",X"85",X"02",X"AD",X"01",X"20",X"49",X"02",X"8D",X"01",X"20",X"A0",X"24",X"29",
		X"02",X"F0",X"02",X"A0",X"20",X"84",X"03",X"8D",X"80",X"88",X"8D",X"40",X"88",X"4C",X"84",X"CC",
		X"A9",X"20",X"85",X"03",X"68",X"A8",X"68",X"AA",X"68",X"40",X"AD",X"00",X"88",X"30",X"04",X"A6",
		X"CF",X"D0",X"0E",X"AD",X"00",X"88",X"29",X"E0",X"85",X"40",X"AD",X"00",X"80",X"29",X"1F",X"05",
		X"40",X"49",X"FF",X"85",X"1D",X"A9",X"07",X"8D",X"0F",X"60",X"8D",X"0F",X"68",X"8D",X"0B",X"60",
		X"AD",X"08",X"60",X"85",X"F0",X"8D",X"0B",X"68",X"AD",X"08",X"68",X"49",X"02",X"85",X"F1",X"60",
		X"A5",X"D0",X"F0",X"0D",X"4A",X"F0",X"05",X"A9",X"10",X"4C",X"CE",X"CC",X"A9",X"20",X"4C",X"F0",
		X"CC",X"A5",X"FB",X"29",X"40",X"F0",X"17",X"A5",X"D6",X"F0",X"0E",X"C9",X"02",X"90",X"05",X"A9",
		X"00",X"4C",X"E6",X"CC",X"A9",X"20",X"4C",X"EB",X"CC",X"A9",X"30",X"4C",X"F0",X"CC",X"A9",X"30",
		X"A6",X"D5",X"10",X"02",X"09",X"01",X"A6",X"D4",X"10",X"02",X"09",X"02",X"AA",X"20",X"12",X"CD",
		X"8A",X"05",X"F8",X"A6",X"F9",X"10",X"05",X"29",X"F7",X"4C",X"0E",X"CD",X"09",X"08",X"8D",X"00",
		X"88",X"60",X"AD",X"00",X"78",X"29",X"10",X"F0",X"17",X"AD",X"00",X"88",X"10",X"05",X"A9",X"C0",
		X"4C",X"2E",X"CD",X"A4",X"CF",X"F0",X"05",X"A9",X"00",X"4C",X"2E",X"CD",X"A9",X"C0",X"85",X"F8",
		X"60",X"A5",X"FB",X"D0",X"3C",X"A5",X"F9",X"10",X"06",X"A5",X"FC",X"30",X"02",X"C6",X"FC",X"A5",
		X"D0",X"F0",X"10",X"EE",X"4E",X"04",X"D0",X"03",X"EE",X"4F",X"04",X"AD",X"6D",X"04",X"30",X"03",
		X"CE",X"6D",X"04",X"A6",X"CF",X"A5",X"88",X"F0",X"18",X"B5",X"00",X"C9",X"08",X"D0",X"12",X"AD",
		X"4E",X"04",X"29",X"03",X"D0",X"0B",X"B5",X"E9",X"F0",X"07",X"F8",X"38",X"E9",X"01",X"95",X"E9",
		X"D8",X"60",X"A6",X"03",X"F0",X"FC",X"86",X"09",X"A9",X"02",X"85",X"08",X"A5",X"CE",X"A4",X"30",
		X"20",X"7F",X"E4",X"A6",X"CF",X"B5",X"EB",X"AA",X"BD",X"92",X"CD",X"48",X"BD",X"91",X"CD",X"48",
		X"60",X"A4",X"CD",X"D3",X"CD",X"A4",X"CD",X"E8",X"CD",X"30",X"CE",X"F4",X"CD",X"0F",X"CE",X"27",
		X"CE",X"F4",X"CD",X"D3",X"CD",X"20",X"37",X"CE",X"20",X"A7",X"D9",X"20",X"A7",X"D9",X"20",X"04",
		X"D9",X"20",X"D9",X"DA",X"20",X"89",X"DA",X"20",X"0A",X"DB",X"20",X"03",X"DA",X"20",X"B4",X"DC",
		X"20",X"F5",X"DB",X"20",X"1F",X"CF",X"20",X"67",X"DD",X"20",X"4D",X"DA",X"20",X"13",X"E4",X"A9",
		X"00",X"85",X"03",X"60",X"20",X"AC",X"D1",X"20",X"2E",X"D2",X"20",X"69",X"D1",X"20",X"57",X"CF",
		X"20",X"CE",X"D2",X"20",X"84",X"D8",X"4C",X"A5",X"CD",X"20",X"AC",X"D1",X"20",X"2E",X"D2",X"20",
		X"CE",X"D2",X"4C",X"A5",X"CD",X"20",X"AC",X"D1",X"20",X"2E",X"D2",X"20",X"91",X"CF",X"20",X"69",
		X"D1",X"20",X"57",X"CF",X"20",X"F1",X"D0",X"20",X"2F",X"D1",X"20",X"84",X"D8",X"4C",X"A5",X"CD",
		X"20",X"AC",X"D1",X"20",X"2E",X"D2",X"20",X"91",X"CF",X"20",X"57",X"CF",X"20",X"F1",X"D0",X"20",
		X"2F",X"D1",X"20",X"84",X"D8",X"4C",X"A5",X"CD",X"20",X"5B",X"CE",X"20",X"67",X"DD",X"4C",X"A5",
		X"CD",X"20",X"3E",X"CE",X"4C",X"A5",X"CD",X"A2",X"A6",X"A9",X"4B",X"4C",X"53",X"E4",X"A5",X"3F",
		X"C9",X"C0",X"90",X"0E",X"68",X"68",X"20",X"68",X"CE",X"20",X"80",X"DC",X"4C",X"A5",X"CD",X"4C",
		X"5A",X"CE",X"68",X"68",X"20",X"C5",X"DD",X"4C",X"CC",X"CD",X"60",X"A9",X"9F",X"05",X"F3",X"85",
		X"F3",X"A9",X"00",X"85",X"F5",X"4C",X"44",X"CE",X"A9",X"02",X"8D",X"7F",X"01",X"20",X"66",X"E4",
		X"A2",X"07",X"86",X"23",X"A2",X"F0",X"86",X"38",X"20",X"66",X"E4",X"20",X"66",X"E4",X"A6",X"38",
		X"A9",X"E0",X"A0",X"00",X"20",X"8A",X"E4",X"A4",X"CF",X"B9",X"4D",X"00",X"C5",X"23",X"D0",X"06",
		X"20",X"86",X"D9",X"4C",X"99",X"CE",X"20",X"76",X"D9",X"A5",X"23",X"49",X"07",X"18",X"69",X"01",
		X"0A",X"20",X"F8",X"D9",X"A2",X"00",X"A9",X"06",X"A0",X"00",X"20",X"8A",X"E4",X"A6",X"23",X"BD",
		X"36",X"04",X"20",X"F9",X"CE",X"A6",X"23",X"BD",X"3E",X"04",X"20",X"F9",X"CE",X"A6",X"23",X"BD",
		X"46",X"04",X"20",X"F9",X"CE",X"A2",X"00",X"A9",X"04",X"A0",X"00",X"20",X"8A",X"E4",X"20",X"6E",
		X"D9",X"A6",X"23",X"18",X"BD",X"2E",X"04",X"20",X"47",X"DE",X"A6",X"23",X"BD",X"26",X"04",X"20",
		X"47",X"DE",X"A6",X"23",X"BD",X"1E",X"04",X"20",X"47",X"DE",X"20",X"66",X"E4",X"A5",X"38",X"38",
		X"E9",X"0D",X"85",X"38",X"C6",X"23",X"10",X"83",X"60",X"0A",X"A8",X"D0",X"09",X"AE",X"48",X"4D",
		X"AD",X"49",X"4D",X"4C",X"0C",X"CF",X"BE",X"5C",X"4D",X"B9",X"5D",X"4D",X"4C",X"56",X"D9",X"48",
		X"29",X"F0",X"4A",X"4A",X"4A",X"20",X"F8",X"D9",X"68",X"29",X"0F",X"0A",X"4C",X"F8",X"D9",X"A6",
		X"CF",X"B5",X"00",X"C9",X"1A",X"F0",X"13",X"C9",X"14",X"F0",X"0F",X"C9",X"12",X"F0",X"0B",X"C9",
		X"1E",X"F0",X"07",X"A9",X"7F",X"25",X"F3",X"85",X"F3",X"60",X"20",X"66",X"E4",X"A9",X"80",X"05",
		X"F3",X"85",X"F3",X"20",X"47",X"CF",X"60",X"A9",X"14",X"A2",X"5C",X"A0",X"00",X"20",X"8A",X"E4",
		X"A6",X"CF",X"E8",X"8A",X"4C",X"19",X"CF",X"20",X"7E",X"D9",X"A2",X"0E",X"86",X"21",X"BD",X"BF",
		X"03",X"F0",X"27",X"20",X"66",X"E4",X"A6",X"21",X"BD",X"0B",X"03",X"85",X"07",X"BD",X"1A",X"03",
		X"85",X"06",X"BD",X"38",X"03",X"85",X"05",X"BD",X"47",X"03",X"85",X"04",X"A9",X"00",X"85",X"0A",
		X"A2",X"04",X"20",X"A9",X"E4",X"A9",X"E0",X"20",X"86",X"E4",X"C6",X"21",X"A6",X"21",X"D0",X"CE",
		X"60",X"A6",X"CF",X"B5",X"00",X"C9",X"1C",X"F0",X"28",X"B5",X"F6",X"29",X"03",X"AA",X"BD",X"42",
		X"C1",X"85",X"22",X"A2",X"04",X"86",X"21",X"A5",X"22",X"0A",X"65",X"CF",X"A8",X"B9",X"44",X"01",
		X"30",X"03",X"20",X"C2",X"CF",X"C6",X"22",X"C6",X"21",X"10",X"EC",X"20",X"FC",X"CF",X"4C",X"33",
		X"DB",X"60",X"A4",X"22",X"B9",X"97",X"04",X"18",X"79",X"CB",X"D0",X"AA",X"BD",X"7D",X"D0",X"10",
		X"0E",X"8A",X"18",X"7D",X"7D",X"D0",X"AA",X"A9",X"00",X"99",X"97",X"04",X"BD",X"7D",X"D0",X"BE",
		X"97",X"04",X"48",X"A5",X"4F",X"39",X"DE",X"D0",X"D0",X"01",X"E8",X"8A",X"99",X"97",X"04",X"68",
		X"0A",X"A8",X"B9",X"16",X"D0",X"BE",X"15",X"D0",X"20",X"53",X"E4",X"60",X"A6",X"CF",X"B5",X"F6");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
