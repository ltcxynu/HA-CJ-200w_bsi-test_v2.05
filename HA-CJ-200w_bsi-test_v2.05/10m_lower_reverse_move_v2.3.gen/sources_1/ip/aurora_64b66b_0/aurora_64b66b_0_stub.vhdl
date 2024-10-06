-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
-- Date        : Thu Aug 29 15:34:15 2024
-- Host        : LAPTOP-AT92CJ0U running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               e:/work/vivado_prj/690t200w/HA-CJ-200w-test_v2.00/10m_lower_reverse_move_v2.3.gen/sources_1/ip/aurora_64b66b_0/aurora_64b66b_0_stub.vhdl
-- Design      : aurora_64b66b_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx690tffg1157-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity aurora_64b66b_0 is
  Port ( 
    s_axi_tx_tdata : in STD_LOGIC_VECTOR ( 0 to 255 );
    s_axi_tx_tvalid : in STD_LOGIC;
    s_axi_tx_tready : out STD_LOGIC;
    m_axi_rx_tdata : out STD_LOGIC_VECTOR ( 0 to 255 );
    m_axi_rx_tvalid : out STD_LOGIC;
    rxp : in STD_LOGIC_VECTOR ( 0 to 3 );
    rxn : in STD_LOGIC_VECTOR ( 0 to 3 );
    txp : out STD_LOGIC_VECTOR ( 0 to 3 );
    txn : out STD_LOGIC_VECTOR ( 0 to 3 );
    refclk1_in : in STD_LOGIC;
    hard_err : out STD_LOGIC;
    soft_err : out STD_LOGIC;
    channel_up : out STD_LOGIC;
    lane_up : out STD_LOGIC_VECTOR ( 0 to 3 );
    mmcm_not_locked : in STD_LOGIC;
    user_clk : in STD_LOGIC;
    sync_clk : in STD_LOGIC;
    reset_pb : in STD_LOGIC;
    gt_rxcdrovrden_in : in STD_LOGIC;
    power_down : in STD_LOGIC;
    loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    pma_init : in STD_LOGIC;
    gt_pll_lock : out STD_LOGIC;
    drp_clk_in : in STD_LOGIC;
    gt_qpllclk_quad5_in : in STD_LOGIC;
    gt_qpllrefclk_quad5_in : in STD_LOGIC;
    gt_to_common_qpllreset_out : out STD_LOGIC;
    gt_qpllrefclklost_in : in STD_LOGIC;
    gt_qplllock_in : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_awaddr_lane1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awvalid_lane1 : in STD_LOGIC;
    s_axi_awready_lane1 : out STD_LOGIC;
    s_axi_awaddr_lane2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awvalid_lane2 : in STD_LOGIC;
    s_axi_awready_lane2 : out STD_LOGIC;
    s_axi_awaddr_lane3 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awvalid_lane3 : in STD_LOGIC;
    s_axi_awready_lane3 : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bready : in STD_LOGIC;
    s_axi_wdata_lane1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb_lane1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid_lane1 : in STD_LOGIC;
    s_axi_wready_lane1 : out STD_LOGIC;
    s_axi_bvalid_lane1 : out STD_LOGIC;
    s_axi_bresp_lane1 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bready_lane1 : in STD_LOGIC;
    s_axi_wdata_lane2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb_lane2 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid_lane2 : in STD_LOGIC;
    s_axi_wready_lane2 : out STD_LOGIC;
    s_axi_bvalid_lane2 : out STD_LOGIC;
    s_axi_bresp_lane2 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bready_lane2 : in STD_LOGIC;
    s_axi_wdata_lane3 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb_lane3 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid_lane3 : in STD_LOGIC;
    s_axi_wready_lane3 : out STD_LOGIC;
    s_axi_bvalid_lane3 : out STD_LOGIC;
    s_axi_bresp_lane3 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bready_lane3 : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_araddr_lane1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arvalid_lane1 : in STD_LOGIC;
    s_axi_arready_lane1 : out STD_LOGIC;
    s_axi_araddr_lane2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arvalid_lane2 : in STD_LOGIC;
    s_axi_arready_lane2 : out STD_LOGIC;
    s_axi_araddr_lane3 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arvalid_lane3 : in STD_LOGIC;
    s_axi_arready_lane3 : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rready : in STD_LOGIC;
    s_axi_rdata_lane1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rvalid_lane1 : out STD_LOGIC;
    s_axi_rresp_lane1 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rready_lane1 : in STD_LOGIC;
    s_axi_rdata_lane2 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rvalid_lane2 : out STD_LOGIC;
    s_axi_rresp_lane2 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rready_lane2 : in STD_LOGIC;
    s_axi_rdata_lane3 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rvalid_lane3 : out STD_LOGIC;
    s_axi_rresp_lane3 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rready_lane3 : in STD_LOGIC;
    qpll_drpaddr_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    qpll_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    qpll_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    qpll_drprdy_out : out STD_LOGIC;
    qpll_drpen_in : in STD_LOGIC;
    qpll_drpwe_in : in STD_LOGIC;
    init_clk : in STD_LOGIC;
    link_reset_out : out STD_LOGIC;
    sys_reset_out : out STD_LOGIC;
    tx_out_clk : out STD_LOGIC
  );

end aurora_64b66b_0;

architecture stub of aurora_64b66b_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_tx_tdata[0:255],s_axi_tx_tvalid,s_axi_tx_tready,m_axi_rx_tdata[0:255],m_axi_rx_tvalid,rxp[0:3],rxn[0:3],txp[0:3],txn[0:3],refclk1_in,hard_err,soft_err,channel_up,lane_up[0:3],mmcm_not_locked,user_clk,sync_clk,reset_pb,gt_rxcdrovrden_in,power_down,loopback[2:0],pma_init,gt_pll_lock,drp_clk_in,gt_qpllclk_quad5_in,gt_qpllrefclk_quad5_in,gt_to_common_qpllreset_out,gt_qpllrefclklost_in,gt_qplllock_in,s_axi_awaddr[31:0],s_axi_awvalid,s_axi_awready,s_axi_awaddr_lane1[31:0],s_axi_awvalid_lane1,s_axi_awready_lane1,s_axi_awaddr_lane2[31:0],s_axi_awvalid_lane2,s_axi_awready_lane2,s_axi_awaddr_lane3[31:0],s_axi_awvalid_lane3,s_axi_awready_lane3,s_axi_wdata[31:0],s_axi_wstrb[3:0],s_axi_wvalid,s_axi_wready,s_axi_bvalid,s_axi_bresp[1:0],s_axi_bready,s_axi_wdata_lane1[31:0],s_axi_wstrb_lane1[3:0],s_axi_wvalid_lane1,s_axi_wready_lane1,s_axi_bvalid_lane1,s_axi_bresp_lane1[1:0],s_axi_bready_lane1,s_axi_wdata_lane2[31:0],s_axi_wstrb_lane2[3:0],s_axi_wvalid_lane2,s_axi_wready_lane2,s_axi_bvalid_lane2,s_axi_bresp_lane2[1:0],s_axi_bready_lane2,s_axi_wdata_lane3[31:0],s_axi_wstrb_lane3[3:0],s_axi_wvalid_lane3,s_axi_wready_lane3,s_axi_bvalid_lane3,s_axi_bresp_lane3[1:0],s_axi_bready_lane3,s_axi_araddr[31:0],s_axi_arvalid,s_axi_arready,s_axi_araddr_lane1[31:0],s_axi_arvalid_lane1,s_axi_arready_lane1,s_axi_araddr_lane2[31:0],s_axi_arvalid_lane2,s_axi_arready_lane2,s_axi_araddr_lane3[31:0],s_axi_arvalid_lane3,s_axi_arready_lane3,s_axi_rdata[31:0],s_axi_rvalid,s_axi_rresp[1:0],s_axi_rready,s_axi_rdata_lane1[31:0],s_axi_rvalid_lane1,s_axi_rresp_lane1[1:0],s_axi_rready_lane1,s_axi_rdata_lane2[31:0],s_axi_rvalid_lane2,s_axi_rresp_lane2[1:0],s_axi_rready_lane2,s_axi_rdata_lane3[31:0],s_axi_rvalid_lane3,s_axi_rresp_lane3[1:0],s_axi_rready_lane3,qpll_drpaddr_in[7:0],qpll_drpdi_in[15:0],qpll_drpdo_out[15:0],qpll_drprdy_out,qpll_drpen_in,qpll_drpwe_in,init_clk,link_reset_out,sys_reset_out,tx_out_clk";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "aurora_64b66b_v12_0_8, Coregen v14.3_ip3, Number of lanes = 4, Line rate is double10.0Gbps, Reference Clock is double125.0MHz, Interface is Streaming, Flow Control is None and is operating in DUPLEX configuration";
begin
end;
