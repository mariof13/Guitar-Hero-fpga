//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:         Boston University
// Engineer:        The EC311 K3wl K1dz
//
// Create Date:     11/18/2015
// Design Name:     EC311 Support Files
// Module Name:     seven_alternate
// Project Name:    Lab4 / Project
// Description:     This module takes a 16-bit binary and releases it in chunks of
//                  4-bits (nibbles) while synchronizing them with the AN signal.
//                  This file is to be used with 7-segment LED 4-displays
//
// Dependencies: 
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
/*
module seven_alternate (big_bin, small_bin, AN, clk);
    input[15:0] big_bin;        // This receives a huge 16 bit number
    output reg [3:0] small_bin; // And returns one 4-bit number at a time (this goes into bin2bcd7)
    output reg [3:0] AN;        // While synchronizing it with the Anode signal
    input clk;                  // 1kHz clk

    //Anode - Positive charged electrode by which electrons leave.


    reg [1:0] count;            // we need to iterate through the displays

    initial begin // Initial block, used for correct simulations    
        AN = 0;
        small_bin = 0;  
        count= 0;
    end

    always @ (posedge clk) begin
        count= count+ 1'b1;
        case (count)
            0: begin
                AN = 4'b1110;
                small_bin = big_bin[3:0];
            end
            1: begin
                AN = 4'b1101;
                small_bin = big_bin[7:4];
            end
            2: begin
               AN = 4'b1100;
               small_bin = big_bin[11:8];
            end
            3: begin
               AN = 4'b1011;
               small_bin = big_bin[15:12];
            end
         default: AN = 4'b1111;
        endcase
    end
endmodule

module mux_4_1(y, a0,a1,a2,a3, s0, s1);

input [7:0] a0, a1,a2, a3;
input s0, s1; // s0 most significant bit 
output reg [7:0] y; 

always @* begin
case ({s0, s1})
	2'b00:	y = a0;
	2'b01:	y = a1;
	2'b10:	y = a2;
	2'b11: 	y = a3;
endcase
end 


endmodule

*/

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    18:49:11 04/27/2015
// Design Name:
// Module Name:    trigmux
// Project Name:
// Target Devices:
// Tool versions:
// Description: 
//
// Dependencies:
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module mux_4_1(trigger,debouncer,clkdivider,out
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

