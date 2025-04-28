`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.01.2025 21:00:39
// Design Name: 
// Module Name: AES_datapath
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

module AES_datapath(input wire [127:0] input_data,
                    input wire [127:0] initialization_vector,
                    output reg [127:0] output_data,
                    input wire sys_clk,
                    input wire [127:0] key_initial,
                    input wire [127:0] key_round1,
                    input wire [127:0] key_round2,
                    input wire [127:0] key_round3,
                    input wire [127:0] key_round4,
                    input wire [127:0] key_round5,
                    input wire [127:0] key_round6,
                    input wire [127:0] key_round7,
                    input wire [127:0] key_round8,
                    input wire [127:0] key_round9,
                    input wire [127:0] key_round10,
                    input wire [127:0] key_round11,
                    input wire [127:0] key_round12,
                    input wire [127:0] key_round13,
                    input wire [127:0] key_finalround);
 
wire [127:0] init_to_r1,r1_to_r2,r2_to_r3,r3_to_r4,r4_to_r5,r5_to_r6,r6_to_r7,r7_to_r8,r8_to_r9,
r9_to_r10,r10_to_r11,r11_to_r12,r12_to_r13,r13_to_rfinal,rfinal_to_output;                    
reg [127:0] initial_round_load;

always @(posedge sys_clk)
    initial_round_load <= input_data;

initial_round round_initial(.initial_round_input(initial_round_load),
                            .initial_key(key_initial),
                            .initial_round_output(init_to_r1),
                            .sys_clk(sys_clk));

round_encrypt round1(.round_input_data(init_to_r1),
                     .round_key(key_round1),
                     .round_output_data(r1_to_r2),
                     .sys_clk(sys_clk));
                     
round_encrypt round2(.round_input_data(r1_to_r2),
                     .round_key(key_round2),
                     .round_output_data(r2_to_r3),
                     .sys_clk(sys_clk));        
                                                    
round_encrypt round3(.round_input_data(r2_to_r3),
                     .round_key(key_round3),
                     .round_output_data(r3_to_r4),
                     .sys_clk(sys_clk));
                     
round_encrypt round4(.round_input_data(r3_to_r4),
                     .round_key(key_round4),
                     .round_output_data(r4_to_r5),
                     .sys_clk(sys_clk));       
                                                     
round_encrypt round5(.round_input_data(r4_to_r5),
                     .round_key(key_round5),
                     .round_output_data(r5_to_r6),
                     .sys_clk(sys_clk));          
                                                  
round_encrypt round6(.round_input_data(r5_to_r6),
                     .round_key(key_round6),
                     .round_output_data(r6_to_r7),
                     .sys_clk(sys_clk));          
                                                  
round_encrypt round7(.round_input_data(r6_to_r7),
                     .round_key(key_round7),
                     .round_output_data(r7_to_r8),
                     .sys_clk(sys_clk));          
                                                  
round_encrypt round8(.round_input_data(r7_to_r8),
                     .round_key(key_round8),
                     .round_output_data(r8_to_r9),
                     .sys_clk(sys_clk));          
                                                  
round_encrypt round9(.round_input_data(r8_to_r9),
                     .round_key(key_round9),
                     .round_output_data(r9_to_r10),
                     .sys_clk(sys_clk));          
                                                  
round_encrypt round10(.round_input_data(r9_to_r10),
                      .round_key(key_round10),
                      .round_output_data(r10_to_r11),
                      .sys_clk(sys_clk));            
                                                 
round_encrypt round11(.round_input_data(r10_to_r11),
                      .round_key(key_round11),
                      .round_output_data(r11_to_r12),
                      .sys_clk(sys_clk));           
                                                  
round_encrypt round12(.round_input_data(r11_to_r12),
                      .round_key(key_round12),
                      .round_output_data(r12_to_r13),
                      .sys_clk(sys_clk));        
                                                     
round_encrypt round13(.round_input_data(r12_to_r13),
                      .round_key(key_round13),
                      .round_output_data(r13_to_rfinal),
                      .sys_clk(sys_clk));
                                       
final_round_encrypt final_round(.final_input_data(r13_to_rfinal),
                                .final_round_key(key_finalround),
                                .final_output_data(rfinal_to_output),
                                .sys_clk(sys_clk)); 

always @(posedge sys_clk)
    output_data <= rfinal_to_output;                                      
                   
endmodule
