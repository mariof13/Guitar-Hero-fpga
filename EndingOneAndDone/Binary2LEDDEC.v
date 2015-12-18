//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:         Boston University
// Engineer:        The EC311 Kewl Kidz
// 
// Create Date:     11/18/2015
// Design Name:     EC311 Support Files
// Module Name:     binary_to_segment
// Project Name:    Lab4 / Project
// Description:
//                  This module receives a 4-bit input and converts it to 7-segment
//                  LED (HEX)
//
// Dependencies:
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: INCOMPLETE CODE
//
//////////////////////////////////////////////////////////////////////////////////
/*
module binary_to_segment(bin,seven);
input [3:0] bin;
output reg [6:0] seven; //Assume MSB is A, and LSB is G 

initial //Initial block, used for correct simulations   
    seven=0;

always @ (*)
    case(bin)   //Input the output cathode values for the led
        4'b0000:  seven = 7'b0000001;//  Some code here
        4'b0001:  seven = 7'b1001111;//  and here
        4'b0010:  seven = 7'b0010010;  //  .........
        4'b0011:  seven = 7'b0000110;
        4'b0100:  seven = 7'b1001100;
        4'b0101:  seven = 7'b0100100;
        4'b0110:  seven = 7'b0100000;
        4'b0111:  seven = 7'b0001111;
        4'b1000:  seven = 7'b0000000;
        4'b1001:  seven = 7'b0000100;
		  4'b0000:  seven = 7'b0000001;
        4'b0001:  seven = 7'b1001111;
        4'b0010:  seven = 7'b0010010; 
        4'b0011:  seven = 7'b0000110;
        4'b0100:  seven = 7'b1001100;
        4'b0101:  seven = 7'b0100100;
        //remember 0 means 'light-up'
        default: seven= 7'b1111110;//Something here. Mario: I'm making everything go dark except the dark.
    endcase
endmodule*/