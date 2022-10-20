module time_control(
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
    // output	reg		clock_out,
    output  clock_out_w,

    output	[3:0]	sec_ge_r,
    output	[3:0]	sec_shi_r,
    output	[3:0]	min_ge_r,
    output	[3:0]	min_shi_r,
    output	[3:0]	hour_ge_r,
    output	[3:0]	hour_shi_r
);


reg [3:0]	set_sec_ge;
reg [3:0]	set_sec_shi; 
reg [3:0]	set_min_ge; 
reg [3:0]	set_min_shi;	
reg [3:0]	set_hour_ge;
reg [3:0]	set_hour_shi;   
initial begin
    set_sec_ge <= 4'h5;
    set_sec_shi <= 4'h4; 
    set_min_ge <= 4'h9; 
    set_min_shi <= 4'h5;	
    set_hour_ge <= 4'h2;
    set_hour_shi <= 4'h1;   
end





// divider
// branch dlut22: considering the clk is 50MHz, the ms class delay should be a mod 5e4(16'd49999=16'b1100_0011_0100_1111) divider
//
reg		[15:0]	cnt_1ms;	
reg 	flag_1ms;			
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)	begin  // rst_n=0
        cnt_1ms <= 0;
        flag_1ms <= 0;
    end
    else if(cnt_1ms == 16'd4)	begin  // cnt_1ms = 0000 0000 0000 0100 = 16'd4, **change here if necessary**
        cnt_1ms <= 0;
        flag_1ms <= 1;
    end
    else	begin  
        cnt_1ms <= cnt_1ms + 1;
        flag_1ms <= 0;
    end
end

reg		[11:0]	cnt_1s;		
reg		flag_1s;			
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)	begin
        cnt_1s <= 0;
        flag_1s <= 0;
    end
    else if(flag_1ms)	begin
        if(cnt_1s == 12'd4)	begin  //cnt_1s = 0000 0000 0100, why not 12'd999, shouldn't it a mod1000 divdier?
            cnt_1s <= 0;
            flag_1s <= 1;
        end
        else	begin
            cnt_1s <= cnt_1s + 1;
            flag_1s <= 0;
        end
    end
    else	begin
        cnt_1s <= cnt_1s;
        flag_1s <= 0;
    end
end


reg		[3:0]	sec_ge;
reg		flag_sec_ge;		
reg		[2:0]	sec_shi;
reg		flag_sec_shi;		

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)	begin
        sec_ge <= 0;
        flag_sec_ge <= 0;
    end
    else if(!set_time_finish)	begin
        sec_ge <= set_sec_ge;
        flag_sec_ge <= 0;
    end
    else if(flag_1ms)	begin // should use flag_1s, when flag rise, sec_ge++
        if(sec_ge == 4'd9)	begin // ok, max of sec_ge is 9
            sec_ge <= 0;
            flag_sec_ge <= 1;
        end
        else	begin
            sec_ge <= sec_ge + 1;
            flag_sec_ge <= 0;
        end
    end
    else	begin
        sec_ge <= sec_ge;
        flag_sec_ge <= 0;
    end
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)	begin
        sec_shi <= 0;
        flag_sec_shi <= 0;
    end
    else if(!set_time_finish)	begin
        sec_shi <= set_sec_shi;
        flag_sec_shi <= 0;
    end		
    else if(flag_sec_ge)	begin
        if(sec_shi == 3'd5)begin
            sec_shi <= 0;
            flag_sec_shi <= 1;
        end
        else	begin
            sec_shi <= sec_shi + 1;
            flag_sec_shi <= 0;
        end
    end
    else	begin
        sec_shi <= sec_shi;
        flag_sec_shi <= 0;
    end
end


reg		[3:0]	min_ge;
reg		flag_min_ge;		
reg		[2:0]	min_shi;
reg		flag_min_shi;		

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)	begin
        min_ge <= 0;
        flag_min_ge <= 0;
    end
    else if(!set_time_finish)	begin
        min_ge <= set_min_ge;
        flag_min_ge <= 0;
    end	
    else if(flag_sec_shi)	begin
        if(min_ge == 4'd9)	begin
            min_ge <= 0;
            flag_min_ge <= 1;
        end
        else	begin
            min_ge <= min_ge + 1;
            flag_min_ge <= 0;
        end
    end
    else	begin
        min_ge <= min_ge;
        flag_min_ge <= 0;
    end
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)	begin
        min_shi <= 0;
        flag_min_shi <= 0;
    end
    else if(!set_time_finish)	begin
        min_shi <= set_min_shi;
        flag_min_shi <= 0;
    end
    else if(flag_min_ge)	begin
        if(min_shi == 3'd5)	begin
            min_shi <= 0;
            flag_min_shi <= 1;
        end
        else	begin
            min_shi <= min_shi + 1;
            flag_min_shi <= 0;
        end
    end
    else	begin
        min_shi <= min_shi;
        flag_min_shi <= 0;
    end
end


reg		[3:0]	hour_ge;
reg		flag_hour_ge;
reg		[1:0]	hour_shi;
reg		flag_hour_shi;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)	begin
        hour_ge <= 0;
        flag_hour_ge <= 0;
    end
    else if(!set_time_finish)	begin
        hour_ge <= set_hour_ge;
        flag_hour_ge <= 0;
    end	
    else if(flag_min_shi)	begin
        if(hour_ge == 4'd9)	begin
            hour_ge <= 0;
            flag_hour_ge <= 1;
        end
        else if((hour_shi == 3'd2) && (hour_ge == 4'd3))	begin
            hour_ge <= 0;
            flag_hour_ge <= 1;
        end
        else	begin
            hour_ge <= hour_ge + 1;
            flag_hour_ge <= 0;
        end
    end
    else	begin
        hour_ge <= hour_ge;
        flag_hour_ge <= 0;
    end
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)	begin
        hour_shi <= 0;
        flag_hour_shi <= 0;
    end
    else if(!set_time_finish)	begin
        hour_shi <= set_hour_shi;
        flag_hour_shi <= 0;
    end		
    else if(flag_hour_ge)	begin
        if(hour_shi == 3'd2)	begin
            hour_shi <= 0;
            flag_hour_shi <= 1;
        end
        else	begin
            hour_shi <= hour_shi + 1;
            flag_hour_shi <= 0;
        end
    end
    else	begin
        hour_shi <= hour_shi;
        flag_hour_shi <= 0;
    end
end
//============================================//

assign	sec_ge_r = sec_ge;
assign	sec_shi_r = sec_shi;
assign	min_ge_r = min_ge;
assign	min_shi_r = min_shi;
assign	hour_ge_r = hour_ge;
assign	hour_shi_r = hour_shi;


reg clock_out;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)	begin
        clock_out <= 0;
    end
    else if(!clock_en)	begin
        clock_out <= 0;
    end
    else if((hour_shi == clock_hour_shi) &&
            (hour_ge == clock_hour_ge) &&
            (min_shi == clock_min_shi) &&
            (min_ge == clock_min_ge)) begin
        clock_out <= 1;
    end
    else	begin
        clock_out <= clock_out;
    end
end


//============================================//

// hourly report
reg [15:0] parity_cnt;
reg clock_out_h;
always @(posedge flag_1ms or negedge rst_n) begin
    if(!rst_n) begin
        clock_out_h <= 0;
    end
    else if(!clock_en) begin
        clock_out_h <= 0;
    end
    else if(
        (min_shi == 4'h5) &&
        (min_ge == 4'h9) &&
        (sec_shi == 4'h5)
    ) begin
        parity_cnt = parity_cnt + 1;
        if(parity_cnt%2 == 1) begin  //change to 1000 when actually use
            clock_out_h <= 1;
        end
        else begin
            clock_out_h <= 0;
        end
    end
    else begin
        parity_cnt <= 0;
		clock_out_h <= 0;
    end
end



assign clock_out_w = clock_out|clock_out_h;


endmodule

