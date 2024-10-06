module saveimg_and_sub #(  
    parameter DATA_WIDTH = 4,    // 每个数据的位宽  
    parameter RAM_DEPTH = 540,   // RAM的深度  
    parameter NUM_ROWS = 276     // 行数  
) (  
    input wire clk,              // 时钟信号  
    input wire rstn,            // 复位信号  
    input wire [NUM_ROWS*DATA_WIDTH-1:0] tfi_data,
    output reg [$clog2(RAM_DEPTH)-1:0]   tfi_addr,
    output reg                           tfi_read_en,
    output reg                           led_en
);  
    wire [19:0] sum_subtraction_current;
    reg  [19:0] sum_subtraction_before;
    reg  [13:0] sum_subtraction_item[0:11];
        
    assign sum_subtraction_current  = sum_subtraction_item[0] 
                                    + sum_subtraction_item[1] 
                                    + sum_subtraction_item[2] 
                                    + sum_subtraction_item[3] 
                                    + sum_subtraction_item[4] 
                                    + sum_subtraction_item[5] 
                                    + sum_subtraction_item[6] 
                                    + sum_subtraction_item[7] 
                                    + sum_subtraction_item[8] 
                                    + sum_subtraction_item[9] 
                                    + sum_subtraction_item[10] 
                                    + sum_subtraction_item[11];
                                    
    
    // 行索引  
    integer row_index;  
    integer  batch_index;


    always @(posedge clk or negedge rstn) begin  
        if (~rstn || (tfi_addr == RAM_DEPTH-1 && row_index == NUM_ROWS)) begin  
            row_index <= 0; // 复位时重置行索引  
            for (batch_index = 0; batch_index < 12; batch_index = batch_index + 'd1) begin   
                sum_subtraction_item[batch_index] <= 'd0;
            end
        end else if (row_index < NUM_ROWS) begin  
            // 访问当前行并处理数据  
            for (batch_index = 0; batch_index < 12; batch_index = batch_index + 'd1) begin   
                case(tfi_data[row_index*4+batch_index*4+:4])
                    4'd0: begin
                        sum_subtraction_item[batch_index] <= sum_subtraction_item[batch_index] + 'd1;
                    end
                    4'd1: begin
                        sum_subtraction_item[batch_index] <= sum_subtraction_item[batch_index] + 'd1;
                    end
                    4'd2: begin
                        sum_subtraction_item[batch_index] <= sum_subtraction_item[batch_index] + 'd1;
                    end
                    4'd3: begin
                        sum_subtraction_item[batch_index] <= sum_subtraction_item[batch_index] + 'd1;
                    end
                    4'd4: begin
                        sum_subtraction_item[batch_index] <= sum_subtraction_item[batch_index] + 'd1;
                    end
                    default: begin
                        sum_subtraction_item[batch_index] <= sum_subtraction_item[batch_index];
                    end
                endcase
            end
            row_index <= row_index + 'd12;
        end else begin
            row_index <= 0; //一行处理完倒回来。
        end
    end  
    always @(posedge clk or negedge rstn) begin  
        if (~rstn) begin  
            tfi_addr    <= 'd0;
            tfi_read_en <= 1; 
            led_en <= 0;
        end else if (row_index == NUM_ROWS) begin  
            if(tfi_addr == RAM_DEPTH-1) begin
                tfi_addr <= 'd0;
                //地址回到0的时候，一帧计数完成了
                //此时做差检测。
                if(sum_subtraction_before - sum_subtraction_current > 20'd74520)
                    led_en <= 1;
                sum_subtraction_before <= sum_subtraction_current;
            end else begin
                tfi_addr <= tfi_addr + 'd1;
                led_en <= 0;
            end
            tfi_read_en <= 1; 
        end else begin
            tfi_addr    <= tfi_addr;
            tfi_read_en <= 0; 
            led_en <= 0;
        end
    end  

endmodule