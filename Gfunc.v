`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2025 19:59:39
// Design Name: 
// Module Name: Gfunc
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


module Gfunc(input wire [31:0] input_word,
             output reg [31:0] output_word,
             input wire [31:0] rcon,
             input wire sys_clk);
             
wire [31:0] temp,temp2,output_store;

RotWord myrotword(input_word,temp);
SubWord mysubword(temp,temp2);

assign output_store = temp2 ^ rcon;

always @(posedge sys_clk)
    output_word <= output_store;    
    
endmodule
