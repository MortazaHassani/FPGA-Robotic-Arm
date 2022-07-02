`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:46:03 01/11/2022 
// Design Name: 
// Module Name:    ServoR 
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
module servo_controller (
	input btnu,
	input btnd,
	input rst,
  input clk,
  input [2:0] sw,
  output reg [3:0]servos
  );
  wire [10:0] position;
  integer i;
  always @(sw)
	begin
		case (sw)
			3'b001: begin
							//counter servobase (btnu,btnd,rst,clk,positions2);
							//assign position = positions2;
							servos[1] = pwm_q;
						end
			3'b011: begin
							//counter servobase (btnu,btnd,rst,clk,positions3);
							//assign position = positions3;
							servos[2] = pwm_q;
						end
			3'b111: begin
							//counter servobase (btnu,btnd,rst,clk,positions4);
							//assign position = positions4;
							servos[3] = pwm_q;
						end
			default: begin
							//counter servobase (btnu,btnd,rst,clk,positions1);
							//assign position = positions1;
							servos[0] = pwm_q;
						end
		endcase
	end
		counter servobase (btnu,btnd,rst,clk,position);
  reg pwm_q, pwm_d;
  reg [19:0] ctr_q, ctr_d;
  //assign servo = pwm_q;
  //position (0-255) maps to 50,000-100,000 (which corresponds to 1ms-2ms @ 50MHz)
  //this is approximately (position+165)<<8
  //The servo output is set by comparing the position input with the value of the counter (ctr_q)
  always @(*) begin
    ctr_d = ctr_q + 1'b1;
    if (position + 9'd165 > ctr_q[19:8]) begin
      pwm_d = 1'b1;
    end else begin
      pwm_d = 1'b0;
    end
  end
	
  always @(posedge clk) begin
    if (rst) begin
      ctr_q <= 1'b0;
    end else begin
      ctr_q <= ctr_d;
    end
    pwm_q <= pwm_d;
  end
endmodule
