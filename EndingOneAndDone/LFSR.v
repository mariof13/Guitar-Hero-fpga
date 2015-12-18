`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:45:03 12/13/2015 
// Design Name: 
// Module Name:    LFSR 
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
module lfsr(lfsr_out,  lfsr_in , clk);
output reg [15:0] lfsr_out = 16'b0101010101010101;
input [15:0] lfsr_in;
input clk; 
reg MSB_in;
//lfsr_out[15:0] = lfsr_in[15:0];

/*initial begin
lfsr_out[15:0] = lfsr_in[15:0];
end*/

always @(posedge clk) begin
MSB_in = lfsr_out[15] ^ lfsr_out[13] ^ lfsr_out[12] ^ lfsr_out[10];
lfsr_out[15:0] = {lfsr_out[14:0], MSB_in};
end
endmodule // End Of Module counter
