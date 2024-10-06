`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/29 11:41:37
// Design Name: 
// Module Name: pixel_top_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pixel_top_tb;

    reg rstn, clk10m, clk200m, clk125m;

    reg lvds_clk_p, t_lvds_p;
    reg frame_en;
    wire lvds_clk_n, t_lvds_n;

    wire [12:0] lvds_p, lvds_n;

    assign lvds_p = {frame_en, {12{t_lvds_p}}};
    assign lvds_n = {~frame_en, {12{t_lvds_n}}};

    initial begin
        clk10m = 1;
        clk200m = 1;
        clk125m = 1;
        lvds_clk_p = 1;
    end

    always #50    clk10m  = ~clk10m;
    always #2.5   clk200m = ~clk200m;
    always #4     clk125m = ~clk125m;
    always #4.167 lvds_clk_p = ~lvds_clk_p;

    assign lvds_clk_n = ~lvds_clk_p;
    assign t_lvds_n   = ~t_lvds_p;

    initial begin
        rstn = 0;
        t_lvds_p = 0;
        frame_en = 0;

        #200

        rstn = 1;

        #500

        forever begin
            // #200
            repeat (23) begin
                @ (posedge lvds_clk_p)
                t_lvds_p <= ~t_lvds_p;
                frame_en = 1; 
            end
            
            repeat (23) begin
                @ (posedge lvds_clk_p)
                t_lvds_p <= ~t_lvds_p;
                frame_en = 1; 
            end
            
//            @ (posedge lvds_clk_p)
//            frame_en = 0; 

            
            repeat (269) begin
                repeat (23) begin
                    @ (posedge lvds_clk_p)
                    t_lvds_p <= ~t_lvds_p;
                    frame_en = 0; 
                end
                
                repeat (23) begin
                    @ (posedge lvds_clk_p)
                    t_lvds_p <= ~t_lvds_p;
                    frame_en = 0; 
                end
                
//                #200;
            end
            // @ (posedge lvds_clk_p)
            // t_lvds_p <= ~t_lvds_p;
            // frame_en = 0; 
        end
    end

    pixel_top DUT(
        .rstn (rstn),
    
        .clk10m (clk10m),
        .clk20m (1'b1),
        .clk100m (1'b1),
        .clk200m (clk200m),
        .clk125m (clk125m),

        //lvds
       .lvds_p1 (lvds_p        ),
       .lvds_n1 (lvds_n        ),
       .clk_p1  (lvds_clk_p    ),
       .clk_n1  (lvds_clk_n    ),


       .lvds_p2 (lvds_p        ),
       .lvds_n2 (lvds_n        ),
       .clk_p2  (lvds_clk_p    ),
       .clk_n2  (lvds_clk_n    ),


       .lvds_p3 (lvds_p        ),
       .lvds_n3 (lvds_n        ),
       .clk_p3  (lvds_clk_p    ),
       .clk_n3  (lvds_clk_n    ),


       .lvds_p4 (lvds_p        ),
       .lvds_n4 (lvds_n        ),
       .clk_p4  (lvds_clk_p    ),
       .clk_n4  (lvds_clk_n    ),


       .lvds_p5 (lvds_p        ),
       .lvds_n5 (lvds_n        ),
       .clk_p5  (lvds_clk_p    ),
       .clk_n5  (lvds_clk_n    ),


       .lvds_p6 (lvds_p        ),
       .lvds_n6 (lvds_n        ),
       .clk_p6  (lvds_clk_p    ),
       .clk_n6  (lvds_clk_n    ),


       .lvds_p7 (lvds_p        ),
       .lvds_n7 (lvds_n        ),
       .clk_p7  (lvds_clk_p    ),
       .clk_n7  (lvds_clk_n    ),


       .lvds_p8 (lvds_p        ),
       .lvds_n8 (lvds_n        ),
       .clk_p8  (lvds_clk_p    ),
       .clk_n8  (lvds_clk_n    ),


       .lvds_p9 (lvds_p        ),
       .lvds_n9 (lvds_n        ),
       .clk_p9  (lvds_clk_p    ),
       .clk_n9  (lvds_clk_n    ),


       .lvds_p10 (lvds_p        ),
       .lvds_n10 (lvds_n        ),
       .clk_p10  (lvds_clk_p    ),
       .clk_n10  (lvds_clk_n    ),


       .lvds_p11 (lvds_p        ),
       .lvds_n11 (lvds_n        ),
       .clk_p11  (lvds_clk_p    ),
       .clk_n11  (lvds_clk_n    ),


       .lvds_p12 (lvds_p        ),
       .lvds_n12 (lvds_n        ),
       .clk_p12  (lvds_clk_p    ),
       .clk_n12  (lvds_clk_n    ),


       .lvds_p13 (lvds_p        ),
       .lvds_n13 (lvds_n        ),
       .clk_p13  (lvds_clk_p    ),
       .clk_n13  (lvds_clk_n    ),


       .lvds_p14 (lvds_p        ), 
       .lvds_n14 (lvds_n        ), 
       .clk_p14  (lvds_clk_p    ), 
       .clk_n14  (lvds_clk_n    ), 


        .fifo_wr_ready (1'b1),
        //pixl data out
        .pixl_data_out (),
        .pixl_data_out_en (),
        //spi
        .clk_spi () ,
        .mosi (),
        .miso (1'b1),
        .cs ()
    );

endmodule
