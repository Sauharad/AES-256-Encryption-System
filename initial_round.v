`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.01.2025 21:14:04
// Design Name: 
// Module Name: initial_round
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module initial_round(input wire [127:0] initial_round_input,
                     input wire [127:0] initial_key,
                     output reg [127:0] initial_round_output,
                     input wire sys_clk);
                     
always @(posedge sys_clk)
    initial_round_output <= initial_round_input ^ initial_key;
                     
endmodule
