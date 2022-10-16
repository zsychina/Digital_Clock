module display_ctrl (
    input clk,
    input rst_n,
    input   [3:0]   sec_ge,
    input   [3:0]   sec_shi,
    input   [3:0]   min_ge,
    input   [3:0]   min_shi,
    input   [3:0]   hour_ge,
    input   [3:0]   hour_shi,

    output [6:0] out_sec_ge_seg,
    output [6:0] out_sec_shi_seg,
    output [6:0] out_min_ge_seg,
    output [6:0] out_min_shi_seg,
    output [6:0] out_hour_ge_seg,
    output [6:0] out_hour_shi_seg
);

reg [6:0] out_sec_ge;
reg [6:0] out_sec_shi;
reg [6:0] out_min_ge;
reg [6:0] out_min_shi;
reg [6:0] out_hour_ge;
reg [6:0] out_hour_shi;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin // rst_n = 0
        out_sec_ge<=0;
        out_sec_shi<=0;
        out_min_ge<=0;
        out_min_shi<=0;
        out_hour_ge<=0;
        out_hour_shi<=0;
    end
    else begin
        case(sec_ge)
            4'h0:out_sec_ge = 7'b100_0000;//显示0
            4'h1:out_sec_ge = 7'b111_1001;//显示1
            4'h2:out_sec_ge = 7'b010_0100;//显示2
            4'h3:out_sec_ge = 7'b011_0000;//显示3
            4'h4:out_sec_ge = 7'b001_1001;//显示4
            4'h5:out_sec_ge = 7'b001_0010;//显示5
            4'h6:out_sec_ge = 7'b000_0010;//显示6
            4'h7:out_sec_ge = 7'b111_1000;//显示7
            4'h8:out_sec_ge = 7'b000_0000;//显示8
            4'h9:out_sec_ge = 7'b001_0000;//显示9
            default out_sec_ge = out_sec_ge;
        endcase
        case(sec_shi)
            4'h0:out_sec_shi = 7'b100_0000;//显示0
            4'h1:out_sec_shi = 7'b111_1001;//显示1
            4'h2:out_sec_shi = 7'b010_0100;//显示2
            4'h3:out_sec_shi = 7'b011_0000;//显示3
            4'h4:out_sec_shi = 7'b001_1001;//显示4
            4'h5:out_sec_shi = 7'b001_0010;//显示5
            4'h6:out_sec_shi = 7'b000_0010;//显示6
            4'h7:out_sec_shi = 7'b111_1000;//显示7
            4'h8:out_sec_shi = 7'b000_0000;//显示8
            4'h9:out_sec_shi = 7'b001_0000;//显示9
            default out_sec_shi = out_sec_shi;
        endcase        
        case(min_ge)                 
            4'h0:out_min_ge = 7'b100_0000;//显示0
            4'h1:out_min_ge = 7'b111_1001;//显示1
            4'h2:out_min_ge = 7'b010_0100;//显示2
            4'h3:out_min_ge = 7'b011_0000;//显示3
            4'h4:out_min_ge = 7'b001_1001;//显示4
            4'h5:out_min_ge = 7'b001_0010;//显示5
            4'h6:out_min_ge = 7'b000_0010;//显示6
            4'h7:out_min_ge = 7'b111_1000;//显示7
            4'h8:out_min_ge = 7'b000_0000;//显示8
            4'h9:out_min_ge = 7'b001_0000;//显示9
            default out_min_ge = out_min_ge;
        endcase     
        case(min_shi)                 
            4'h0:out_min_shi = 7'b100_0000;//显示0
            4'h1:out_min_shi = 7'b111_1001;//显示1
            4'h2:out_min_shi = 7'b010_0100;//显示2
            4'h3:out_min_shi = 7'b011_0000;//显示3
            4'h4:out_min_shi = 7'b001_1001;//显示4
            4'h5:out_min_shi = 7'b001_0010;//显示5
            4'h6:out_min_shi = 7'b000_0010;//显示6
            4'h7:out_min_shi = 7'b111_1000;//显示7
            4'h8:out_min_shi = 7'b000_0000;//显示8
            4'h9:out_min_shi = 7'b001_0000;//显示9
            default out_min_shi = out_min_shi;
        endcase     
        case(hour_ge)                 
            4'h0:out_hour_ge = 7'b100_0000;//显示0
            4'h1:out_hour_ge = 7'b111_1001;//显示1
            4'h2:out_hour_ge = 7'b010_0100;//显示2
            4'h3:out_hour_ge = 7'b011_0000;//显示3
            4'h4:out_hour_ge = 7'b001_1001;//显示4
            4'h5:out_hour_ge = 7'b001_0010;//显示5
            4'h6:out_hour_ge = 7'b000_0010;//显示6
            4'h7:out_hour_ge = 7'b111_1000;//显示7
            4'h8:out_hour_ge = 7'b000_0000;//显示8
            4'h9:out_hour_ge = 7'b001_0000;//显示9
            default out_hour_ge = out_hour_ge;
        endcase    
        case(hour_shi)                 
            4'h0:out_hour_shi = 7'b100_0000;//显示0
            4'h1:out_hour_shi = 7'b111_1001;//显示1
            4'h2:out_hour_shi = 7'b010_0100;//显示2
            4'h3:out_hour_shi = 7'b011_0000;//显示3
            4'h4:out_hour_shi = 7'b001_1001;//显示4
            4'h5:out_hour_shi = 7'b001_0010;//显示5
            4'h6:out_hour_shi = 7'b000_0010;//显示6
            4'h7:out_hour_shi = 7'b111_1000;//显示7
            4'h8:out_hour_shi = 7'b000_0000;//显示8
            4'h9:out_hour_shi = 7'b001_0000;//显示9
            default out_hour_shi = out_hour_shi;
        endcase     
    end 
end

assign out_sec_ge_seg = out_sec_ge;
assign out_sec_shi_seg = out_sec_shi;
assign out_min_ge_seg = out_min_ge;
assign out_min_shi_seg = out_min_shi;
assign out_hour_ge_seg = out_hour_ge;
assign out_hour_shi_seg = out_hour_shi;


endmodule
