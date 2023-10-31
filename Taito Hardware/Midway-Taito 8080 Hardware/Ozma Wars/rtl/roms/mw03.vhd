library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity mw03 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of mw03 is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"FB",X"CA",X"ED",X"0F",X"47",X"3A",X"29",X"21",X"3C",X"32",X"29",X"21",X"23",X"7E",X"A7",X"CA",
		X"7D",X"10",X"35",X"21",X"68",X"20",X"3A",X"2A",X"21",X"87",X"87",X"87",X"CD",X"2D",X"02",X"FE",
		X"20",X"DA",X"E2",X"10",X"5E",X"23",X"56",X"78",X"78",X"FE",X"50",X"DA",X"48",X"10",X"DB",X"02",
		X"E6",X"04",X"CA",X"36",X"10",X"1D",X"78",X"FE",X"66",X"C2",X"48",X"10",X"3A",X"4A",X"20",X"C6",
		X"04",X"92",X"14",X"D2",X"48",X"10",X"15",X"15",X"C5",X"4B",X"42",X"23",X"5E",X"23",X"56",X"1A",
		X"2B",X"77",X"23",X"13",X"1A",X"77",X"13",X"D5",X"23",X"5E",X"23",X"56",X"D5",X"E5",X"23",X"7E",
		X"23",X"66",X"81",X"6F",X"7C",X"80",X"67",X"EB",X"E1",X"2B",X"2B",X"2B",X"2B",X"72",X"2B",X"73",
		X"EB",X"C1",X"D1",X"F1",X"A7",X"F8",X"C3",X"25",X"15",X"13",X"C3",X"81",X"10",X"23",X"5E",X"23",
		X"56",X"1A",X"A7",X"CA",X"79",X"10",X"FE",X"CD",X"CA",X"63",X"11",X"FE",X"EB",X"CA",X"9A",X"11",
		X"FE",X"01",X"CA",X"2E",X"11",X"FE",X"C3",X"CA",X"23",X"11",X"FE",X"AF",X"CA",X"F0",X"10",X"21",
		X"E8",X"20",X"3A",X"2A",X"21",X"87",X"87",X"CD",X"2D",X"02",X"7E",X"FE",X"70",X"01",X"D4",X"FE",
		X"CA",X"BC",X"10",X"01",X"F6",X"FF",X"7E",X"FE",X"40",X"D2",X"C7",X"10",X"EB",X"F3",X"2A",X"3B",
		X"20",X"09",X"22",X"3B",X"20",X"FB",X"EB",X"36",X"00",X"21",X"68",X"20",X"3A",X"2A",X"21",X"87",
		X"87",X"87",X"CD",X"2D",X"02",X"5E",X"23",X"56",X"23",X"23",X"23",X"4E",X"23",X"46",X"EB",X"C3",
		X"7F",X"15",X"3A",X"2A",X"21",X"21",X"E8",X"20",X"87",X"87",X"CD",X"2D",X"02",X"C3",X"AA",X"10",
		X"3A",X"2A",X"21",X"21",X"E8",X"20",X"87",X"87",X"CD",X"2D",X"02",X"F6",X"80",X"77",X"13",X"1A",
		X"4F",X"13",X"1A",X"47",X"13",X"23",X"1A",X"77",X"13",X"23",X"73",X"23",X"72",X"21",X"68",X"20",
		X"3A",X"2A",X"21",X"87",X"87",X"87",X"CD",X"2D",X"02",X"11",X"06",X"00",X"19",X"71",X"23",X"70",
		X"C3",X"AA",X"10",X"13",X"1A",X"4F",X"13",X"1A",X"47",X"C5",X"D1",X"C3",X"81",X"10",X"21",X"E8",
		X"20",X"3A",X"2A",X"21",X"87",X"87",X"CD",X"2D",X"02",X"E6",X"7F",X"77",X"23",X"13",X"1A",X"4F",
		X"13",X"1A",X"47",X"13",X"1A",X"13",X"77",X"23",X"73",X"23",X"72",X"21",X"68",X"20",X"3A",X"2A",
		X"21",X"87",X"87",X"87",X"CD",X"2D",X"02",X"11",X"06",X"00",X"19",X"71",X"23",X"70",X"06",X"01",
		X"C3",X"13",X"10",X"3A",X"2A",X"21",X"F5",X"06",X"10",X"0E",X"00",X"21",X"E8",X"20",X"7E",X"A7",
		X"CA",X"83",X"11",X"23",X"23",X"23",X"23",X"0C",X"05",X"C2",X"6E",X"11",X"F1",X"13",X"13",X"13",
		X"C3",X"81",X"10",X"79",X"32",X"2A",X"21",X"EB",X"23",X"5E",X"23",X"56",X"23",X"E5",X"CD",X"4D",
		X"0F",X"E1",X"F1",X"EB",X"32",X"2A",X"21",X"C3",X"81",X"10",X"21",X"68",X"20",X"3A",X"2A",X"21",
		X"87",X"87",X"87",X"CD",X"2D",X"02",X"23",X"23",X"13",X"06",X"04",X"CD",X"77",X"0F",X"C3",X"81",
		X"10",X"21",X"2D",X"21",X"06",X"08",X"CD",X"40",X"00",X"3E",X"0F",X"32",X"45",X"21",X"AF",X"32",
		X"2C",X"21",X"3A",X"E8",X"20",X"FE",X"40",X"CA",X"10",X"12",X"3A",X"2D",X"21",X"A7",X"F2",X"EC",
		X"11",X"2A",X"C7",X"1C",X"06",X"70",X"CD",X"E1",X"06",X"AF",X"32",X"2D",X"21",X"32",X"2E",X"21",
		X"DF",X"01",X"2A",X"D8",X"1C",X"06",X"28",X"CD",X"E1",X"06",X"DF",X"01",X"21",X"2D",X"21",X"3A",
		X"2C",X"21",X"CD",X"2D",X"02",X"C2",X"C1",X"12",X"11",X"45",X"21",X"1A",X"21",X"E8",X"20",X"87",
		X"87",X"CD",X"2D",X"02",X"C2",X"71",X"12",X"EB",X"35",X"EB",X"F2",X"FB",X"11",X"3E",X"0F",X"12",
		X"DF",X"01",X"3A",X"E8",X"20",X"FE",X"40",X"C2",X"54",X"12",X"3A",X"2D",X"21",X"A7",X"FA",X"3F",
		X"12",X"3E",X"80",X"32",X"2D",X"21",X"21",X"C7",X"1C",X"CD",X"F4",X"14",X"21",X"3E",X"20",X"34",
		X"7E",X"E6",X"0F",X"47",X"0E",X"08",X"21",X"1A",X"39",X"CD",X"3D",X"16",X"C3",X"54",X"12",X"3A",
		X"EC",X"20",X"FE",X"40",X"C2",X"54",X"12",X"3A",X"2E",X"21",X"A7",X"FA",X"54",X"12",X"21",X"D8",
		X"1C",X"CD",X"F4",X"14",X"21",X"2C",X"21",X"34",X"3A",X"40",X"20",X"06",X"04",X"0E",X"04",X"D6",
		X"08",X"DA",X"69",X"12",X"04",X"0D",X"C2",X"5F",X"12",X"78",X"BE",X"D2",X"C2",X"11",X"C3",X"BE",
		X"11",X"FE",X"40",X"D2",X"07",X"12",X"21",X"3D",X"20",X"35",X"7E",X"E6",X"35",X"C2",X"07",X"12",
		X"1A",X"21",X"68",X"20",X"87",X"87",X"87",X"CD",X"2D",X"02",X"D6",X"08",X"5F",X"23",X"56",X"23",
		X"23",X"23",X"23",X"7E",X"1F",X"A7",X"82",X"57",X"FE",X"20",X"DA",X"10",X"12",X"3A",X"2C",X"21",
		X"21",X"2D",X"21",X"CD",X"2D",X"02",X"36",X"01",X"3A",X"2C",X"21",X"21",X"35",X"21",X"87",X"CD",
		X"2D",X"02",X"73",X"23",X"72",X"EB",X"11",X"58",X"13",X"06",X"03",X"CD",X"A0",X"15",X"C3",X"10",
		X"12",X"3A",X"2C",X"21",X"21",X"35",X"21",X"87",X"CD",X"2D",X"02",X"5E",X"23",X"56",X"DB",X"02",
		X"E6",X"04",X"3E",X"FA",X"C2",X"D9",X"12",X"3E",X"FB",X"83",X"2B",X"77",X"E5",X"CD",X"4F",X"13",
		X"E1",X"7E",X"FE",X"18",X"DA",X"31",X"13",X"23",X"66",X"6F",X"11",X"58",X"13",X"06",X"03",X"CD",
		X"A0",X"15",X"DF",X"01",X"79",X"A7",X"CA",X"10",X"12",X"3A",X"2C",X"21",X"21",X"35",X"21",X"87",
		X"CD",X"2D",X"02",X"5F",X"FE",X"20",X"DA",X"10",X"12",X"23",X"56",X"FE",X"28",X"D2",X"31",X"13",
		X"3A",X"4A",X"20",X"BA",X"D2",X"31",X"13",X"C6",X"0F",X"BA",X"DA",X"31",X"13",X"CD",X"37",X"13",
		X"3E",X"01",X"32",X"2E",X"20",X"DF",X"01",X"3A",X"2E",X"20",X"A7",X"C2",X"25",X"13",X"C3",X"10",
		X"12",X"CD",X"37",X"13",X"C3",X"10",X"12",X"3A",X"2C",X"21",X"21",X"2D",X"21",X"CD",X"2D",X"02",
		X"36",X"00",X"3A",X"2C",X"21",X"21",X"35",X"21",X"87",X"CD",X"2D",X"02",X"5F",X"23",X"56",X"21",
		X"58",X"13",X"06",X"03",X"EB",X"C3",X"DD",X"15",X"0F",X"00",X"0F",X"11",X"14",X"1F",X"21",X"46",
		X"21",X"06",X"28",X"CD",X"34",X"16",X"DF",X"01",X"06",X"14",X"21",X"46",X"21",X"C5",X"E5",X"7E",
		X"23",X"66",X"6F",X"CD",X"0C",X"16",X"E1",X"C1",X"DF",X"01",X"23",X"23",X"05",X"C2",X"6D",X"13",
		X"06",X"14",X"21",X"46",X"21",X"3A",X"3F",X"20",X"C6",X"01",X"4F",X"E5",X"7E",X"23",X"66",X"6F",
		X"C5",X"CD",X"2C",X"16",X"C1",X"E1",X"E5",X"5E",X"23",X"56",X"1D",X"7B",X"FE",X"28",X"D2",X"A3",
		X"13",X"1E",X"D8",X"2B",X"73",X"EB",X"C5",X"CD",X"0C",X"16",X"C1",X"E1",X"23",X"23",X"05",X"C2",
		X"B7",X"13",X"06",X"14",X"21",X"46",X"21",X"0D",X"C2",X"8B",X"13",X"DF",X"01",X"C3",X"85",X"13",
		X"01",X"00",X"00",X"3A",X"58",X"20",X"A7",X"CA",X"18",X"14",X"0F",X"D2",X"D7",X"13",X"21",X"A5",
		X"1D",X"CD",X"F4",X"14",X"C3",X"E4",X"13",X"DF",X"01",X"3A",X"30",X"20",X"A7",X"CA",X"D7",X"13",
		X"AF",X"32",X"30",X"20",X"3A",X"58",X"20",X"3D",X"87",X"21",X"F4",X"13",X"CD",X"2D",X"02",X"5F",
		X"23",X"56",X"EB",X"E9",X"4E",X"14",X"94",X"14",X"78",X"14",X"EC",X"14",X"7E",X"14",X"B6",X"14",
		X"78",X"14",X"D9",X"14",X"3A",X"58",X"20",X"3C",X"32",X"58",X"20",X"FE",X"09",X"DC",X"C0",X"01",
		X"3E",X"01",X"32",X"58",X"20",X"CD",X"C0",X"01",X"21",X"A5",X"1D",X"CD",X"F4",X"14",X"21",X"73",
		X"1D",X"CD",X"F4",X"14",X"3A",X"46",X"20",X"3D",X"CA",X"31",X"14",X"21",X"90",X"1D",X"CD",X"F4",
		X"14",X"CD",X"37",X"14",X"C3",X"1E",X"14",X"21",X"03",X"24",X"3A",X"FB",X"1F",X"01",X"20",X"00",
		X"16",X"D0",X"86",X"5F",X"09",X"15",X"C2",X"42",X"14",X"A7",X"C8",X"C3",X"48",X"15",X"21",X"BF",
		X"1D",X"CD",X"F4",X"14",X"21",X"1A",X"24",X"3A",X"FA",X"1F",X"CD",X"3D",X"14",X"21",X"F9",X"1D",
		X"CD",X"F4",X"14",X"21",X"F4",X"01",X"DF",X"01",X"2B",X"7C",X"B5",X"C2",X"66",X"14",X"3A",X"58",
		X"20",X"3C",X"32",X"58",X"20",X"C3",X"C3",X"13",X"21",X"C7",X"1E",X"C3",X"60",X"14",X"21",X"BF",
		X"1D",X"CD",X"F4",X"14",X"21",X"38",X"1E",X"DB",X"02",X"E6",X"08",X"CA",X"60",X"14",X"21",X"60",
		X"1E",X"C3",X"60",X"14",X"3E",X"01",X"32",X"40",X"20",X"DF",X"02",X"78",X"E6",X"3F",X"47",X"03",
		X"0A",X"32",X"5B",X"20",X"3A",X"30",X"20",X"A7",X"C2",X"04",X"14",X"2A",X"3B",X"20",X"7C",X"A7",
		X"FA",X"04",X"14",X"C3",X"99",X"14",X"3E",X"08",X"32",X"40",X"20",X"21",X"90",X"01",X"22",X"3B",
		X"20",X"01",X"00",X"10",X"3E",X"30",X"32",X"5B",X"20",X"DF",X"02",X"AF",X"32",X"66",X"20",X"3A",
		X"30",X"20",X"A7",X"CA",X"C4",X"14",X"C3",X"04",X"14",X"3E",X"0B",X"32",X"40",X"20",X"3E",X"01",
		X"32",X"3F",X"20",X"21",X"F4",X"01",X"22",X"3B",X"20",X"C3",X"99",X"14",X"3E",X"0D",X"32",X"40",
		X"20",X"C3",X"99",X"14",X"5E",X"23",X"56",X"23",X"4E",X"23",X"46",X"23",X"E5",X"7E",X"C5",X"EB",
		X"0E",X"08",X"47",X"CD",X"3D",X"16",X"EB",X"C1",X"E1",X"0D",X"CA",X"1D",X"15",X"78",X"A7",X"CA",
		X"FB",X"14",X"C5",X"DF",X"01",X"05",X"C2",X"13",X"15",X"C1",X"C3",X"FB",X"14",X"23",X"7E",X"A7",
		X"C8",X"23",X"C3",X"F4",X"14",X"C5",X"CD",X"6C",X"15",X"78",X"C1",X"F5",X"7C",X"FE",X"24",X"DA",
		X"62",X"15",X"F1",X"E5",X"36",X"00",X"C5",X"47",X"C5",X"1A",X"13",X"D5",X"EB",X"6F",X"26",X"00",
		X"05",X"FA",X"48",X"15",X"29",X"C3",X"40",X"15",X"EB",X"7E",X"B3",X"77",X"23",X"72",X"D1",X"C1",
		X"0D",X"C2",X"38",X"15",X"78",X"C1",X"E1",X"05",X"C8",X"D5",X"11",X"20",X"00",X"19",X"D1",X"C3",
		X"2B",X"15",X"79",X"3D",X"13",X"C2",X"63",X"15",X"F1",X"C3",X"57",X"15",X"7D",X"E6",X"07",X"47",
		X"37",X"0E",X"03",X"7C",X"1F",X"67",X"7D",X"1F",X"6F",X"A7",X"0D",X"C2",X"73",X"15",X"C9",X"C5",
		X"CD",X"70",X"15",X"C1",X"11",X"20",X"00",X"AF",X"7C",X"FE",X"24",X"DA",X"9A",X"15",X"AF",X"E5",
		X"C5",X"77",X"0D",X"23",X"77",X"C2",X"91",X"15",X"C1",X"E1",X"05",X"C8",X"19",X"C3",X"88",X"15",
		X"0E",X"00",X"C5",X"CD",X"6C",X"15",X"78",X"C1",X"E5",X"C5",X"47",X"C5",X"1A",X"13",X"D5",X"EB",
		X"6F",X"26",X"00",X"05",X"FA",X"BB",X"15",X"29",X"C3",X"B3",X"15",X"EB",X"7E",X"A3",X"B1",X"4F",
		X"7E",X"B3",X"77",X"23",X"7E",X"A2",X"B1",X"4F",X"7E",X"B2",X"77",X"69",X"D1",X"C1",X"78",X"C1",
		X"4D",X"E1",X"05",X"C8",X"D5",X"11",X"20",X"00",X"19",X"D1",X"C3",X"A8",X"15",X"C5",X"CD",X"6C",
		X"15",X"78",X"C1",X"C5",X"47",X"C5",X"1A",X"13",X"D5",X"EB",X"6F",X"26",X"00",X"05",X"FA",X"F5",
		X"15",X"29",X"C3",X"ED",X"15",X"EB",X"7B",X"2F",X"A6",X"77",X"23",X"7A",X"2F",X"A6",X"77",X"11",
		X"1F",X"00",X"19",X"D1",X"C1",X"78",X"C1",X"05",X"C2",X"E3",X"15",X"C9",X"CD",X"6C",X"15",X"48",
		X"06",X"01",X"11",X"C0",X"13",X"1A",X"13",X"EB",X"6F",X"26",X"00",X"0D",X"FA",X"23",X"16",X"29",
		X"C3",X"1B",X"16",X"EB",X"7E",X"B3",X"77",X"23",X"7E",X"B2",X"77",X"C9",X"11",X"C0",X"13",X"06",
		X"01",X"C3",X"DD",X"15",X"1A",X"77",X"13",X"23",X"05",X"C2",X"34",X"16",X"C9",X"C5",X"E5",X"21",
		X"5B",X"16",X"58",X"16",X"00",X"EB",X"29",X"29",X"29",X"19",X"EB",X"E1",X"1A",X"77",X"13",X"C5",
		X"01",X"20",X"00",X"09",X"C1",X"0D",X"C2",X"4C",X"16",X"C1",X"C9",X"00",X"3E",X"45",X"49",X"51",
		X"3E",X"00",X"00",X"00",X"00",X"21",X"7F",X"01",X"00",X"00",X"00",X"00",X"23",X"45",X"49",X"49",
		X"31",X"00",X"00",X"00",X"42",X"41",X"49",X"59",X"66",X"00",X"00",X"00",X"0C",X"14",X"24",X"7F",
		X"04",X"00",X"00",X"00",X"72",X"51",X"51",X"51",X"4E",X"00",X"00",X"00",X"1E",X"29",X"49",X"49",
		X"46",X"00",X"00",X"00",X"40",X"47",X"48",X"50",X"60",X"00",X"00",X"00",X"36",X"49",X"49",X"49",
		X"36",X"00",X"00",X"00",X"31",X"49",X"49",X"4A",X"3C",X"00",X"00",X"00",X"1F",X"24",X"44",X"24",
		X"1F",X"00",X"00",X"00",X"7F",X"49",X"49",X"49",X"36",X"00",X"00",X"00",X"3E",X"41",X"41",X"41",
		X"22",X"00",X"00",X"00",X"7F",X"41",X"41",X"41",X"3E",X"00",X"00",X"00",X"7F",X"49",X"49",X"49",
		X"41",X"00",X"00",X"00",X"7F",X"48",X"48",X"48",X"40",X"00",X"00",X"00",X"3E",X"41",X"41",X"45",
		X"47",X"00",X"00",X"00",X"7F",X"08",X"08",X"08",X"7F",X"00",X"00",X"00",X"00",X"41",X"7F",X"41",
		X"00",X"00",X"00",X"00",X"02",X"01",X"01",X"01",X"7E",X"00",X"00",X"00",X"7F",X"08",X"14",X"22",
		X"41",X"00",X"00",X"00",X"7F",X"01",X"01",X"01",X"01",X"00",X"00",X"00",X"7F",X"20",X"18",X"20",
		X"7F",X"00",X"00",X"00",X"7F",X"10",X"08",X"04",X"7F",X"00",X"00",X"00",X"3E",X"41",X"41",X"41",
		X"3E",X"00",X"00",X"00",X"7F",X"48",X"48",X"48",X"30",X"00",X"00",X"00",X"3E",X"41",X"45",X"42",
		X"3D",X"00",X"00",X"00",X"7F",X"48",X"4C",X"4A",X"31",X"00",X"00",X"00",X"32",X"49",X"49",X"49",
		X"26",X"00",X"00",X"00",X"40",X"40",X"7F",X"40",X"40",X"00",X"00",X"00",X"7E",X"01",X"01",X"01",
		X"7E",X"00",X"00",X"00",X"7C",X"02",X"01",X"02",X"7C",X"00",X"00",X"00",X"7F",X"02",X"0C",X"02",
		X"7F",X"00",X"00",X"00",X"63",X"14",X"08",X"14",X"63",X"00",X"00",X"00",X"60",X"10",X"0F",X"10",
		X"60",X"00",X"00",X"00",X"43",X"45",X"49",X"51",X"61",X"00",X"00",X"00",X"08",X"14",X"22",X"41",
		X"00",X"00",X"00",X"00",X"00",X"41",X"22",X"14",X"08",X"00",X"00",X"00",X"14",X"14",X"14",X"14",
		X"14",X"00",X"00",X"00",X"22",X"14",X"7F",X"14",X"22",X"00",X"00",X"00",X"30",X"40",X"45",X"48",
		X"30",X"00",X"00",X"00",X"36",X"49",X"49",X"35",X"02",X"05",X"00",X"00",X"08",X"08",X"3E",X"08",
		X"08",X"00",X"00",X"00",X"08",X"08",X"08",X"08",X"08",X"00",X"00",X"00",X"04",X"08",X"08",X"08",
		X"10",X"00",X"00",X"00",X"00",X"00",X"7B",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"10",X"20",X"40",X"00",X"00",X"00",X"FB",X"17",X"00",X"00",X"B0",
		X"01",X"B8",X"03",X"5C",X"07",X"EE",X"0E",X"13",X"19",X"4F",X"1E",X"E8",X"02",X"4F",X"1E",X"13",
		X"19",X"EE",X"0E",X"5C",X"07",X"B8",X"03",X"B0",X"01",X"00",X"00",X"DB",X"17",X"00",X"00",X"B0");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;