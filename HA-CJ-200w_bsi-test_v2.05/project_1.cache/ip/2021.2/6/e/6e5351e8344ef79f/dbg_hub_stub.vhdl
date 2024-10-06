-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
-- Date        : Wed Sep 11 10:14:00 2024
-- Host        : LAPTOP-AT92CJ0U running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ dbg_hub_stub.vhdl
-- Design      : dbg_hub
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx690tffg1157-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    sl_iport0_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport1_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport2_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport3_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport4_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport5_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport6_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport7_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport8_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport9_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport10_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport11_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport12_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport13_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport14_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport15_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport16_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport17_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport18_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport19_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport20_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport21_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport22_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport23_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport24_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport25_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport26_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport27_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport28_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport29_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport30_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport31_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_iport32_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_oport0_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport1_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport2_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport3_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport4_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport5_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport6_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport7_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport8_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport9_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport10_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport11_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport12_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport13_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport14_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport15_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport16_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport17_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport18_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport19_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport20_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport21_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport22_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport23_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport24_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport25_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport26_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport27_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport28_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport29_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport30_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport31_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    sl_oport32_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    clk : in STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "sl_iport0_o[36:0],sl_iport1_o[36:0],sl_iport2_o[36:0],sl_iport3_o[36:0],sl_iport4_o[36:0],sl_iport5_o[36:0],sl_iport6_o[36:0],sl_iport7_o[36:0],sl_iport8_o[36:0],sl_iport9_o[36:0],sl_iport10_o[36:0],sl_iport11_o[36:0],sl_iport12_o[36:0],sl_iport13_o[36:0],sl_iport14_o[36:0],sl_iport15_o[36:0],sl_iport16_o[36:0],sl_iport17_o[36:0],sl_iport18_o[36:0],sl_iport19_o[36:0],sl_iport20_o[36:0],sl_iport21_o[36:0],sl_iport22_o[36:0],sl_iport23_o[36:0],sl_iport24_o[36:0],sl_iport25_o[36:0],sl_iport26_o[36:0],sl_iport27_o[36:0],sl_iport28_o[36:0],sl_iport29_o[36:0],sl_iport30_o[36:0],sl_iport31_o[36:0],sl_iport32_o[36:0],sl_oport0_i[16:0],sl_oport1_i[16:0],sl_oport2_i[16:0],sl_oport3_i[16:0],sl_oport4_i[16:0],sl_oport5_i[16:0],sl_oport6_i[16:0],sl_oport7_i[16:0],sl_oport8_i[16:0],sl_oport9_i[16:0],sl_oport10_i[16:0],sl_oport11_i[16:0],sl_oport12_i[16:0],sl_oport13_i[16:0],sl_oport14_i[16:0],sl_oport15_i[16:0],sl_oport16_i[16:0],sl_oport17_i[16:0],sl_oport18_i[16:0],sl_oport19_i[16:0],sl_oport20_i[16:0],sl_oport21_i[16:0],sl_oport22_i[16:0],sl_oport23_i[16:0],sl_oport24_i[16:0],sl_oport25_i[16:0],sl_oport26_i[16:0],sl_oport27_i[16:0],sl_oport28_i[16:0],sl_oport29_i[16:0],sl_oport30_i[16:0],sl_oport31_i[16:0],sl_oport32_i[16:0],clk";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "xsdbm_v3_0_0_xsdbm,Vivado 2021.2";
begin
end;
