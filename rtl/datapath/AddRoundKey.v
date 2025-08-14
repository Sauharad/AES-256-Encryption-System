`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2025 19:12:50
// Design Name: 
// Module Name: AddRoundKey
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


module AddRoundKey(input wire [127:0] input_data, 
                   input wire [127:0] round_key,
                   output wire [127:0] output_data);

assign output_data[127:120] = input_data[127:120] ^ round_key[127:120];
assign output_data[119:112] = input_data[119:112] ^ round_key[119:112];
assign output_data[111:104] = input_data[111:104] ^ round_key[111:104];
assign output_data[103:96] = input_data[103:96] ^ round_key[103:96];
assign output_data[95:88] = input_data[95:88] ^ round_key[95:88];
assign output_data[87:80] = input_data[87:80] ^ round_key[87:80];
assign output_data[79:72] = input_data[79:72] ^ round_key[79:72];
assign output_data[71:64] = input_data[71:64] ^ round_key[71:64];
assign output_data[63:56] = input_data[63:56] ^ round_key[63:56];
assign output_data[55:48] = input_data[55:48] ^ round_key[55:48];
assign output_data[47:40] = input_data[47:40] ^ round_key[47:40];
assign output_data[39:32] = input_data[39:32] ^ round_key[39:32];
assign output_data[31:24] = input_data[31:24] ^ round_key[31:24];
assign output_data[23:16] = input_data[23:16] ^ round_key[23:16];
assign output_data[15:8] = input_data[15:8] ^ round_key[15:8];
assign output_data[7:0] = input_data[7:0] ^ round_key[7:0];


endmodule
