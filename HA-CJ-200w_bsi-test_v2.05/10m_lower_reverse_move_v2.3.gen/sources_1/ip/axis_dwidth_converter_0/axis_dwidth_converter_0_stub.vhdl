-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
-- Date        : Thu Aug 29 15:34:04 2024
-- Host        : LAPTOP-AT92CJ0U running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               e:/work/vivado_prj/690t200w/HA-CJ-200w-test_v2.00/10m_lower_reverse_move_v2.3.gen/sources_1/ip/axis_dwidth_converter_0/axis_dwidth_converter_0_stub.vhdl
-- Design      : axis_dwidth_converter_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx690tffg1157-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity axis_dwidth_converter_0 is
  Port ( 
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 2559 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 )
  );

end axis_dwidth_converter_0;

architecture stub of axis_dwidth_converter_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "aclk,aresetn,s_axis_tvalid,s_axis_tready,s_axis_tdata[2559:0],m_axis_tvalid,m_axis_tready,m_axis_tdata[255:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "axis_dwidth_converter_v1_1_24_axis_dwidth_converter,Vivado 2021.2";
begin
end;
