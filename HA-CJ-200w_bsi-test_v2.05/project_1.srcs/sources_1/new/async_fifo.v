module async_fifo#(
    parameter DSIZE = 8,
    parameter ASIZE = 4)(
input  w_clk,w_rst_n,w_en,
input  [DSIZE-1:0] w_data,
input  r_clk,r_rst_n,r_en,
output [DSIZE-1:0] r_data,
output reg r_empty,w_full
);
localparam DEPTH = 1 << ASIZE;
reg [DSIZE-1:0] fifo_mem [0:DEPTH-1];
reg [ASIZE:0] wptr,rptr,w2r_ff1,w2r_ff2,r2w_ff1,r2w_ff2,wbin,rbin;
wire [ASIZE:0] wbin_next,rbin_next,w_graycode,r_graycode;
wire [ASIZE-1:0] waddr,raddr;
wire full,empty;

always@(posedge r_clk or negedge r_rst_n) begin
    if(!r_rst_n) begin
        w2r_ff1 <= 'd0;
        w2r_ff2 <= 'd0;
    end else begin
        w2r_ff1 <= wptr;
        w2r_ff2 <= w2r_ff1;
    end
end
always@(posedge w_clk or negedge w_rst_n) begin
    if(!w_rst_n) begin
        r2w_ff1 <= 0;
        r2w_ff2 <= 0;
    end else begin
        r2w_ff1 <= rptr;
        r2w_ff2 <= r2w_ff1;
    end
end

always@(posedge r_clk or negedge r_rst_n) begin
    if(!r_rst_n) begin
        rbin <= 0;
        rptr <= 0;
    end else begin
        rbin <= rbin_next;
        rptr <= r_graycode;
    end
end 
always@(posedge w_clk or negedge w_rst_n) begin
    if(!w_rst_n) begin
        wbin <= 0;
        wptr <= 0;
    end else begin
        wbin <= wbin_next;
        wptr <= w_graycode;
    end
end
assign waddr = wbin[ASIZE-1:0];
assign raddr = rbin[ASIZE-1:0];
assign full = (w_graycode=={~r2w_ff2[ASIZE:ASIZE-1],r2w_ff2[ASIZE-2:0]});
assign empty = (r_graycode == w2r_ff2);
assign wbin_next = wbin + (w_en&~w_full);
assign rbin_next = rbin + (r_en&~r_empty);
assign w_graycode = wbin_next^(wbin_next>>1);
assign r_graycode = rbin_next^(rbin_next>>1);

always@(posedge w_clk or negedge w_rst_n) begin
    if(!w_rst_n) w_full <= 0;
    else w_full <= full;
end
always@(posedge r_clk or negedge r_rst_n) begin
    if(!r_rst_n) r_empty <= 1;
    else r_empty <= empty;
end
always@(posedge w_clk) begin
    if(w_en & ~w_full)
        fifo_mem[waddr] <= w_data;
end
assign r_data = fifo_mem[raddr];
endmodule