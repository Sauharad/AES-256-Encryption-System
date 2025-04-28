`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2025 20:46:37
// Design Name: 
// Module Name: SubWord2
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


module SubWord2(input wire [31:0] input_word,
               output reg [31:0] output_word,
               input wire sys_clk
               );

wire [31:0] output_drive;
               
s_box mysbox(input_word[31:24],output_drive[31:24]);
s_box mysbox2(input_word[23:16],output_drive[23:16]);
s_box mysbox3(input_word[15:8],output_drive[15:8]);
s_box mysbox4(input_word[7:0],output_drive[7:0]);

always @(posedge sys_clk)
    output_word <= output_drive;
    
endmodule
