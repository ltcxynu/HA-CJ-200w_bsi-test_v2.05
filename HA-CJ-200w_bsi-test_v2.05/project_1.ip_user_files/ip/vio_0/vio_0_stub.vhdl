-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
-- Date        : Thu Aug 29 09:32:47 2024
-- Host        : LAPTOP-AT92CJ0U running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               e:/work/vivado_prj/690t200w/HA-CJ-200w-test_v2.00/project_1.gen/sources_1/ip/vio_0/vio_0_stub.vhdl
-- Design      : vio_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx690tffg1157-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vio_0 is
  Port ( 
    clk : in STD_LOGIC;
    probe_out0 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    probe_out1 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    probe_out2 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    probe_out3 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    probe_out4 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    probe_out5 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    probe_out6 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    probe_out7 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    probe_out8 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    probe_out9 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    probe_out10 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    probe_out11 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    probe_out12 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    probe_out13 : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );

end vio_0;

architecture stub of vio_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe_out0[4:0],probe_out1[4:0],probe_out2[4:0],probe_out3[4:0],probe_out4[4:0],probe_out5[4:0],probe_out6[4:0],probe_out7[4:0],probe_out8[4:0],probe_out9[4:0],probe_out10[4:0],probe_out11[4:0],probe_out12[4:0],probe_out13[4:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "vio,Vivado 2021.2";
begin
end;
