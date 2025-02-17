// number of pins should be cut down
module TOP(
    input	clk,
    input	rst_n,

    input	set_time_finish,
    // input 	[3:0]	set_sec_ge,
    // input 	[3:0]	set_sec_shi, 
    // input 	[3:0]	set_min_ge,  
    // input 	[3:0]	set_min_shi,	
    // input 	[3:0]	set_hour_ge,
    // input 	[3:0]	set_hour_shi,
    
    input	clock_en,
    input 	[3:0]	clock_min_ge,
    input 	[3:0]	clock_min_shi,
    input 	[3:0]	clock_hour_ge,
    input 	[3:0]	clock_hour_shi,
    output  clock_out,

    // output	[3:0]	sec_ge_r,
    // output	[3:0]	sec_shi_r,
    // output	[3:0]	min_ge_r,
    // output	[3:0]	min_shi_r,
    // output	[3:0]	hour_ge_r,
    // output	[3:0]	hour_shi_r,


    output [6:0] out_sec_ge_seg,
    output [6:0] out_sec_shi_seg,
    output [6:0] out_min_ge_seg,
    output [6:0] out_min_shi_seg,
    output [6:0] out_hour_ge_seg,
    output [6:0] out_hour_shi_seg
);

// default set_time: 12:00:00
// reg [3:0]	set_sec_ge;
// reg [3:0]	set_sec_shi; 
// reg [3:0]	set_min_ge; 
// reg [3:0]	set_min_shi;	
// reg [3:0]	set_hour_ge;
// reg [3:0]	set_hour_shi;   
// initial begin
//     set_sec_ge <= 4'h0;
//     set_sec_shi <= 4'h0; 
//     set_min_ge <= 4'h0; 
//     set_min_shi <= 4'h0;	
//     set_hour_ge <= 4'h2;
//     set_hour_shi <= 4'h1;   
// end



wire [3:0]	sec_ge_rr;
wire [3:0]	sec_shi_rr;
wire [3:0]	min_ge_rr;
wire [3:0]	min_shi_rr;
wire [3:0]	hour_ge_rr;
wire [3:0]	hour_shi_rr;


wire    [6:0]   out_sec_ge_seg_temp;
wire    [6:0]   out_sec_shi_seg_temp;
wire    [6:0]   out_min_ge_seg_temp;
wire    [6:0]   out_min_shi_seg_temp;
wire    [6:0]   out_hour_ge_seg_temp;
wire    [6:0]   out_hour_shi_seg_temp;


// assigning
assign	sec_ge_r = sec_ge_rr;
assign	sec_shi_r = sec_shi_rr;
assign	min_ge_r = min_ge_rr;
assign	min_shi_r = min_shi_rr;
assign	hour_ge_r = hour_ge_rr;
assign	hour_shi_r = hour_shi_rr;

assign out_sec_ge_seg = out_sec_ge_seg_temp;
assign out_sec_shi_seg = out_sec_shi_seg_temp;
assign out_min_ge_seg = out_min_ge_seg_temp;
assign out_min_shi_seg = out_min_shi_seg_temp;
assign out_hour_ge_seg = out_hour_ge_seg_temp;
assign out_hour_shi_seg = out_hour_shi_seg_temp;


//------------------------------//
time_control			time_control_inst(
    .clk				(clk),
    .rst_n				(rst_n),

    .set_time_finish	(set_time_finish),
    // .set_sec_ge			(set_sec_ge),
    // .set_sec_shi		(set_sec_shi),	 
    // .set_min_ge			(set_min_ge),  
    // .set_min_shi		(set_min_shi),	
    // .set_hour_ge		(set_hour_ge),
    // .set_hour_shi		(set_hour_shi),

    .clock_en			(clock_en),	
    .clock_min_ge		(clock_min_ge),
    .clock_min_shi		(clock_min_shi),
    .clock_hour_ge		(clock_hour_ge),
    .clock_hour_shi		(clock_hour_shi),
    .clock_out_w		(clock_out),

    .sec_ge_r			(sec_ge_rr),
    .sec_shi_r			(sec_shi_rr),
    .min_ge_r			(min_ge_rr),
    .min_shi_r			(min_shi_rr),
    .hour_ge_r			(hour_ge_rr),
    .hour_shi_r			(hour_shi_rr)
);

display_ctrl	display_ctrl_inst(
    .clk        (clk),
    .rst_n      (rst_n),
    .sec_ge	    (sec_ge_rr),
    .sec_shi    (sec_shi_rr),
    .min_ge	    (min_ge_rr),
    .min_shi    (min_shi_rr),
    .hour_ge    (hour_ge_rr),
    .hour_shi   (hour_shi_rr),    

    .out_sec_ge_seg     (out_sec_ge_seg_temp),
    .out_sec_shi_seg    (out_sec_shi_seg_temp),
    .out_min_ge_seg     (out_min_ge_seg_temp),
    .out_min_shi_seg    (out_min_shi_seg_temp),
    .out_hour_ge_seg    (out_hour_ge_seg_temp),
    .out_hour_shi_seg   (out_hour_shi_seg_temp)
);


endmodule
