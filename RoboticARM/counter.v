`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:30:13 01/11/2022 
// Design Name: 
// Module Name:    counter 
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
module counter(
input btnu,
input btnd,
input rst,
input clk,

output [10:0] led
    );
	 clk_divider clkd (clk, clkout);
	 reg [10:0] counter;
	 assign led = counter;
	 
	 always @ (posedge clkout)
		begin
			if(rst) begin
				counter <=8'b0;
				end
						if (btnu) begin
				counter <= counter + 8'b1111;
				end
			if (btnd) begin
				counter <= counter - 8'b1111;
				end
		end
	 


endmodule
