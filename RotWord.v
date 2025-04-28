`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2025 19:44:11
// Design Name: 
// Module Name: RotWord
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


module RotWord(input wire [31:0] input_word,
               output wire [31:0] output_word);

assign output_word = {input_word[23:16],input_word[15:8],input_word[7:0],input_word[31:24]};               

endmodule
