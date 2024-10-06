
#####################################################################
create_clock -period 8.333 [get_ports clk_p1]
create_clock -period 8.333 [get_ports clk_p2]
create_clock -period 8.333 [get_ports clk_p3]
create_clock -period 8.333 [get_ports clk_p4]
create_clock -period 8.333 [get_ports clk_p5]
create_clock -period 8.333 [get_ports clk_p6]
create_clock -period 8.333 [get_ports clk_p7]
create_clock -period 8.333 [get_ports clk_p8]
create_clock -period 8.333 [get_ports clk_p9]
create_clock -period 8.333 [get_ports clk_p10]
create_clock -period 8.333 [get_ports clk_p11]
create_clock -period 8.333 [get_ports clk_p12]
create_clock -period 8.333 [get_ports clk_p13]
create_clock -period 8.333 [get_ports clk_p14]



##########################################################################
set_property PACKAGE_PIN AL29 [get_ports clk]
set_property PACKAGE_PIN AF34 [get_ports led]

set_property IOSTANDARD LVCMOS18 [get_ports clk]
set_property IOSTANDARD LVCMOS18 [get_ports led]

##########################################################################
#paru pda
set_property PACKAGE_PIN G30 [get_ports clk_p1]
set_property PACKAGE_PIN H29 [get_ports clk_p2]
set_property PACKAGE_PIN C27 [get_ports clk_p3]
set_property PACKAGE_PIN E21 [get_ports clk_p4]
set_property PACKAGE_PIN G16 [get_ports clk_p5]
set_property PACKAGE_PIN G15 [get_ports clk_p6]
set_property PACKAGE_PIN G11 [get_ports clk_p7]

set_property PACKAGE_PIN P29 [get_ports clk_p8]
set_property PACKAGE_PIN R28 [get_ports clk_p9]
set_property PACKAGE_PIN W30 [get_ports clk_p10]
set_property PACKAGE_PIN AJ22 [get_ports clk_p11]
set_property PACKAGE_PIN AJ16 [get_ports clk_p12]
set_property PACKAGE_PIN AH15 [get_ports clk_p13]
set_property PACKAGE_PIN AJ11 [get_ports clk_p14]


##########################################################################

set_property PACKAGE_PIN K34 [get_ports {lvds_p1[0]}]
set_property PACKAGE_PIN H33 [get_ports {lvds_p1[1]}]
set_property PACKAGE_PIN L33 [get_ports {lvds_p1[2]}]
set_property PACKAGE_PIN F30 [get_ports {lvds_p1[3]}]
set_property PACKAGE_PIN K32 [get_ports {lvds_p1[4]}]
set_property PACKAGE_PIN G33 [get_ports {lvds_p1[5]}]
set_property PACKAGE_PIN L29 [get_ports {lvds_p1[6]}]
set_property PACKAGE_PIN L30 [get_ports {lvds_p1[7]}]
set_property PACKAGE_PIN K28 [get_ports {lvds_p1[8]}]
set_property PACKAGE_PIN M27 [get_ports {lvds_p1[9]}]
set_property PACKAGE_PIN J27 [get_ports {lvds_p1[10]}]
set_property PACKAGE_PIN F33 [get_ports {lvds_p1[11]}]
set_property PACKAGE_PIN H32 [get_ports {lvds_p1[12]}]

##########################################################################
#PALU PDA

set_property PACKAGE_PIN K26 [get_ports {lvds_p2[0]}]
set_property PACKAGE_PIN E32 [get_ports {lvds_p2[1]}]
set_property PACKAGE_PIN G28 [get_ports {lvds_p2[2]}]
set_property PACKAGE_PIN K31 [get_ports {lvds_p2[3]}]
set_property PACKAGE_PIN M26 [get_ports {lvds_p2[4]}]
set_property PACKAGE_PIN J30 [get_ports {lvds_p2[5]}]
set_property PACKAGE_PIN D29 [get_ports {lvds_p2[6]}]
set_property PACKAGE_PIN B33 [get_ports {lvds_p2[7]}]
set_property PACKAGE_PIN E28 [get_ports {lvds_p2[8]}]
set_property PACKAGE_PIN B31 [get_ports {lvds_p2[9]}]
set_property PACKAGE_PIN E26 [get_ports {lvds_p2[10]}]
set_property PACKAGE_PIN D34 [get_ports {lvds_p2[11]}]
set_property PACKAGE_PIN C33 [get_ports {lvds_p2[12]}]


##########################################################################
#PAR




set_property PACKAGE_PIN C25 [get_ports {lvds_p3[0]}]
set_property PACKAGE_PIN C30 [get_ports {lvds_p3[1]}]
set_property PACKAGE_PIN G26 [get_ports {lvds_p3[2]}]
set_property PACKAGE_PIN A30 [get_ports {lvds_p3[3]}]
set_property PACKAGE_PIN G25 [get_ports {lvds_p3[4]}]
set_property PACKAGE_PIN D32 [get_ports {lvds_p3[5]}]
set_property PACKAGE_PIN A25 [get_ports {lvds_p3[6]}]
set_property PACKAGE_PIN A28 [get_ports {lvds_p3[7]}]
set_property PACKAGE_PIN J24 [get_ports {lvds_p3[8]}]
set_property PACKAGE_PIN B26 [get_ports {lvds_p3[9]}]
set_property PACKAGE_PIN J25 [get_ports {lvds_p3[10]}]
set_property PACKAGE_PIN C28 [get_ports {lvds_p3[11]}]
set_property PACKAGE_PIN E31 [get_ports {lvds_p3[12]}]

##########################################################################
#PAL



set_property PACKAGE_PIN F23 [get_ports {lvds_p4[0]}]
set_property PACKAGE_PIN C23 [get_ports {lvds_p4[1]}]
set_property PACKAGE_PIN D20 [get_ports {lvds_p4[2]}]
set_property PACKAGE_PIN E22 [get_ports {lvds_p4[3]}]
set_property PACKAGE_PIN G21 [get_ports {lvds_p4[4]}]
set_property PACKAGE_PIN C22 [get_ports {lvds_p4[5]}]
set_property PACKAGE_PIN M18 [get_ports {lvds_p4[6]}]
set_property PACKAGE_PIN D24 [get_ports {lvds_p4[7]}]
set_property PACKAGE_PIN H19 [get_ports {lvds_p4[8]}]
set_property PACKAGE_PIN A23 [get_ports {lvds_p4[9]}]
set_property PACKAGE_PIN L19 [get_ports {lvds_p4[10]}]
set_property PACKAGE_PIN B21 [get_ports {lvds_p4[11]}]
set_property PACKAGE_PIN M20 [get_ports {lvds_p4[12]}]

##########################################################################
#PAL

set_property PACKAGE_PIN D15 [get_ports {lvds_p5[0]}]
set_property PACKAGE_PIN H17 [get_ports {lvds_p5[1]}]
set_property PACKAGE_PIN C13 [get_ports {lvds_p5[2]}]
set_property PACKAGE_PIN E16 [get_ports {lvds_p5[3]}]
set_property PACKAGE_PIN C18 [get_ports {lvds_p5[4]}]
set_property PACKAGE_PIN B16 [get_ports {lvds_p5[5]}]
set_property PACKAGE_PIN K16 [get_ports {lvds_p5[6]}]
set_property PACKAGE_PIN F18 [get_ports {lvds_p5[7]}]
set_property PACKAGE_PIN A14 [get_ports {lvds_p5[8]}]
set_property PACKAGE_PIN E17 [get_ports {lvds_p5[9]}]
set_property PACKAGE_PIN M17 [get_ports {lvds_p5[10]}]
set_property PACKAGE_PIN J15 [get_ports {lvds_p5[11]}]
set_property PACKAGE_PIN J14 [get_ports {lvds_p5[12]}]

##########################################################################
#PAL

set_property PACKAGE_PIN M15 [get_ports {lvds_p6[0]}]
set_property PACKAGE_PIN K17 [get_ports {lvds_p6[1]}]
set_property PACKAGE_PIN E14 [get_ports {lvds_p6[2]}]
set_property PACKAGE_PIN B17 [get_ports {lvds_p6[3]}]
set_property PACKAGE_PIN L14 [get_ports {lvds_p6[4]}]
set_property PACKAGE_PIN F14 [get_ports {lvds_p6[5]}]
set_property PACKAGE_PIN H12 [get_ports {lvds_p6[6]}]
set_property PACKAGE_PIN E12 [get_ports {lvds_p6[7]}]
set_property PACKAGE_PIN F9 [get_ports {lvds_p6[8]}]
set_property PACKAGE_PIN E11 [get_ports {lvds_p6[9]}]
set_property PACKAGE_PIN K11 [get_ports {lvds_p6[10]}]
set_property PACKAGE_PIN D10 [get_ports {lvds_p6[11]}]
set_property PACKAGE_PIN L13 [get_ports {lvds_p6[12]}]

##########################################################################
#PAL

set_property PACKAGE_PIN B11 [get_ports {lvds_p7[0]}]
set_property PACKAGE_PIN C12 [get_ports {lvds_p7[1]}]
set_property PACKAGE_PIN J10 [get_ports {lvds_p7[2]}]
set_property PACKAGE_PIN K12 [get_ports {lvds_p7[3]}]
set_property PACKAGE_PIN A9 [get_ports {lvds_p7[4]}]
set_property PACKAGE_PIN H8 [get_ports {lvds_p7[5]}]
set_property PACKAGE_PIN L9 [get_ports {lvds_p7[6]}]
set_property PACKAGE_PIN A11 [get_ports {lvds_p7[7]}]
set_property PACKAGE_PIN C9 [get_ports {lvds_p7[8]}]
set_property PACKAGE_PIN M11 [get_ports {lvds_p7[9]}]
set_property PACKAGE_PIN M10 [get_ports {lvds_p7[10]}]
set_property PACKAGE_PIN D9 [get_ports {lvds_p7[11]}]
set_property PACKAGE_PIN E9 [get_ports {lvds_p7[12]}]

##########################################################################
#PAL

set_property PACKAGE_PIN N33 [get_ports {lvds_p8[0]}]
set_property PACKAGE_PIN M30 [get_ports {lvds_p8[1]}]
set_property PACKAGE_PIN U28 [get_ports {lvds_p8[2]}]
set_property PACKAGE_PIN R26 [get_ports {lvds_p8[3]}]
set_property PACKAGE_PIN M32 [get_ports {lvds_p8[4]}]
set_property PACKAGE_PIN U26 [get_ports {lvds_p8[5]}]
set_property PACKAGE_PIN R33 [get_ports {lvds_p8[6]}]
set_property PACKAGE_PIN R31 [get_ports {lvds_p8[7]}]
set_property PACKAGE_PIN T33 [get_ports {lvds_p8[8]}]
set_property PACKAGE_PIN T24 [get_ports {lvds_p8[9]}]
set_property PACKAGE_PIN P32 [get_ports {lvds_p8[10]}]
set_property PACKAGE_PIN T29 [get_ports {lvds_p8[11]}]
set_property PACKAGE_PIN U25 [get_ports {lvds_p8[12]}]

##########################################################################
#PAL

set_property PACKAGE_PIN N29 [get_ports {lvds_p9[0]}]
set_property PACKAGE_PIN P26 [get_ports {lvds_p9[1]}]
set_property PACKAGE_PIN N27 [get_ports {lvds_p9[2]}]
set_property PACKAGE_PIN T31 [get_ports {lvds_p9[3]}]
set_property PACKAGE_PIN N24 [get_ports {lvds_p9[4]}]
set_property PACKAGE_PIN U31 [get_ports {lvds_p9[5]}]
set_property PACKAGE_PIN AA33 [get_ports {lvds_p9[6]}]
set_property PACKAGE_PIN V32 [get_ports {lvds_p9[7]}]
set_property PACKAGE_PIN AB31 [get_ports {lvds_p9[8]}]
set_property PACKAGE_PIN Y31 [get_ports {lvds_p9[9]}]
set_property PACKAGE_PIN AA30 [get_ports {lvds_p9[10]}]
set_property PACKAGE_PIN W32 [get_ports {lvds_p9[11]}]
set_property PACKAGE_PIN V34 [get_ports {lvds_p9[12]}]

##########################################################################
#PAL

set_property PACKAGE_PIN Y33 [get_ports {lvds_p10[0]}]
set_property PACKAGE_PIN V29 [get_ports {lvds_p10[1]}]
set_property PACKAGE_PIN AB33 [get_ports {lvds_p10[2]}]
set_property PACKAGE_PIN Y28 [get_ports {lvds_p10[3]}]
set_property PACKAGE_PIN AB27 [get_ports {lvds_p10[4]}]
set_property PACKAGE_PIN AA26 [get_ports {lvds_p10[5]}]
set_property PACKAGE_PIN AA28 [get_ports {lvds_p10[6]}]
set_property PACKAGE_PIN V27 [get_ports {lvds_p10[7]}]
set_property PACKAGE_PIN AC32 [get_ports {lvds_p10[8]}]
set_property PACKAGE_PIN Y26 [get_ports {lvds_p10[9]}]
set_property PACKAGE_PIN W24 [get_ports {lvds_p10[10]}]
set_property PACKAGE_PIN V24 [get_ports {lvds_p10[11]}]
set_property PACKAGE_PIN W26 [get_ports {lvds_p10[12]}]

##########################################################################
#PAL

set_property PACKAGE_PIN AK23 [get_ports {lvds_p11[0]}]
set_property PACKAGE_PIN AN24 [get_ports {lvds_p11[1]}]
set_property PACKAGE_PIN AK24 [get_ports {lvds_p11[2]}]
set_property PACKAGE_PIN AL20 [get_ports {lvds_p11[3]}]
set_property PACKAGE_PIN AM22 [get_ports {lvds_p11[4]}]
set_property PACKAGE_PIN AM20 [get_ports {lvds_p11[5]}]
set_property PACKAGE_PIN AN19 [get_ports {lvds_p11[6]}]
set_property PACKAGE_PIN AK19 [get_ports {lvds_p11[7]}]
set_property PACKAGE_PIN AM23 [get_ports {lvds_p11[8]}]
set_property PACKAGE_PIN AJ19 [get_ports {lvds_p11[9]}]
set_property PACKAGE_PIN AP21 [get_ports {lvds_p11[10]}]
set_property PACKAGE_PIN AJ21 [get_ports {lvds_p11[11]}]
set_property PACKAGE_PIN AN20 [get_ports {lvds_p11[12]}]

##########################################################################
#PAL

set_property PACKAGE_PIN AG17 [get_ports {lvds_p12[0]}]
set_property PACKAGE_PIN AD16 [get_ports {lvds_p12[1]}]
set_property PACKAGE_PIN AN15 [get_ports {lvds_p12[2]}]
set_property PACKAGE_PIN AE17 [get_ports {lvds_p12[3]}]
set_property PACKAGE_PIN AC17 [get_ports {lvds_p12[4]}]
set_property PACKAGE_PIN AK18 [get_ports {lvds_p12[5]}]
set_property PACKAGE_PIN AN14 [get_ports {lvds_p12[6]}]
set_property PACKAGE_PIN AF15 [get_ports {lvds_p12[7]}]
set_property PACKAGE_PIN AK14 [get_ports {lvds_p12[8]}]
set_property PACKAGE_PIN AJ17 [get_ports {lvds_p12[9]}]
set_property PACKAGE_PIN AF16 [get_ports {lvds_p12[10]}]
set_property PACKAGE_PIN AE14 [get_ports {lvds_p12[11]}]
set_property PACKAGE_PIN AF18 [get_ports {lvds_p12[12]}]

##########################################################################
#PAL

set_property PACKAGE_PIN AM18 [get_ports {lvds_p13[0]}]
set_property PACKAGE_PIN AF13 [get_ports {lvds_p13[1]}]
set_property PACKAGE_PIN AM17 [get_ports {lvds_p13[2]}]
set_property PACKAGE_PIN AL16 [get_ports {lvds_p13[3]}]
set_property PACKAGE_PIN AL15 [get_ports {lvds_p13[4]}]
set_property PACKAGE_PIN AH14 [get_ports {lvds_p13[5]}]
set_property PACKAGE_PIN AL11 [get_ports {lvds_p13[6]}]
set_property PACKAGE_PIN AK9 [get_ports {lvds_p13[7]}]
set_property PACKAGE_PIN AP12 [get_ports {lvds_p13[8]}]
set_property PACKAGE_PIN AF10 [get_ports {lvds_p13[9]}]
set_property PACKAGE_PIN AH10 [get_ports {lvds_p13[10]}]
set_property PACKAGE_PIN AD10 [get_ports {lvds_p13[11]}]
set_property PACKAGE_PIN AF11 [get_ports {lvds_p13[12]}]

##########################################################################
#PAL

set_property PACKAGE_PIN AG12 [get_ports {lvds_p14[0]}]
set_property PACKAGE_PIN AM12 [get_ports {lvds_p14[1]}]
set_property PACKAGE_PIN AD12 [get_ports {lvds_p14[2]}]
set_property PACKAGE_PIN AE9 [get_ports {lvds_p14[3]}]
set_property PACKAGE_PIN AE12 [get_ports {lvds_p14[4]}]
set_property PACKAGE_PIN AF9 [get_ports {lvds_p14[5]}]
set_property PACKAGE_PIN AN10 [get_ports {lvds_p14[6]}]
set_property PACKAGE_PIN AL10 [get_ports {lvds_p14[7]}]
set_property PACKAGE_PIN AK8 [get_ports {lvds_p14[8]}]
set_property PACKAGE_PIN AC10 [get_ports {lvds_p14[9]}]
set_property PACKAGE_PIN AG8 [get_ports {lvds_p14[10]}]
set_property PACKAGE_PIN AN9 [get_ports {lvds_p14[11]}]
set_property PACKAGE_PIN AM13 [get_ports {lvds_p14[12]}]

set_property IOSTANDARD LVDS [get_ports lvds_p*]
set_property IOSTANDARD LVDS [get_ports clk_p*]
##########################################################################
#spi

set_property PACKAGE_PIN AE34 [get_ports cs]
set_property PACKAGE_PIN AF33 [get_ports clk_spi]
set_property PACKAGE_PIN AD34 [get_ports mosi]
set_property PACKAGE_PIN AE33 [get_ports miso]

set_property PACKAGE_PIN AH34 [get_ports PDLU_EN]
set_property PACKAGE_PIN AJ34 [get_ports PDLU_pixel_RSTN]
set_property PACKAGE_PIN AH33 [get_ports PDLU_RSTN]
set_property PACKAGE_PIN AG33 [get_ports PDRU_Mclk_20M]

set_property IOSTANDARD LVCMOS18 [get_ports cs]
set_property IOSTANDARD LVCMOS18 [get_ports clk_spi]
set_property IOSTANDARD LVCMOS18 [get_ports mosi]
set_property IOSTANDARD LVCMOS18 [get_ports miso]

set_property IOSTANDARD LVCMOS18 [get_ports PDLU_EN]
set_property IOSTANDARD LVCMOS18 [get_ports PDLU_pixel_RSTN]
set_property IOSTANDARD LVCMOS18 [get_ports PDLU_RSTN]
set_property IOSTANDARD LVCMOS18 [get_ports PDRU_Mclk_20M]

##########################################################################
#SYS
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]

set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins clk_wiz_1_inst/inst/mmcm_adv_inst/CLKOUT1]] -group [get_clocks -of_objects [get_pins clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0]]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins aurora_64b66b_0_block_i/clock_module_i/mmcm_adv_inst/CLKOUT0]] -group [get_clocks -of_objects [get_pins clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0]]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins clk_wiz_1_inst/inst/mmcm_adv_inst/CLKOUT1]] -group [get_clocks -of_objects [get_pins {pixel_top_inst/pixel_sync[0].u_pixel_receive/BUFR_inst/O}]]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins clk_wiz_1_inst/inst/mmcm_adv_inst/CLKOUT1]] -group [get_clocks -of_objects [get_pins {pixel_top_inst/pixel_sync[1].u_pixel_receive/BUFR_inst/O}]]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins clk_wiz_1_inst/inst/mmcm_adv_inst/CLKOUT1]] -group [get_clocks -of_objects [get_pins {pixel_top_inst/pixel_sync[10].u_pixel_receive/BUFR_inst/O}]]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins clk_wiz_1_inst/inst/mmcm_adv_inst/CLKOUT1]] -group [get_clocks -of_objects [get_pins {pixel_top_inst/pixel_sync[11].u_pixel_receive/BUFR_inst/O}]]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins clk_wiz_1_inst/inst/mmcm_adv_inst/CLKOUT1]] -group [get_clocks -of_objects [get_pins {pixel_top_inst/pixel_sync[12].u_pixel_receive/BUFR_inst/O}]]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins clk_wiz_1_inst/inst/mmcm_adv_inst/CLKOUT1]] -group [get_clocks -of_objects [get_pins {pixel_top_inst/pixel_sync[13].u_pixel_receive/BUFR_inst/O}]]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins clk_wiz_1_inst/inst/mmcm_adv_inst/CLKOUT1]] -group [get_clocks -of_objects [get_pins {pixel_top_inst/pixel_sync[2].u_pixel_receive/BUFR_inst/O}]]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins clk_wiz_1_inst/inst/mmcm_adv_inst/CLKOUT1]] -group [get_clocks -of_objects [get_pins {pixel_top_inst/pixel_sync[3].u_pixel_receive/BUFR_inst/O}]]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins clk_wiz_1_inst/inst/mmcm_adv_inst/CLKOUT1]] -group [get_clocks -of_objects [get_pins {pixel_top_inst/pixel_sync[4].u_pixel_receive/BUFR_inst/O}]]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins clk_wiz_1_inst/inst/mmcm_adv_inst/CLKOUT1]] -group [get_clocks -of_objects [get_pins {pixel_top_inst/pixel_sync[5].u_pixel_receive/BUFR_inst/O}]]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins clk_wiz_1_inst/inst/mmcm_adv_inst/CLKOUT1]] -group [get_clocks -of_objects [get_pins {pixel_top_inst/pixel_sync[6].u_pixel_receive/BUFR_inst/O}]]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins clk_wiz_1_inst/inst/mmcm_adv_inst/CLKOUT1]] -group [get_clocks -of_objects [get_pins {pixel_top_inst/pixel_sync[7].u_pixel_receive/BUFR_inst/O}]]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins clk_wiz_1_inst/inst/mmcm_adv_inst/CLKOUT1]] -group [get_clocks -of_objects [get_pins {pixel_top_inst/pixel_sync[8].u_pixel_receive/BUFR_inst/O}]]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins clk_wiz_1_inst/inst/mmcm_adv_inst/CLKOUT1]] -group [get_clocks -of_objects [get_pins {pixel_top_inst/pixel_sync[9].u_pixel_receive/BUFR_inst/O}]]
set_property PACKAGE_PIN M6 [get_ports MGT117_P]
set_property PACKAGE_PIN J4 [get_ports {QSFP1_RX_P[3]}]
set_property PACKAGE_PIN K6 [get_ports {QSFP1_RX_P[2]}]
set_property PACKAGE_PIN L4 [get_ports {QSFP1_RX_P[1]}]
set_property PACKAGE_PIN N4 [get_ports {QSFP1_RX_P[0]}]


set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 40 [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]
set_property CFGBVS GND [current_design]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk10m]
