`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2025 19:35:24
// Design Name: 
// Module Name: SubWord
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


module SubWord(input wire [31:0] input_word,
               output wire [31:0] output_word
               );
               
s_box mysbox(input_word[31:24],output_word[31:24]);
s_box mysbox2(input_word[23:16],output_word[23:16]);
s_box mysbox3(input_word[15:8],output_word[15:8]);
s_box mysbox4(input_word[7:0],output_word[7:0]);

endmodule
