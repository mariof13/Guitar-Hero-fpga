`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Boston University
// Engineer: Zafar M. Takhirov
// 
// Create Date:    12:59:40 04/12/2011 
// Design Name: EC311 Support Files
// Module Name:    vga_display 
// Project Name: Lab5 / Lab6 / Project
// Target Devices: xc6slx16-3csg324
// Tool versions: XILINX ISE 13.3
// Description: 
//
// Dependencies: vga_controller_640_60
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
module vga_display(trigger, debouncetrigger, AN, seven, rst,  clk, R, G, B, HS, VS,  red, blue, yellow, green, points1);
//////////////////////////////////////////////////////////////////////////////////
    input rst;  // global reset
    input clk;  // - clk
	 input trigger,debouncetrigger;
	 output [3:0] AN;
	 wire [15:0] addra;
	 wire [7:0] douta;
	
	 wire [13 : 0] addrb;
	wire [15 : 0] doutb;
	 input green;
	 input red;
	 input yellow;
	 input blue;
	 reg trig;
	 output [6:0] seven;
	 output reg [15:0] points1;
    // color inputs for a given pixel

    // color outputs to show on display (current pixel)
    output  reg [2:0] R, G;
    output  reg [1:0] B;

	 
    // Synchronization signals
    output HS;
    output VS;
	
	//initial stuff for game
	initial begin
	points1 <= 16'b0000000000000000;

	end
	
	//Green block at: (20, -1550) -> (120, -1500). Horizontal: 20, 120
	//Red block hits at. Horizontal: 180, 280
	//Yellow block hits at. Horizontal: 340, 440
	//Blue block hits at. Horizontal: 500, 600
	

    // controls:
    wire [10:0] hcount, vcount; // coordinates for the current pixel
    wire blank; // signal to indicate the current coordinate is blank
    wire block1;    // the figure you want to display
	 wire block2;
	 wire block3;
	 wire block4;
	 wire block5;
	 wire block6;
	 wire block7;
	 wire block8;
	 wire block9;
	 wire block10;
	 wire block11;
	 wire block12;
	 wire block13;
    /////////////////////////////////////////////////////
    // Begin clock division
    parameter N = 2;    // parameter for clock division
    reg clk_25Mhz;
	 reg counter_clock;
	 reg slow_game_clk;
    reg [N-1:0] count;
	 reg [3:0] count3;
	 reg [10:0] x, y, z, w;
	 reg [26:0] count2;
	 reg [26:0] count4;
	 
    always @ (posedge clk) begin
        count <= count + 1'b1;
        clk_25Mhz <= count[N-1];
    end
	 
	 
	 always @ (posedge clk) begin
        count <= count + 1'b1;
        counter_clock <= count[N-1];
    end
    // End clock division
    /////////////////////////////////////////////////////
    
    // Call driver
    vga_controller_640_60 vc(
        .rst(rst),
        .pixel_clk(clk_25Mhz),
        .HS(HS),
        .VS(VS),
        .hcounter(hcount),
        .vcounter(vcount),
        .blank(blank));

/*
		//call sprites
		
		vga_bsprite sprites_mem(
		.x0(0+150), 
		.y0(0+100),
		.x1(364+150),
		.y1(176+100),
		.hc(hcount), 
		.vc(vcount), 
		.mem_value(douta), 
		.rom_addr(addra), 
		.R(R), 
		.G(G), 
		.B(B), 
		.blank(blank)
	);
	
	thelastone memory_1 (
		.clka(clk_25Mhz), // input clka
		.addra(addra), // input [14 : 0] addra
		.douta(douta) // output [7 : 0] douta
	);
	*/


















//sevensegmentdisplay seg(clk,trigger,debouncetrigger,rst,AN,seven, red, blue, yellow, green);
 // State machine parameters
    parameter S_IDLE = 0;   // 0000 - no button pushed
    parameter S_UP = 1;     // 0001 - the first button pushed
    parameter S_DOWN = 2;   // 0010 - the second button pushed
    parameter S_LEFT = 4;   // 0100 - and so on
    parameter S_RIGHT = 8;  // 1000 - and so on

    reg [3:0] state, next_state;
    ////////////////////////////////////////

    //input up, down, left, right;    // 1 bit inputs

	  //currentposition variables
    reg slow_clk;                   // clock for position update,
                                    // if it’s too fast, every push
                                    // of a button willmake your object fly away.

	 	 reg pointstracker = 16'b0000000000000000;
	 		always @(posedge clk) begin
		
			if (count2 == 1200000)	begin count2 = 0; slow_game_clk = ~slow_game_clk;	end
			
			else begin count2 = count2 + 1;	end
			
			end
		
		
		
		
		
	 always @(posedge slow_game_clk) begin

		
		
		if (count4 > 1200) begin
		y = y + 20;
		end
		
		else	
		y = y + 10;
		count4 = count4 + 1;
		end
		/*if (pointstracker > 16'b0000000000000011) begin
		y = y + 100;
		end*/
		
	 
	 
	 
	     initial begin                   // initial position of the box
	 
	 
        x = 200; y=0; z=0; w=0;
		  
		  end
    

    ////////////////////////////////////////////
    // slow clock for position update - optional
    reg [23:0] slow_count;
    always @ (posedge clk)begin
        slow_count = slow_count + 1'b1;
        slow_clk = slow_count[23];
    end
    ///////////////////////////////////////



//////
    // create a box:
    assign block1 = ~blank & (hcount >= 500 & hcount <= 600 & vcount >= -50 + y& vcount <= 0 + y); //blue
	 assign block2 = ~blank & (hcount >= 340 & hcount <= 440 & vcount >= -650 + y & vcount <= -600 + y); //yelow
	 assign block3 = ~blank & (hcount >= 180 & hcount <= 280 & vcount >= -1050 + y& vcount <= -1000 + y); //red
	 assign block4 = ~blank & (hcount >= 20 & hcount <= 120 & vcount >= -1550 + y & vcount <= -1500 + y); //green
	 
	 
	 assign block6 = ~blank & (hcount >= 500 & hcount <= 600 & vcount >= -1250+ y& vcount <= -1200 + y); //blue
	 assign block7 = ~blank & (hcount >= 340 & hcount <= 440 & vcount >= -850 + y & vcount <= -800 + y); //yellow
	 assign block8 = ~blank & (hcount >= 180 & hcount <= 280 & vcount >= -1450 + y& vcount <= -1400 + y); //red
	 assign block9 = ~blank & (hcount >= 20 & hcount <= 120 & vcount >= -550 + y & vcount <= -500 + y); //green
	 
	 
	 assign block10 = ~blank & (hcount >= 500 & hcount <= 600 & vcount >= -1600 + y & vcount <= -1550 + y); //b;ie
	 assign block11= ~blank & (hcount >= 340 & hcount <= 440 & vcount >= -450 + y & vcount <= -400 + y); //yellow
	 assign block12= ~blank & (hcount >= 180 & hcount <= 280 & vcount >= -230 + y& vcount <= -180 + y); //red
	 assign block13 = ~blank & (hcount >= 20 & hcount <= 120 & vcount >= -1250 + y & vcount <= -1200 + y); //green
	 //assign block6 = ~blank & (hcount >= 500 & hcount <= 600 & vcount >= -50 + y& vcount <= 0 + y);
	 //assign block7 = ~blank & (hcount >= 340 & hcount <= 440 & vcount >= -650 + y & vcount <= -600 + y);
	 //assign block8 = ~blank & (hcount >= 180 & hcount <= 280 & vcount >= -1250 + y& vcount <= -1200 + y);
	 //assign block9 = ~blank & (hcount >= 20 & hcount <= 120 & vcount >= -650 + y & vcount <= -600 + y);
    assign block5 = ~blank & (hcount >= 0 & hcount <= 600 & vcount >= 400 & vcount <= 450);
   

/*always @ (posedge slow_game_clk) begin
//if (y > 390 && y < 520 && (blue))  begin //Alternatively, if ((y % 390) > 0 && (y % 520) > 0 && green == 1)
	if ((y % 390) > 0 && (y % 520) > 0 && (blue)) begin
	points1 <= points1 + 1'b1;
	trig = blue;
	
	end
	
//else if ((y >990) && (y % 1120) > 0 && (yellow)) begin
else if (y >990 && y <1120 && (yellow)) begin
	points1 <= points1 + 1'b1;
	trig = yellow;
	
	end
	
//else if ((y % 1390) > 0 && (y % 1520) > 0 && (red)) begin
else if (y>1390 && y < 1520 && (red)) begin
	points1 <= points1 + 1'b1;
	trig = red;
	
	end
	
//else if (y > 1890 && y < 2020 && blue == 1) begin
//else if ((y % 1890) > 0 && (y % 2020) > 0 && green == 1) begin
else if (y > 1890 && y < 2020 && (green)) begin
	points1 <= points1 + 1'b1;
	trig = green;
	
	end
	
	else
	points1 <= points1;
	trig = 0;
	
	end*/
	

	// send colors:
/*reg [15:0] lfsr_out = 16'b0101010101010101;
reg MSB_in;
reg [1:0] lfsr_final_out;
    always @ (posedge clk) begin
		MSB_in = lfsr_out[15] ^ lfsr_out[13] ^ lfsr_out[12] ^ lfsr_out[10];
		lfsr_out[15:0] = {lfsr_out[14:0], MSB_in};
		lfsr_final_out = lfsr_out[1:0];
	  		if (block5) begin   // if you are within the valid region
            R = 1;
            G = 1;
            B = 1;
        end*/
	/*	case(lfsr_final_out)
		2'b00:        if (block1) begin   // if you are within the valid region
            R = R_control;
            G = G_control;
            B = B_control;
				 R =0;
            G = 0;
            B = 3;
        end
		  
		2'b01: if (block2) begin   // if you are within the valid region
           // R = B_control;
           // B = G_control;
           // G = R_control;
				 R = 3;
            B = 0;
            G = 3;
        end
		  
		 2'b10: if (block3) begin   // if you are within the valid region
            R = 3;
            G = 0;
            B = 0;
        end
		  
		 2'b11: if (block4) begin   // if you are within the valid region
            R = 0;
            G = 3;
            B = 0;
        end
		  
		  
        default: begin  // if you are outside the valid region
            R = 0;
            G = 0;
            B = 0;
        end
		  endcase 
		  end	 

 always @ (posedge clk) begin
		MSB_in = lfsr_out[15] ^ lfsr_out[13] ^ lfsr_out[12] ^ lfsr_out[10];
		lfsr_out[15:0] = {lfsr_out[14:0], MSB_in};
		lfsr_final_out = lfsr_out[1:0];
		
		  		if (block5) begin   // if you are within the valid region
            R = 1;
            G = 1;
            B = 1;
        end
		case(lfsr_final_out)
		
		*/
		always @ (posedge clk) begin
		
		 if (block1) begin   // if you are within the valid region
           /* R = R_control;
            G = G_control;
            B = B_control;*/
				 R =0;
            G = 0;
            B = 3;
        end
		  
		else if (block2) begin   // if you are within the valid region
           // R = B_control;
           // B = G_control;
           // G = R_control;
				 R = 3;
            B = 0;
            G = 3;
        end
		  
		  else if (block3) begin   // if you are within the valid region
            R = 3;
            G = 0;
            B = 0;
        end
		  
		 else if (block4) begin   // if you are within the valid region
            R = 0;
            G = 3;
            B = 0;
        end
		  
		  else if (block5) begin   // if you are within the valid region
           /* R = R_control;
            G = G_control;
            B = B_control;*/
				 R =1;
            G = 1;
            B = 1;
        end
		  
		  else if (block6) begin   // if you are within the valid region
           /* R = R_control;
            G = G_control;
            B = B_control;*/
				 R =0;
            G = 0;
            B = 3;
        end
		  
		  else if (block7) begin   // if you are within the valid region
           /* R = R_control;
            G = G_control;
            B = B_control;*/
				 R =3;
            G = 3;
            B = 0;
        end
		  
		  else if (block8) begin   // if you are within the valid region
           /* R = R_control;
            G = G_control;
            B = B_control;*/
				 R =3;
            G = 0;
            B = 0;
        end
		  
		  else if (block9) begin   // if you are within the valid region
           /* R = R_control;
            G = G_control;
            B = B_control;*/
				 R =0;
            G = 3;
            B = 0;
        end
		  
		  else if (block10) begin   // if you are within the valid region
           /* R = R_control;
            G = G_control;
            B = B_control;*/
				 R =0;
            G = 0;
            B = 3;
        end
		  
		  else if (block11) begin   // if you are within the valid region
           /* R = R_control;
            G = G_control;
            B = B_control;*/
				 R =3;
            G = 3;
            B = 0;
        end
		  
		  else if (block12) begin   // if you are within the valid region
           /* R = R_control;
            G = G_control;
            B = B_control;*/
				 R =3;
            G = 0;
            B = 0;
        end
		  
		  else if (block13) begin   // if you are within the valid region
           /* R = R_control;
            G = G_control;
            B = B_control;*/
				 R =0;
            G = 3;
            B = 0;
        end
		  
        else begin  // if you are outside the valid region
            R = 0;
            G = 0;
            B = 0;
        end
		  
		  end	 



//counter c1 (clock,trigger,reset,pointswire);
sevensegmentdisplay seg(clk,trigger,debouncetrigger,rst,AN,seven, red, blue, yellow, green);

endmodule

module sevensegmentdisplay(clock,trigger,debouncetrigger,reset,AN,seven, red, blue, yellow, green, gameover //points1 = out4?
    );
input clock,trigger,debouncetrigger,reset;
output [3:0] AN;
output [6:0] seven;
input yellow;
input red;
input blue;
input green;
input gameover;

wire out1,out2,out3,out5,out7;
wire [15:0] out4;
wire [3:0] out6;
clockdivider2 clk1(clock,out1);
debouncer db1(debouncetrigger,clock,out2);
debouncer db2(trigger,clock,out7);
trigmux t1(out7,out2,out1,out3);
counter c1(clock,out3, reset, out4, red, blue, yellow, green, gameover);
clockdivider cl1(clock,out5);
seven_alternate sa1(out5, reset, out4, out6, AN);
binary_to_segment bs1(out6, seven);
endmodule

module clockdivider2(in_clk, out_clk);
	input in_clk;
	output reg out_clk;
	reg [25:0] count;
	initial begin
	count = 26'b00000000000000000000000000;
	out_clk =0;
	end
	
	always @(posedge in_clk)
		begin
			count <= count + 1'b1;
			if (count >= 26'b10111110101111000010000000)
				out_clk <= 1;
			else
				out_clk <= 0;
		end
endmodule

module debouncer(trigger,clock,clean);
input trigger,clock;
output reg clean;
reg [23:0] counter;

initial begin
clean <=1'b0;
counter <=24'b000000000000000000000000;
end

always@(posedge clock)
begin
if (trigger==1)
	if (counter<24'b111111111111111111111111)
		begin
		clean <=1'b0;
		counter <= counter+1'b1;
		end
	else if (counter == 24'b111111111111111111111111)
		begin
		clean <= 1'b1;
		counter <= 24'b000000000000000000000000;
		end
else
begin
	counter <= 24'b000000000000000000000000;
	clean <= 1'b0;
	end
end

endmodule

module trigmux(trigger,debouncer,clkdivider,out
    );
input trigger,debouncer,clkdivider;
output reg out;

initial begin
out <=0;
end

always @(trigger)
if(trigger)
	begin
		out<=clkdivider;
	end
else
	begin
		out<=debouncer;
	end
endmodule

module counter(clock,trigger,reset,points1, red, blue, yellow, green, gameovercount); //Right one!
//dule counter(clock,trigger,reset,gameovercount, red, blue, yellow, green, points1);

input clock,trigger,reset; 
reg [26:0] count2;
reg [26:0] count3;
reg [26:0] count4;
 input green;
	 input red;
	 input yellow;
	 input blue;
//output reg [15:0] count;
output reg[15:0] points1;
output reg[15:0] gameovercount;
reg slow_game_clk;
reg [10:0]  y;

initial begin
points1 <= 16'b0000000000000000;
gameovercount<=16'b0000000000011111;
end

always @(posedge clock) begin
		
			if (count2 == 1200000)	begin count2 = 0; slow_game_clk = ~slow_game_clk;	end
			
			else begin count2 = count2 + 1;	end
			
			end
		
		/*always @(posedge slow_game_clk) begin
        y = y + 10;
        end
		*/
		
		always @(posedge slow_game_clk) begin

		
		
		if (count4 > 1200) begin
		y = y + 20;
		end
		
		else	
		y = y + 10;
		count4 = count4 + 1;
		end
		
/*		always @(posedge slow_game_clk) begin
		//if (points1 < 16'b0000000000001111) begin
		if (count3 > 50) begin
		y = y + 100;
		end 
		
		else
		y = y + 10;
		count3 = count3 + 1;
		end*/
		
		/*else if (points1 > 16'b0000000000001111) begin
		y = y + 100;
		end*/
		
	 
   /* assign block1 = ~blank & (hcount >= 500 & hcount <= 600 & vcount >= -50 + y& vcount <= 0 + y); //blue
	 assign block2 = ~blank & (hcount >= 340 & hcount <= 440 & vcount >= -650 + y & vcount <= -600 + y); //yelow
	 assign block3 = ~blank & (hcount >= 180 & hcount <= 280 & vcount >= -1050 + y& vcount <= -1000 + y); //red
	 assign block4 = ~blank & (hcount >= 20 & hcount <= 120 & vcount >= -1550 + y & vcount <= -1500 + y); //green
	 
	 
	 assign block6 = ~blank & (hcount >= 500 & hcount <= 600 & vcount >= -1250+ y& vcount <= -1200 + y); //blue
	 assign block7 = ~blank & (hcount >= 340 & hcount <= 440 & vcount >= -850 + y & vcount <= -800 + y); //yellow
	 assign block8 = ~blank & (hcount >= 180 & hcount <= 280 & vcount >= -1450 + y& vcount <= -1400 + y); //red
	 assign block9 = ~blank & (hcount >= 20 & hcount <= 120 & vcount >= -550 + y & vcount <= -500 + y); //green
	 
	 
	 assign block10 = ~blank & (hcount >= 500 & hcount <= 600 & vcount >= -1600 + y & vcount <= -1550 + y); //blie
	 assign block11= ~blank & (hcount >= 340 & hcount <= 440 & vcount >= -450 + y & vcount <= -400 + y); //yellow
	 assign block12= ~blank & (hcount >= 180 & hcount <= 280 & vcount >= -230 + y& vcount <= -180 + y); //red
	 assign block13 = ~blank & (hcount >= 20 & hcount <= 120 & vcount >= -1250 + y & vcount <= -1200 + y); //green

    assign block5 = ~blank & (hcount >= 0 & hcount <= 600 & vcount >= 400 & vcount <= 450)*/
	 
always @ (posedge slow_game_clk) begin
  if (((y > 420 && y < 530) || (y > 1600 && y < 1700) || (y > 1950 && y < 2050)) && (blue))  begin 
	points1 <= points1 + 1'b1;
	
	
	end
	
 else if (((y >1020 && y <1120) || (y > 1220 && y < 1320) || (y > 820 && y < 920)) && (yellow)) begin
	points1 <= points1 + 1'b1;
	
	end
	
else if (((y>1420 && y < 1520) || (y > 1820 && y < 1920) || (y >590 && y <690)) && (red)) begin
	points1 <= points1 + 1'b1;
	
	end
	
else if (((y > 1920 && y < 2020) || (y >920 && y <1020) || (y>1620 && y<1720)) && (green)) begin
	points1 <= points1 + 1'b1;
	
	end
	
	//incorrect button pressed
	else if (((y > 390 && y < 520) || (y > 680 && y < 810) || (y > 1030 && y < 1180)) && ((red)||(yellow)||(green))) begin
	gameovercount = gameovercount - 1;
	end
	
	//incorrect button pressed
	
	else if (((y >990 && y <1120) || (y < 410 && y > 280) || (y < 340 && y > 210)) && ((blue)||(green)||(red))) begin
	gameovercount = gameovercount - 1;
	end
	
	//incorrect button pressed
	else if (((y>1390 && y < 1520) || (y > 880 && y < 1010) || (y >210 && y <340)) && ((green)||(yellow)||(blue))) begin
	gameovercount = gameovercount - 1;
	end
	
	//incorrect button pressed
	else if (((y > 1890 && y < 2020) || (y >990 && y <1040) || (y>680 && y<810)) && ((yellow)||(red)||(blue))) begin
	gameovercount = gameovercount - 1;
	end 
	
	//else if (gameovercount <= 16'b0000000000000000) begin
	//put sprite imag
	

	
	else	begin
	points1 <= points1;
	//trig = 0;
	
	end
end
/////Trigger gameover screen


endmodule

module clockdivider(in_clk, out_clk);
	input in_clk;
	output reg out_clk;
	reg [15:0] count;
	
	initial begin
	out_clk=0;
	end
	
	always @(posedge in_clk)
		begin
			count <= count + 1'b1;
			if (count >= 16'b1100001101010000)
				out_clk <= 1;
			else
				out_clk <= 0;
		end
		
		



		
endmodule

module seven_alternate(clk, reset, big_bin, small_bin, AN
    );
	input clk; // 1kHz clk
	input reset;
	input [15:0] big_bin;
	output reg [3:0] small_bin;
	output reg [3:0] AN;
	reg [1:0] count; // we need to iterate through the displays
	
	initial begin
	small_bin=0;
	AN=0;
	end
	
	always @(posedge clk or posedge reset)
	begin
		if (reset)
		begin
			AN = 0;
			small_bin = 0;
			count = 0;
		end
		else
		begin
			count = count + 1'b1;
			case (count)
				2'b00: begin
					AN = 4'b1110;
					small_bin = big_bin[3:0];
					end
				2'b01: begin
					AN = 4'b1101;
					small_bin = big_bin[7:4];
					end
				2'b10: begin
					AN = 4'b1011;
					small_bin = big_bin[11:8];
					end
				default: begin
					AN = 4'b0111;
					small_bin = big_bin[15:12];
					end
			endcase
		end
	end
endmodule

module binary_to_segment(bin, seven);
input [3:0] bin;
output reg [6:0] seven; 
always @(bin)
begin
case (bin)
4'b0000: seven = 7'b1000000;
4'b0001: seven = 7'b1111001;
4'b0010: seven = 7'b0100100;
4'b0011: seven = 7'b0110000;
4'b0100: seven = 7'b0011001;
4'b0101: seven = 7'b0010010;
4'b0110: seven = 7'b0000010;
4'b0111: seven = 7'b1111000;
4'b1000: seven = 7'b0000000;
4'b1001: seven = 7'b0010000;
4'b1010: seven = 7'b0001000;
4'b1011: seven = 7'b0000011;
4'b1100: seven = 7'b1000110;
4'b1101: seven = 7'b0100001;
4'b1110: seven = 7'b0000110;
default: seven = 7'b0001110;
endcase
end
endmodule

module lfsr(lfsr_out, clk);
output reg [15:0] lfsr_out = 16'b0101010101010101;
input clk; 
reg MSB_in;


always @(posedge clk) begin
MSB_in = lfsr_out[15] ^ lfsr_out[13] ^ lfsr_out[12] ^ lfsr_out[10];
lfsr_out[15:0] = {lfsr_out[14:0], MSB_in};
end
endmodule // End Of Module counter

