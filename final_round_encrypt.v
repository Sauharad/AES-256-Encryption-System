`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.01.2025 20:57:27
// Design Name: 
// Module Name: final_round_encrypt
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


module final_round_encrypt(input wire [127:0] final_input_data,
                           input wire [127:0] final_round_key,
                           output reg [127:0] final_output_data,
                           input wire sys_clk);
                         
                         
wire [127:0] subbytes_to_shiftrows,shiftrows_to_addroundkey,addroundkey_to_output;                           

SubBytes finalsubbytes(.input_data(final_input_data),
                       .output_data(subbytes_to_shiftrows));
                       
ShiftRows finalshiftrows(.input_data(subbytes_to_shiftrows),
                         .output_data(shiftrows_to_addroundkey));
                         
AddRoundKey finaladdroundkey(.input_data(shiftrows_to_addroundkey),
                             .round_key(final_round_key),
                             .output_data(addroundkey_to_output));

always @(posedge sys_clk)
    final_output_data <= addroundkey_to_output;

endmodule
