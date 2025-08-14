`timescale 1ns / 1ps

module aes_toplevel(input wire [127:0] aes_input_data,
                    input wire [255:0] aes_key,
                    input wire [127:0] initialization_vector,
                    input wire SYSCLK_P,
                    input wire SYSCLK_N, 
                    output wire [127:0] aes_output_data);

//Converting Differential Clock Input from On-Board Clock to Single-Ended
wire sys_clk;
IBUFDS #(.DIFF_TERM("TRUE"),.IBUF_LOW_PWR("FALSE"),.IOSTANDARD("LVDS_25")) 
myibufds (.O(sys_clk),.I(SYSCLK_P),.IB(SYSCLK_N));

//Connection of AES Key Scheduling/Generation Block and Data Encryption Block                    
wire [127:0] keyi,key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,keyf; 
                   
AES_keygen myaeskeygen(.aes_key(aes_key),
                        .sys_clk(sys_clk),
                        .key_initial(keyi),
                        .key_round1(key1),
                        .key_round2(key2),
                        .key_round3(key3),
                        .key_round4(key4),
                        .key_round5(key5),
                        .key_round6(key6),
                        .key_round7(key7),
                        .key_round8(key8),
                        .key_round9(key9),
                        .key_round10(key10),
                        .key_round11(key11),
                        .key_round12(key12),
                        .key_round13(key13),
                        .key_finalround(keyf));
                                            
AES_datapath myaesdatapath(.input_data(aes_input_data),
                           .output_data(aes_output_data),
                           .sys_clk(sys_clk),
                           .key_initial(keyi),
                           .key_round1(key1),
                           .key_round2(key2),
                           .key_round3(key3),
                           .key_round4(key4),
                           .key_round5(key5),
                           .key_round6(key6),
                           .key_round7(key7),
                           .key_round8(key8),
                           .key_round9(key9),
                           .key_round10(key10),
                           .key_round11(key11),
                           .key_round12(key12),
                           .key_round13(key13),
                           .key_finalround(keyf));
                  
endmodule
