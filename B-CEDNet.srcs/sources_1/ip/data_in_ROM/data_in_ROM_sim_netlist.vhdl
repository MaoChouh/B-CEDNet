-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Tue Oct 16 12:54:51 2018
-- Host        : DESKTOP-M0UOV8J running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               f:/Vivado_prj/B-CEDNet/B-CEDNet.srcs/sources_1/ip/data_in_ROM/data_in_ROM_sim_netlist.vhdl
-- Design      : data_in_ROM
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcvu9p-flga2104-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity data_in_ROM_blk_mem_gen_prim_wrapper_init is
  port (
    douta : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clka : in STD_LOGIC;
    sleep : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of data_in_ROM_blk_mem_gen_prim_wrapper_init : entity is "blk_mem_gen_prim_wrapper_init";
end data_in_ROM_blk_mem_gen_prim_wrapper_init;

architecture STRUCTURE of data_in_ROM_blk_mem_gen_prim_wrapper_init is
  signal \DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_143\ : STD_LOGIC;
  signal \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASOUTDBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASOUTSBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASDOUTB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASDOUTPB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute box_type : string;
  attribute box_type of \DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram\ : label is "PRIMITIVE";
begin
\DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 1,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_01 => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_02 => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_03 => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_04 => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_05 => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_06 => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_07 => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_08 => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_09 => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_0A => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_0B => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_0C => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_0D => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_0E => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A18E919292939494959696989899999BA5A5",
      INIT_0F => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5892B3535363839393B3E404143434055A5A5",
      INIT_10 => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A57A17161415171715161A1C1D1C1C1C29A5A5",
      INIT_11 => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A57C20171415171718181A1C1E1E1D1D33A5A5",
      INIT_12 => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A57B25191111141616171A1C1E1E1C1C34A5A5",
      INIT_13 => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A57D2118111011121215191A1D1C171835A5A5",
      INIT_14 => X"8384858586868889898A8A8B8C93671A15111010101215191A1C18141633A59A",
      INIT_15 => X"2D2E2F3031333434353536373837281412101011111115181C1C17121420483F",
      INIT_16 => X"2122242424252526262425252621151211111014151214181A1C171214141210",
      INIT_17 => X"2222222424252526262525252622151011101014161009101217181112151410",
      INIT_18 => X"22212224242525262625262627221514151110141605674E573D181112151410",
      INIT_19 => X"2222222424252526262525262722171A19111014171D89838B77181214161511",
      INIT_1A => X"22222222242425262625252526221A201C1110121517857E865B181515161612",
      INIT_1B => X"22242424242425262625262526241D221D1110121519827C83581A1818181816",
      INIT_1C => X"24242424242424252625252526241D221E121011150E7E7C81541D1C1C1A1A1A",
      INIT_1D => X"22242419141111121214141415150F1410070708101D807E82501E1D1D1D1D1C",
      INIT_1E => X"24242428B49491766E6F6C69656263605E5C5B5652647D80834D1E1C1C1D1D1C",
      INIT_1F => X"24242431A8B0AC93868989868584868686868482807D797E824B1C1717181919",
      INIT_20 => X"2224242D9FA7A58E7E8185848484858685868482807E7A7D8247181211141414",
      INIT_21 => X"22242431969FA08C7C8082848384888A8A88868484807A7C8244161111121110",
      INIT_22 => X"2224242691818373676A6D6F6F73767979797977797C7E7D834115111111100F",
      INIT_23 => X"22222416110D0B0B0B0A0A0A090B0D0F0F0F100F114A8080833F161111110F0F",
      INIT_24 => X"22222424242526262525262626251A121511111010248180833D161412110F0F",
      INIT_25 => X"21222424242526262525252626251A1718111110102E827E833B17151412100F",
      INIT_26 => X"21222424242526262525252625251C1C181111100F30807C8136181716141210",
      INIT_27 => X"21222224242525262526262625251C1F191111100E357C7A7E3D191918181716",
      INIT_28 => X"20212224242525252626262625251C1F1A1111100E307B6D76311C1C1A1C1C1A",
      INIT_29 => X"20212224252525252526262626251C201C1111101002180D0F101D1C1C1C1D1D",
      INIT_2A => X"20202224242525252525262626251D201A1111121010151C1C1F1A1A1A1C1C1C",
      INIT_2B => X"20202124242525252526262626241D1F161011161211151A1C1D191818181818",
      INIT_2C => X"211F2022242425252626262626241C19111011191611161C1C1C161415151414",
      INIT_2D => X"221F1F110D0E0E0F10101112121009060303060F0B070B111011111212121110",
      INIT_2E => X"22201A548C6B6D6E6C676362605F605F6062605F5F5D555052571C1214141110",
      INIT_2F => X"222018679085898E8B848385858483848588888685847E7A797E34121412110F",
      INIT_30 => X"22211964988C8B918D858283838283838486868483827C7B7C7B1F1214121110",
      INIT_31 => X"2221176F9B8B8D938C827E7E80807E8182828283817D7C7C7E83281112121110",
      INIT_32 => X"22211957906E6E747167656569747D8180807C6F6B716E6F79771E1414141212",
      INIT_33 => X"2221200F0B0D0E0E0D0E0E0E0B184B80807E7326090B090A100E0F1918181816",
      INIT_34 => X"222121202121242625252626262117357D7C77241611161D21241F201F1D1C1A",
      INIT_35 => X"22222121212024252525262626201E1A537A7B5E05121721588574796C341D1D",
      INIT_36 => X"22212122212122242524252526211F17527B7C731214182267A5A5A59C3D1D1D",
      INIT_37 => X"2221200E0A0B0B0E0F0F1010120F0937797D7E751514181D2B3834383521191A",
      INIT_38 => X"2222165079676B6A6765625C585762797E8081731014181C1D18121415151514",
      INIT_39 => X"2422125E7B7A818180817B777574777B7D8083660315181C1D18121214121010",
      INIT_3A => X"242214567A7B7D7E7E807C7976757A7D808383291215191C1C17111111100F0F",
      INIT_3B => X"22220F5E7A7B7C7D7E807E7B7A7B808284853B0E1214191C1C17111011100F0F",
      INIT_3C => X"242212486B60626467696967676B6D6B5B220D111012191C1D17111111100F0F",
      INIT_3D => X"24221F0F0A0E0D0D0D0D0E0D0B050300071010111114191C1C16111111111010",
      INIT_3E => X"22212222222224252425262624181110101010111214191C1C18141412121111",
      INIT_3F => X"22221E0B090D0E0E0E0E0F0D0A050303030502060E0A0A100E0F161817161514",
      INIT_40 => X"22220F6A89757371757475716B65625E605F6B451141695A5F52061A1A1C1C1A",
      INIT_41 => X"22220A8BA2A4A0A0A3A599928A8382818283856525668684827C111A1C1C3362",
      INIT_42 => X"22220D8AACADAAA8A5A39A928983838383838557155B8583826B0318181852A5",
      INIT_43 => X"22221598B2ADAAA8A49F96928B8585858585865E2165848381730A1A1A194BA5",
      INIT_44 => X"22220B77988A888A8C837E7D7671727373738450175C8476846D061C1D1C4DA5",
      INIT_45 => X"22221E0E0F0D0E0E0B0A0B0807060607080712091406140A150A171D1D1D4EA5",
      INIT_46 => X"2220222120212526222225201E1C1D1D1D1E1E1E1D1D1D1F25252122211D4EA5",
      INIT_47 => X"22221C0A110B0E0F0E0E100F0D0B0B0D0E0D0D141C1D1E2B63796E795A1E4AA5",
      INIT_48 => X"24221A7A9590908C8885857C6B60625F5F606B301219192D8EA5A5A5862047A5",
      INIT_49 => X"242436A0A0ADB0ABA9A8A99D897C81818283834F0E1518287EA5A5A57A1C48A5",
      INIT_4A => X"2224339B9CADB2AAAAA8AB9D857A7C817E7E823E0E14192D82A5A5A5771A48A5",
      INIT_4B => X"22224DC39AAFB1ABAAA7A99F847A7C7E7B7C80430D12192E83A5A5A5761C4AA5",
      INIT_4C => X"22223BB4908B9390908D8D886F757C807A7D80350F12192F84A5A5A5751C4BA5",
      INIT_4D => X"22221C1A120D0D0D0E0E0D0B0B1D5C817E7E71151111192E85A5A5A574194BA5",
      INIT_4E => X"212122242422242524252525261D0E4D7A8180261412192F86A5A5A572154AA5",
      INIT_4F => X"212122242424242524252626251C120D7180814B0E12193088A5A5A56F1248A5",
      INIT_50 => X"212121222424242524252626251A1112718081550812193189A5A5A56D114AA5",
      INIT_51 => X"2121181E1E0F0F0F10111212120D08547D7E815A061219338AA5A5A56C104AA5",
      INIT_52 => X"22214CD3E6B2848A8585887E645D717E807E8152081218338BA5A5A56B104BA5",
      INIT_53 => X"222167FAFFEDABA8A8A1AFA2837E7E7E7E7E813E0E1219348CA5A5A569104CA5",
      INIT_54 => X"222256EAFFF6B5A4ADA4ABA1827D7D7D7E80760B1012183B94A5A5A567124DA5",
      INIT_55 => X"222272FDFFFDC4A8ABA7A79F82807E7E808024101111183E99A5A5A566184FA5",
      INIT_56 => X"22225FD2E0DABC8D8B938B83726F6F6D5D1D0F101012183993A5A5A5651C53A5",
      INIT_57 => X"222217222726220F0B0E0E0F0E0507090A0F100F1012193891A5A5A5641D54A5",
      INIT_58 => X"2221222224242525221F1D1E201A1F1D140F0F0F1011193993A5A5A5621954A5",
      INIT_59 => X"2221212122221536556F726B5F4D2E080D100F0F1011183B94A5A5A55E1453A5",
      INIT_5A => X"35101E222066D6C79CA99F9389817C7243030F0F0F11173C94A5A5A55D1153A5",
      INIT_5B => X"F8861F2182FFFFD29F9D9D9388817E80815E000F0F11173C96A5A5A55B1053A5",
      INIT_5C => X"F652226CF9FFFFBB9AA99C928A817D7E807D4A081011173E96A5A5A55A1054A5",
      INIT_5D => X"D31716CAF7FFF9BE9A95837C798080817D7D7C1C1012183F98A5A5A5581155A5",
      INIT_5E => X"90225DE7F9FAFECB622D1414183B6F827B7C7A350F11184199A5A5A5561255A5",
      INIT_5F => X"6E227CF0F8FFFA521C252526241A08627C7D7B3B0B1118419AA5A5A5541157A5",
      INIT_60 => X"65227CEDF5F9882022252626241919337E7D7B350E1118449AA5A5A5541558A5",
      INIT_61 => X"912253DEEEEA572122252626241815307E7C7C21141519449BA5A5A5541A5BA5",
      INIT_62 => X"E91716AFE9E1A51121252626241708507E7C5B091A1C1A4CA3A5A5A5521C5CA5",
      INIT_63 => X"EBB018A0E3D8B179300F16161606487C817A25151516195BA5A5A5A5501C5DA5",
      INIT_64 => X"E7E9C9D6DBD19A828D756C6073927665727E600315121767A5A5A5A54D175DA5",
      INIT_65 => X"E6E7E5E0DBD18E73868A8A88A0CBB87A697579181211196CA5A5A5A54A145DA5",
      INIT_66 => X"EBE9E6E0E1D68C6B8184848692C3E1BA7B626B091216196CA5A5A5A548125DA5",
      INIT_67 => X"DEEEEAE2E3D8916680817E888D9FC1DBC186630611151A6DA5A5A5A548155EA5",
      INIT_68 => X"60B4C7C6C9C6895B6F727681898688AFCCB17C0114121A6FA5A5A5A546165FA5",
      INIT_69 => X"22190F212D301E0D151517191F211E2131402C0D1412186EA5A5A5A53E145EA5",
      INIT_6A => X"2B2B2B292B2C2B29292B2C2C292026271C1718191A161D73A5A5A5A5401463A5",
      INIT_6B => X"6E6E6D6C6C6B6A6A6969696766646564605E5E5E5E5A6093A5A5A5A5794D85A5",
      INIT_6C => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A3A5A5A5A5",
      INIT_6D => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_6E => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_6F => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_70 => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_71 => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_72 => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_73 => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_74 => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_75 => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_76 => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_77 => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_78 => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_79 => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_7A => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_7B => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_7C => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_7D => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_7E => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_7F => X"A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      IS_CLKARDCLK_INVERTED => '0',
      IS_CLKBWRCLK_INVERTED => '0',
      IS_ENARDEN_INVERTED => '0',
      IS_ENBWREN_INVERTED => '0',
      IS_RSTRAMARSTRAM_INVERTED => '0',
      IS_RSTRAMB_INVERTED => '0',
      IS_RSTREGARSTREG_INVERTED => '0',
      IS_RSTREGB_INVERTED => '0',
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 9,
      READ_WIDTH_B => 9,
      RSTREG_PRIORITY_A => "REGCE",
      RSTREG_PRIORITY_B => "REGCE",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 9,
      WRITE_WIDTH_B => 9
    )
        port map (
      ADDRARDADDR(14 downto 3) => addra(11 downto 0),
      ADDRARDADDR(2 downto 0) => B"000",
      ADDRBWRADDR(14 downto 0) => B"000000000000000",
      ADDRENA => '0',
      ADDRENB => '0',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31 downto 0) => B"00000000000000000000000000000000",
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3 downto 0) => B"0000",
      CASDOMUXA => '0',
      CASDOMUXB => '0',
      CASDOMUXEN_A => '0',
      CASDOMUXEN_B => '0',
      CASDOUTA(31 downto 0) => \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31 downto 0) => \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASDOUTB_UNCONNECTED\(31 downto 0),
      CASDOUTPA(3 downto 0) => \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3 downto 0) => \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASDOUTPB_UNCONNECTED\(3 downto 0),
      CASINDBITERR => '0',
      CASINSBITERR => '0',
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '0',
      CASOREGIMUXEN_B => '0',
      CASOUTDBITERR => \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASOUTDBITERR_UNCONNECTED\,
      CASOUTSBITERR => \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASOUTSBITERR_UNCONNECTED\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 0) => B"00000000000000000000000000000000",
      DINBDIN(31 downto 0) => B"00000000000000000000000000000000",
      DINPADINP(3 downto 0) => B"0000",
      DINPBDINP(3 downto 0) => B"0000",
      DOUTADOUT(31 downto 8) => \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOUTADOUT_UNCONNECTED\(31 downto 8),
      DOUTADOUT(7 downto 0) => douta(7 downto 0),
      DOUTBDOUT(31 downto 0) => \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOUTBDOUT_UNCONNECTED\(31 downto 0),
      DOUTPADOUTP(3 downto 1) => \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOUTPADOUTP_UNCONNECTED\(3 downto 1),
      DOUTPADOUTP(0) => \DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_143\,
      DOUTPBDOUTP(3 downto 0) => \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '0',
      ENARDEN => '1',
      ENBWREN => '0',
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_DEVICE_8SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED\,
      SLEEP => sleep,
      WEA(3 downto 0) => B"0000",
      WEBWE(7 downto 0) => B"00000000"
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity data_in_ROM_blk_mem_gen_prim_width is
  port (
    douta : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clka : in STD_LOGIC;
    sleep : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of data_in_ROM_blk_mem_gen_prim_width : entity is "blk_mem_gen_prim_width";
end data_in_ROM_blk_mem_gen_prim_width;

architecture STRUCTURE of data_in_ROM_blk_mem_gen_prim_width is
begin
\prim_init.ram\: entity work.data_in_ROM_blk_mem_gen_prim_wrapper_init
     port map (
      addra(11 downto 0) => addra(11 downto 0),
      clka => clka,
      douta(7 downto 0) => douta(7 downto 0),
      sleep => sleep
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity data_in_ROM_blk_mem_gen_generic_cstr is
  port (
    douta : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clka : in STD_LOGIC;
    sleep : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of data_in_ROM_blk_mem_gen_generic_cstr : entity is "blk_mem_gen_generic_cstr";
end data_in_ROM_blk_mem_gen_generic_cstr;

architecture STRUCTURE of data_in_ROM_blk_mem_gen_generic_cstr is
begin
\ramloop[0].ram.r\: entity work.data_in_ROM_blk_mem_gen_prim_width
     port map (
      addra(11 downto 0) => addra(11 downto 0),
      clka => clka,
      douta(7 downto 0) => douta(7 downto 0),
      sleep => sleep
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity data_in_ROM_blk_mem_gen_top is
  port (
    douta : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clka : in STD_LOGIC;
    sleep : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of data_in_ROM_blk_mem_gen_top : entity is "blk_mem_gen_top";
end data_in_ROM_blk_mem_gen_top;

architecture STRUCTURE of data_in_ROM_blk_mem_gen_top is
begin
\valid.cstr\: entity work.data_in_ROM_blk_mem_gen_generic_cstr
     port map (
      addra(11 downto 0) => addra(11 downto 0),
      clka => clka,
      douta(7 downto 0) => douta(7 downto 0),
      sleep => sleep
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity data_in_ROM_blk_mem_gen_v8_4_1_synth is
  port (
    douta : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clka : in STD_LOGIC;
    sleep : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of data_in_ROM_blk_mem_gen_v8_4_1_synth : entity is "blk_mem_gen_v8_4_1_synth";
end data_in_ROM_blk_mem_gen_v8_4_1_synth;

architecture STRUCTURE of data_in_ROM_blk_mem_gen_v8_4_1_synth is
begin
\gnbram.gnativebmg.native_blk_mem_gen\: entity work.data_in_ROM_blk_mem_gen_top
     port map (
      addra(11 downto 0) => addra(11 downto 0),
      clka => clka,
      douta(7 downto 0) => douta(7 downto 0),
      sleep => sleep
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity data_in_ROM_blk_mem_gen_v8_4_1 is
  port (
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    regcea : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 7 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clkb : in STD_LOGIC;
    rstb : in STD_LOGIC;
    enb : in STD_LOGIC;
    regceb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 0 to 0 );
    addrb : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    injectsbiterr : in STD_LOGIC;
    injectdbiterr : in STD_LOGIC;
    eccpipece : in STD_LOGIC;
    sbiterr : out STD_LOGIC;
    dbiterr : out STD_LOGIC;
    rdaddrecc : out STD_LOGIC_VECTOR ( 11 downto 0 );
    sleep : in STD_LOGIC;
    deepsleep : in STD_LOGIC;
    shutdown : in STD_LOGIC;
    rsta_busy : out STD_LOGIC;
    rstb_busy : out STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_injectsbiterr : in STD_LOGIC;
    s_axi_injectdbiterr : in STD_LOGIC;
    s_axi_sbiterr : out STD_LOGIC;
    s_axi_dbiterr : out STD_LOGIC;
    s_axi_rdaddrecc : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute C_ADDRA_WIDTH : integer;
  attribute C_ADDRA_WIDTH of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 12;
  attribute C_ADDRB_WIDTH : integer;
  attribute C_ADDRB_WIDTH of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 12;
  attribute C_ALGORITHM : integer;
  attribute C_ALGORITHM of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 1;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 4;
  attribute C_AXI_SLAVE_TYPE : integer;
  attribute C_AXI_SLAVE_TYPE of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 1;
  attribute C_BYTE_SIZE : integer;
  attribute C_BYTE_SIZE of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 9;
  attribute C_COMMON_CLK : integer;
  attribute C_COMMON_CLK of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_COUNT_18K_BRAM : string;
  attribute C_COUNT_18K_BRAM of data_in_ROM_blk_mem_gen_v8_4_1 : entity is "0";
  attribute C_COUNT_36K_BRAM : string;
  attribute C_COUNT_36K_BRAM of data_in_ROM_blk_mem_gen_v8_4_1 : entity is "1";
  attribute C_CTRL_ECC_ALGO : string;
  attribute C_CTRL_ECC_ALGO of data_in_ROM_blk_mem_gen_v8_4_1 : entity is "NONE";
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of data_in_ROM_blk_mem_gen_v8_4_1 : entity is "0";
  attribute C_DISABLE_WARN_BHV_COLL : integer;
  attribute C_DISABLE_WARN_BHV_COLL of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_DISABLE_WARN_BHV_RANGE : integer;
  attribute C_DISABLE_WARN_BHV_RANGE of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of data_in_ROM_blk_mem_gen_v8_4_1 : entity is "./";
  attribute C_ENABLE_32BIT_ADDRESS : integer;
  attribute C_ENABLE_32BIT_ADDRESS of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_EN_DEEPSLEEP_PIN : integer;
  attribute C_EN_DEEPSLEEP_PIN of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_EN_ECC_PIPE : integer;
  attribute C_EN_ECC_PIPE of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_EN_RDADDRA_CHG : integer;
  attribute C_EN_RDADDRA_CHG of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_EN_RDADDRB_CHG : integer;
  attribute C_EN_RDADDRB_CHG of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_EN_SHUTDOWN_PIN : integer;
  attribute C_EN_SHUTDOWN_PIN of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_EN_SLEEP_PIN : integer;
  attribute C_EN_SLEEP_PIN of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_EST_POWER_SUMMARY : string;
  attribute C_EST_POWER_SUMMARY of data_in_ROM_blk_mem_gen_v8_4_1 : entity is "Estimated Power for IP     :     1.558875 mW";
  attribute C_FAMILY : string;
  attribute C_FAMILY of data_in_ROM_blk_mem_gen_v8_4_1 : entity is "virtexuplus";
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_HAS_ENA : integer;
  attribute C_HAS_ENA of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_HAS_ENB : integer;
  attribute C_HAS_ENB of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_HAS_INJECTERR : integer;
  attribute C_HAS_INJECTERR of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_HAS_MEM_OUTPUT_REGS_A : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_A of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 1;
  attribute C_HAS_MEM_OUTPUT_REGS_B : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_B of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_A : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_A of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_B : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_B of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_HAS_REGCEA : integer;
  attribute C_HAS_REGCEA of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_HAS_REGCEB : integer;
  attribute C_HAS_REGCEB of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_HAS_RSTA : integer;
  attribute C_HAS_RSTA of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_HAS_RSTB : integer;
  attribute C_HAS_RSTB of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_HAS_SOFTECC_INPUT_REGS_A : integer;
  attribute C_HAS_SOFTECC_INPUT_REGS_A of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B : integer;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_INITA_VAL : string;
  attribute C_INITA_VAL of data_in_ROM_blk_mem_gen_v8_4_1 : entity is "0";
  attribute C_INITB_VAL : string;
  attribute C_INITB_VAL of data_in_ROM_blk_mem_gen_v8_4_1 : entity is "0";
  attribute C_INIT_FILE : string;
  attribute C_INIT_FILE of data_in_ROM_blk_mem_gen_v8_4_1 : entity is "data_in_ROM.mem";
  attribute C_INIT_FILE_NAME : string;
  attribute C_INIT_FILE_NAME of data_in_ROM_blk_mem_gen_v8_4_1 : entity is "data_in_ROM.mif";
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_LOAD_INIT_FILE : integer;
  attribute C_LOAD_INIT_FILE of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 1;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 3;
  attribute C_MUX_PIPELINE_STAGES : integer;
  attribute C_MUX_PIPELINE_STAGES of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_PRIM_TYPE : integer;
  attribute C_PRIM_TYPE of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 1;
  attribute C_READ_DEPTH_A : integer;
  attribute C_READ_DEPTH_A of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 4096;
  attribute C_READ_DEPTH_B : integer;
  attribute C_READ_DEPTH_B of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 4096;
  attribute C_READ_WIDTH_A : integer;
  attribute C_READ_WIDTH_A of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 8;
  attribute C_READ_WIDTH_B : integer;
  attribute C_READ_WIDTH_B of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 8;
  attribute C_RSTRAM_A : integer;
  attribute C_RSTRAM_A of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_RSTRAM_B : integer;
  attribute C_RSTRAM_B of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_RST_PRIORITY_A : string;
  attribute C_RST_PRIORITY_A of data_in_ROM_blk_mem_gen_v8_4_1 : entity is "CE";
  attribute C_RST_PRIORITY_B : string;
  attribute C_RST_PRIORITY_B of data_in_ROM_blk_mem_gen_v8_4_1 : entity is "CE";
  attribute C_SIM_COLLISION_CHECK : string;
  attribute C_SIM_COLLISION_CHECK of data_in_ROM_blk_mem_gen_v8_4_1 : entity is "ALL";
  attribute C_USE_BRAM_BLOCK : integer;
  attribute C_USE_BRAM_BLOCK of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_USE_BYTE_WEA : integer;
  attribute C_USE_BYTE_WEA of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_USE_BYTE_WEB : integer;
  attribute C_USE_BYTE_WEB of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_USE_DEFAULT_DATA : integer;
  attribute C_USE_DEFAULT_DATA of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_USE_SOFTECC : integer;
  attribute C_USE_SOFTECC of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_USE_URAM : integer;
  attribute C_USE_URAM of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_WEA_WIDTH : integer;
  attribute C_WEA_WIDTH of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 1;
  attribute C_WEB_WIDTH : integer;
  attribute C_WEB_WIDTH of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 1;
  attribute C_WRITE_DEPTH_A : integer;
  attribute C_WRITE_DEPTH_A of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 4096;
  attribute C_WRITE_DEPTH_B : integer;
  attribute C_WRITE_DEPTH_B of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 4096;
  attribute C_WRITE_MODE_A : string;
  attribute C_WRITE_MODE_A of data_in_ROM_blk_mem_gen_v8_4_1 : entity is "WRITE_FIRST";
  attribute C_WRITE_MODE_B : string;
  attribute C_WRITE_MODE_B of data_in_ROM_blk_mem_gen_v8_4_1 : entity is "WRITE_FIRST";
  attribute C_WRITE_WIDTH_A : integer;
  attribute C_WRITE_WIDTH_A of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 8;
  attribute C_WRITE_WIDTH_B : integer;
  attribute C_WRITE_WIDTH_B of data_in_ROM_blk_mem_gen_v8_4_1 : entity is 8;
  attribute C_XDEVICEFAMILY : string;
  attribute C_XDEVICEFAMILY of data_in_ROM_blk_mem_gen_v8_4_1 : entity is "virtexuplus";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of data_in_ROM_blk_mem_gen_v8_4_1 : entity is "blk_mem_gen_v8_4_1";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of data_in_ROM_blk_mem_gen_v8_4_1 : entity is "yes";
end data_in_ROM_blk_mem_gen_v8_4_1;

architecture STRUCTURE of data_in_ROM_blk_mem_gen_v8_4_1 is
  signal \<const0>\ : STD_LOGIC;
begin
  dbiterr <= \<const0>\;
  doutb(7) <= \<const0>\;
  doutb(6) <= \<const0>\;
  doutb(5) <= \<const0>\;
  doutb(4) <= \<const0>\;
  doutb(3) <= \<const0>\;
  doutb(2) <= \<const0>\;
  doutb(1) <= \<const0>\;
  doutb(0) <= \<const0>\;
  rdaddrecc(11) <= \<const0>\;
  rdaddrecc(10) <= \<const0>\;
  rdaddrecc(9) <= \<const0>\;
  rdaddrecc(8) <= \<const0>\;
  rdaddrecc(7) <= \<const0>\;
  rdaddrecc(6) <= \<const0>\;
  rdaddrecc(5) <= \<const0>\;
  rdaddrecc(4) <= \<const0>\;
  rdaddrecc(3) <= \<const0>\;
  rdaddrecc(2) <= \<const0>\;
  rdaddrecc(1) <= \<const0>\;
  rdaddrecc(0) <= \<const0>\;
  rsta_busy <= \<const0>\;
  rstb_busy <= \<const0>\;
  s_axi_arready <= \<const0>\;
  s_axi_awready <= \<const0>\;
  s_axi_bid(3) <= \<const0>\;
  s_axi_bid(2) <= \<const0>\;
  s_axi_bid(1) <= \<const0>\;
  s_axi_bid(0) <= \<const0>\;
  s_axi_bresp(1) <= \<const0>\;
  s_axi_bresp(0) <= \<const0>\;
  s_axi_bvalid <= \<const0>\;
  s_axi_dbiterr <= \<const0>\;
  s_axi_rdaddrecc(11) <= \<const0>\;
  s_axi_rdaddrecc(10) <= \<const0>\;
  s_axi_rdaddrecc(9) <= \<const0>\;
  s_axi_rdaddrecc(8) <= \<const0>\;
  s_axi_rdaddrecc(7) <= \<const0>\;
  s_axi_rdaddrecc(6) <= \<const0>\;
  s_axi_rdaddrecc(5) <= \<const0>\;
  s_axi_rdaddrecc(4) <= \<const0>\;
  s_axi_rdaddrecc(3) <= \<const0>\;
  s_axi_rdaddrecc(2) <= \<const0>\;
  s_axi_rdaddrecc(1) <= \<const0>\;
  s_axi_rdaddrecc(0) <= \<const0>\;
  s_axi_rdata(7) <= \<const0>\;
  s_axi_rdata(6) <= \<const0>\;
  s_axi_rdata(5) <= \<const0>\;
  s_axi_rdata(4) <= \<const0>\;
  s_axi_rdata(3) <= \<const0>\;
  s_axi_rdata(2) <= \<const0>\;
  s_axi_rdata(1) <= \<const0>\;
  s_axi_rdata(0) <= \<const0>\;
  s_axi_rid(3) <= \<const0>\;
  s_axi_rid(2) <= \<const0>\;
  s_axi_rid(1) <= \<const0>\;
  s_axi_rid(0) <= \<const0>\;
  s_axi_rlast <= \<const0>\;
  s_axi_rresp(1) <= \<const0>\;
  s_axi_rresp(0) <= \<const0>\;
  s_axi_rvalid <= \<const0>\;
  s_axi_sbiterr <= \<const0>\;
  s_axi_wready <= \<const0>\;
  sbiterr <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst_blk_mem_gen: entity work.data_in_ROM_blk_mem_gen_v8_4_1_synth
     port map (
      addra(11 downto 0) => addra(11 downto 0),
      clka => clka,
      douta(7 downto 0) => douta(7 downto 0),
      sleep => sleep
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity data_in_ROM is
  port (
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of data_in_ROM : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of data_in_ROM : entity is "data_in_ROM,blk_mem_gen_v8_4_1,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of data_in_ROM : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of data_in_ROM : entity is "blk_mem_gen_v8_4_1,Vivado 2018.2";
end data_in_ROM;

architecture STRUCTURE of data_in_ROM is
  signal NLW_U0_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_rsta_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_rstb_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_doutb_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_rdaddrecc_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_U0_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_rdaddrecc_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_U0_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute C_ADDRA_WIDTH : integer;
  attribute C_ADDRA_WIDTH of U0 : label is 12;
  attribute C_ADDRB_WIDTH : integer;
  attribute C_ADDRB_WIDTH of U0 : label is 12;
  attribute C_ALGORITHM : integer;
  attribute C_ALGORITHM of U0 : label is 1;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of U0 : label is 4;
  attribute C_AXI_SLAVE_TYPE : integer;
  attribute C_AXI_SLAVE_TYPE of U0 : label is 0;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of U0 : label is 1;
  attribute C_BYTE_SIZE : integer;
  attribute C_BYTE_SIZE of U0 : label is 9;
  attribute C_COMMON_CLK : integer;
  attribute C_COMMON_CLK of U0 : label is 0;
  attribute C_COUNT_18K_BRAM : string;
  attribute C_COUNT_18K_BRAM of U0 : label is "0";
  attribute C_COUNT_36K_BRAM : string;
  attribute C_COUNT_36K_BRAM of U0 : label is "1";
  attribute C_CTRL_ECC_ALGO : string;
  attribute C_CTRL_ECC_ALGO of U0 : label is "NONE";
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of U0 : label is "0";
  attribute C_DISABLE_WARN_BHV_COLL : integer;
  attribute C_DISABLE_WARN_BHV_COLL of U0 : label is 0;
  attribute C_DISABLE_WARN_BHV_RANGE : integer;
  attribute C_DISABLE_WARN_BHV_RANGE of U0 : label is 0;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of U0 : label is "./";
  attribute C_ENABLE_32BIT_ADDRESS : integer;
  attribute C_ENABLE_32BIT_ADDRESS of U0 : label is 0;
  attribute C_EN_DEEPSLEEP_PIN : integer;
  attribute C_EN_DEEPSLEEP_PIN of U0 : label is 0;
  attribute C_EN_ECC_PIPE : integer;
  attribute C_EN_ECC_PIPE of U0 : label is 0;
  attribute C_EN_RDADDRA_CHG : integer;
  attribute C_EN_RDADDRA_CHG of U0 : label is 0;
  attribute C_EN_RDADDRB_CHG : integer;
  attribute C_EN_RDADDRB_CHG of U0 : label is 0;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of U0 : label is 0;
  attribute C_EN_SHUTDOWN_PIN : integer;
  attribute C_EN_SHUTDOWN_PIN of U0 : label is 0;
  attribute C_EN_SLEEP_PIN : integer;
  attribute C_EN_SLEEP_PIN of U0 : label is 0;
  attribute C_EST_POWER_SUMMARY : string;
  attribute C_EST_POWER_SUMMARY of U0 : label is "Estimated Power for IP     :     1.558875 mW";
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "virtexuplus";
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of U0 : label is 0;
  attribute C_HAS_ENA : integer;
  attribute C_HAS_ENA of U0 : label is 0;
  attribute C_HAS_ENB : integer;
  attribute C_HAS_ENB of U0 : label is 0;
  attribute C_HAS_INJECTERR : integer;
  attribute C_HAS_INJECTERR of U0 : label is 0;
  attribute C_HAS_MEM_OUTPUT_REGS_A : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_A of U0 : label is 1;
  attribute C_HAS_MEM_OUTPUT_REGS_B : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_B of U0 : label is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_A : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_A of U0 : label is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_B : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_B of U0 : label is 0;
  attribute C_HAS_REGCEA : integer;
  attribute C_HAS_REGCEA of U0 : label is 0;
  attribute C_HAS_REGCEB : integer;
  attribute C_HAS_REGCEB of U0 : label is 0;
  attribute C_HAS_RSTA : integer;
  attribute C_HAS_RSTA of U0 : label is 0;
  attribute C_HAS_RSTB : integer;
  attribute C_HAS_RSTB of U0 : label is 0;
  attribute C_HAS_SOFTECC_INPUT_REGS_A : integer;
  attribute C_HAS_SOFTECC_INPUT_REGS_A of U0 : label is 0;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B : integer;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B of U0 : label is 0;
  attribute C_INITA_VAL : string;
  attribute C_INITA_VAL of U0 : label is "0";
  attribute C_INITB_VAL : string;
  attribute C_INITB_VAL of U0 : label is "0";
  attribute C_INIT_FILE : string;
  attribute C_INIT_FILE of U0 : label is "data_in_ROM.mem";
  attribute C_INIT_FILE_NAME : string;
  attribute C_INIT_FILE_NAME of U0 : label is "data_in_ROM.mif";
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of U0 : label is 0;
  attribute C_LOAD_INIT_FILE : integer;
  attribute C_LOAD_INIT_FILE of U0 : label is 1;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of U0 : label is 3;
  attribute C_MUX_PIPELINE_STAGES : integer;
  attribute C_MUX_PIPELINE_STAGES of U0 : label is 0;
  attribute C_PRIM_TYPE : integer;
  attribute C_PRIM_TYPE of U0 : label is 1;
  attribute C_READ_DEPTH_A : integer;
  attribute C_READ_DEPTH_A of U0 : label is 4096;
  attribute C_READ_DEPTH_B : integer;
  attribute C_READ_DEPTH_B of U0 : label is 4096;
  attribute C_READ_WIDTH_A : integer;
  attribute C_READ_WIDTH_A of U0 : label is 8;
  attribute C_READ_WIDTH_B : integer;
  attribute C_READ_WIDTH_B of U0 : label is 8;
  attribute C_RSTRAM_A : integer;
  attribute C_RSTRAM_A of U0 : label is 0;
  attribute C_RSTRAM_B : integer;
  attribute C_RSTRAM_B of U0 : label is 0;
  attribute C_RST_PRIORITY_A : string;
  attribute C_RST_PRIORITY_A of U0 : label is "CE";
  attribute C_RST_PRIORITY_B : string;
  attribute C_RST_PRIORITY_B of U0 : label is "CE";
  attribute C_SIM_COLLISION_CHECK : string;
  attribute C_SIM_COLLISION_CHECK of U0 : label is "ALL";
  attribute C_USE_BRAM_BLOCK : integer;
  attribute C_USE_BRAM_BLOCK of U0 : label is 0;
  attribute C_USE_BYTE_WEA : integer;
  attribute C_USE_BYTE_WEA of U0 : label is 0;
  attribute C_USE_BYTE_WEB : integer;
  attribute C_USE_BYTE_WEB of U0 : label is 0;
  attribute C_USE_DEFAULT_DATA : integer;
  attribute C_USE_DEFAULT_DATA of U0 : label is 0;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of U0 : label is 0;
  attribute C_USE_SOFTECC : integer;
  attribute C_USE_SOFTECC of U0 : label is 0;
  attribute C_USE_URAM : integer;
  attribute C_USE_URAM of U0 : label is 0;
  attribute C_WEA_WIDTH : integer;
  attribute C_WEA_WIDTH of U0 : label is 1;
  attribute C_WEB_WIDTH : integer;
  attribute C_WEB_WIDTH of U0 : label is 1;
  attribute C_WRITE_DEPTH_A : integer;
  attribute C_WRITE_DEPTH_A of U0 : label is 4096;
  attribute C_WRITE_DEPTH_B : integer;
  attribute C_WRITE_DEPTH_B of U0 : label is 4096;
  attribute C_WRITE_MODE_A : string;
  attribute C_WRITE_MODE_A of U0 : label is "WRITE_FIRST";
  attribute C_WRITE_MODE_B : string;
  attribute C_WRITE_MODE_B of U0 : label is "WRITE_FIRST";
  attribute C_WRITE_WIDTH_A : integer;
  attribute C_WRITE_WIDTH_A of U0 : label is 8;
  attribute C_WRITE_WIDTH_B : integer;
  attribute C_WRITE_WIDTH_B of U0 : label is 8;
  attribute C_XDEVICEFAMILY : string;
  attribute C_XDEVICEFAMILY of U0 : label is "virtexuplus";
  attribute downgradeipidentifiedwarnings of U0 : label is "yes";
  attribute x_interface_info : string;
  attribute x_interface_info of clka : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clka : signal is "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  attribute x_interface_info of addra : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR";
  attribute x_interface_info of douta : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT";
begin
U0: entity work.data_in_ROM_blk_mem_gen_v8_4_1
     port map (
      addra(11 downto 0) => addra(11 downto 0),
      addrb(11 downto 0) => B"000000000000",
      clka => clka,
      clkb => '0',
      dbiterr => NLW_U0_dbiterr_UNCONNECTED,
      deepsleep => '0',
      dina(7 downto 0) => B"00000000",
      dinb(7 downto 0) => B"00000000",
      douta(7 downto 0) => douta(7 downto 0),
      doutb(7 downto 0) => NLW_U0_doutb_UNCONNECTED(7 downto 0),
      eccpipece => '0',
      ena => '0',
      enb => '0',
      injectdbiterr => '0',
      injectsbiterr => '0',
      rdaddrecc(11 downto 0) => NLW_U0_rdaddrecc_UNCONNECTED(11 downto 0),
      regcea => '0',
      regceb => '0',
      rsta => '0',
      rsta_busy => NLW_U0_rsta_busy_UNCONNECTED,
      rstb => '0',
      rstb_busy => NLW_U0_rstb_busy_UNCONNECTED,
      s_aclk => '0',
      s_aresetn => '0',
      s_axi_araddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_arburst(1 downto 0) => B"00",
      s_axi_arid(3 downto 0) => B"0000",
      s_axi_arlen(7 downto 0) => B"00000000",
      s_axi_arready => NLW_U0_s_axi_arready_UNCONNECTED,
      s_axi_arsize(2 downto 0) => B"000",
      s_axi_arvalid => '0',
      s_axi_awaddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_awburst(1 downto 0) => B"00",
      s_axi_awid(3 downto 0) => B"0000",
      s_axi_awlen(7 downto 0) => B"00000000",
      s_axi_awready => NLW_U0_s_axi_awready_UNCONNECTED,
      s_axi_awsize(2 downto 0) => B"000",
      s_axi_awvalid => '0',
      s_axi_bid(3 downto 0) => NLW_U0_s_axi_bid_UNCONNECTED(3 downto 0),
      s_axi_bready => '0',
      s_axi_bresp(1 downto 0) => NLW_U0_s_axi_bresp_UNCONNECTED(1 downto 0),
      s_axi_bvalid => NLW_U0_s_axi_bvalid_UNCONNECTED,
      s_axi_dbiterr => NLW_U0_s_axi_dbiterr_UNCONNECTED,
      s_axi_injectdbiterr => '0',
      s_axi_injectsbiterr => '0',
      s_axi_rdaddrecc(11 downto 0) => NLW_U0_s_axi_rdaddrecc_UNCONNECTED(11 downto 0),
      s_axi_rdata(7 downto 0) => NLW_U0_s_axi_rdata_UNCONNECTED(7 downto 0),
      s_axi_rid(3 downto 0) => NLW_U0_s_axi_rid_UNCONNECTED(3 downto 0),
      s_axi_rlast => NLW_U0_s_axi_rlast_UNCONNECTED,
      s_axi_rready => '0',
      s_axi_rresp(1 downto 0) => NLW_U0_s_axi_rresp_UNCONNECTED(1 downto 0),
      s_axi_rvalid => NLW_U0_s_axi_rvalid_UNCONNECTED,
      s_axi_sbiterr => NLW_U0_s_axi_sbiterr_UNCONNECTED,
      s_axi_wdata(7 downto 0) => B"00000000",
      s_axi_wlast => '0',
      s_axi_wready => NLW_U0_s_axi_wready_UNCONNECTED,
      s_axi_wstrb(0) => '0',
      s_axi_wvalid => '0',
      sbiterr => NLW_U0_sbiterr_UNCONNECTED,
      shutdown => '0',
      sleep => '0',
      wea(0) => '0',
      web(0) => '0'
    );
end STRUCTURE;
