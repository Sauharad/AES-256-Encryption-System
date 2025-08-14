`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.01.2025 19:38:16
// Design Name: 
// Module Name: ShiftRows
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


module ShiftRows(input wire [127:0] input_data,
                 output wire [127:0] output_data
                 );
                                  
assign output_data[127:120] /*00*/ = input_data[127:120]; 
assign output_data[119:112] /*10*/  = input_data[87:80];   
assign output_data[111:104] /*20*/  = input_data[47:40];
assign output_data[103:96] /*30*/  = input_data[7:0];
assign output_data[95:88] /*01*/  = input_data[95:88];
assign output_data[87:80] /*11*/  = input_data[55:48];
assign output_data[79:72] /*21*/  = input_data[15:8];
assign output_data[71:64] /*31*/  = input_data[103:96];
assign output_data[63:56] /*02*/  = input_data[63:56];
assign output_data[55:48] /*12*/  = input_data[23:16];
assign output_data[47:40] /*22*/  = input_data[111:104];
assign output_data[39:32] /*32*/  = input_data[71:64];
assign output_data[31:24] /*03*/  = input_data[31:24];
assign output_data[23:16] /*13*/  = input_data[119:112];
assign output_data[15:8] /*23*/  = input_data[79:72];
assign output_data[7:0] /*33*/  = input_data[39:32];

endmodule
