`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.01.2025 20:28:11
// Design Name: 
// Module Name: round_encrypt
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

module round_encrypt(input wire [127:0] round_input_data,
                     input wire [127:0] round_key,
                     output reg [127:0] round_output_data,
                     input wire sys_clk);

wire [127:0] addroundkey_to_output;                     
wire [127:0] subbytes_to_shiftrows,shiftrows_to_mixcolumns,mixcolumns_to_addroundkey;

SubBytes subbytes(.input_data(round_input_data),
                  .output_data(subbytes_to_shiftrows));
                  
ShiftRows shiftrows(.input_data(subbytes_to_shiftrows),
                    .output_data(shiftrows_to_mixcolumns));
                    
MixColumns mixcolumns(.input_data(shiftrows_to_mixcolumns),
                      .output_data(mixcolumns_to_addroundkey));
                      
AddRoundKey addroundkey(.input_data(mixcolumns_to_addroundkey),
                        .round_key(round_key),
                        .output_data(addroundkey_to_output));

always @(posedge sys_clk)
    round_output_data <= addroundkey_to_output;

endmodule
