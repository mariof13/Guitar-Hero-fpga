`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:04:50 12/08/2015
// Design Name:   vga_display
// Module Name:   X:/EC311 Project/Given/EC311_GritarHero/Colortest.v
// Project Name:  EC311_GritarHero
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vga_display
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Colortest;

	// Inputs
	reg rst;
	reg clk;
	reg [2:0] R_control;
	reg [2:0] G_control;
	reg [1:0] B_control;

	// Outputs
	wire [2:0] R;
	wire [2:0] G;
	wire [1:0] B;
	wire HS;
	wire VS;

	// Instantiate the Unit Under Test (UUT)
	vga_display uut (
		.rst(rst), 
		.clk(clk), 
		.R(R), 
		.G(G), 
		.B(B), 
		.HS(HS), 
		.VS(VS), 
		.R_control(R_control), 
		.G_control(G_control), 
		.B_control(B_control)
	);

	initial begin
		// Initialize Inputs
		rst = 0;
		clk = 0;
		R_control = 0;
		G_control = 0;
		B_control = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

