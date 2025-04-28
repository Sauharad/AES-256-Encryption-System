`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2025 20:24:28
// Design Name: 
// Module Name: roundkey_generator
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


module roundkey_generator #(parameter roundi=8)(input wire [31:0] input_word1,
                                                input wire [31:0] input_word2,
                                                output wire [31:0] output_word,
                                                input wire [31:0] rcon,
                                                input wire sys_clk);
                                                
wire [31:0] temp1,temp2;
wire [31:0] output_store;

generate
    if ((roundi % 8) == 0)
        begin: gfunc_gen
            Gfunc mygfunc(input_word1,temp1,rcon,sys_clk);
            assign output_word = temp1^input_word2;
        end
    else if (((roundi % 8) == 4) && ((roundi % 8)) != 0)
        begin: subword_gen
            SubWord2 mysubword(input_word1,temp2,sys_clk);
            assign output_word = temp2 ^ input_word2;
            
        end
    else
        assign output_word = input_word1 ^ input_word2;
        
endgenerate        



endmodule
