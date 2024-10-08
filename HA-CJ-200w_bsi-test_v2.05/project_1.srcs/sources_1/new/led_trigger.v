`timescale 1ns/1ps
module led_trigger(
    input trigger,
    input [13:0]delay_ms,//0~8Kms
    output reg led,
    input clk,
    input rst
    );
(* MARK_DEBUG="true" *)reg [19:0] ms_counter;
(* MARK_DEBUG="true" *)reg [13:0] ms_adder;
parameter WAIT = 3'b001;
parameter COUNT= 3'b010;
parameter IDLE = 3'b000;
(* MARK_DEBUG="true" *)reg [2:0] STATE;
always @(posedge clk) begin
    if(!rst)begin
        STATE<=IDLE;
        led<=0;
    end else begin
        if(STATE == IDLE)begin
                led<=0;
                STATE <= WAIT;
        end else if(STATE == WAIT)begin
            if(trigger == 1)begin
                STATE <= COUNT;
                led<=1;
            end
        end else if(STATE == COUNT)begin
            if(ms_adder == delay_ms)begin
                STATE <= IDLE;
            end
        end 
    end
end

    always @(posedge clk) begin
        if(!rst | STATE!=COUNT)begin
            ms_counter<='d0;
        end else if(ms_counter == 20'd250_000) begin
            ms_counter<=20'd0;
        end else begin
            ms_counter<=ms_counter+20'd1;
        end
    end
    always @(posedge clk) begin
        if(!rst | STATE!=COUNT)begin
            ms_adder<='d0;
        end else if(ms_adder == delay_ms)begin
            ms_adder<=ms_adder;
        end else if (ms_counter == 20'd250_000)begin
            ms_adder<=ms_adder+'d1;
        end
    end
endmodule
