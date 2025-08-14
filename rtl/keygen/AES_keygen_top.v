`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2025 15:20:44
// Design Name: 
// Module Name: AES_keygen
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

module AES_keygen(input wire [255:0] aes_key,
                  input wire sys_clk,
                  output wire [127:0] key_initial,
                  output wire [127:0] key_round1,
                  output wire [127:0] key_round2,
                  output wire [127:0] key_round3,
                  output wire [127:0] key_round4,
                  output wire [127:0] key_round5,
                  output wire [127:0] key_round6,
                  output wire [127:0] key_round7,
                  output wire [127:0] key_round8,
                  output wire [127:0] key_round9,
                  output wire [127:0] key_round10,
                  output wire [127:0] key_round11,
                  output wire [127:0] key_round12,
                  output wire [127:0] key_round13,
                  output wire [127:0] key_finalround);

//The AES Key is stored in the module for 8 cycles to ensure all round keys are generated and then destroyed
reg [7:0] counter = 8'h000; reg flag = 0;
reg [255:0] key_store_temp;
reg [31:0] mywords [0:7];

//4 Words are combined to form the key for one round of encryption
wire [31:0] words [0:59];

assign words[0] = mywords[0]; assign words[1] = mywords[1]; 
assign words[2] = mywords[2]; assign words[3] = mywords[3];
assign words[4] = mywords[4]; assign words[5] = mywords[5]; 
assign words[6] = mywords[6]; assign words[7] = mywords[7];

assign key_initial = {words[0],words[1],words[2],words[3]}; assign key_round1 = {words[4],words[5],words[6],words[7]};
assign key_round2 = {words[8],words[9],words[10],words[11]}; assign key_round3 = {words[12],words[13],words[14],words[15]};
assign key_round4 = {words[16],words[17],words[18],words[19]}; assign key_round5 = {words[20],words[21],words[22],words[23]};
assign key_round6 = {words[24],words[25],words[26],words[27]}; assign key_round7 = {words[28],words[29],words[30],words[31]};
assign key_round8 = {words[32],words[33],words[34],words[35]}; assign key_round9 = {words[36],words[37],words[38],words[39]};
assign key_round10 = {words[40],words[41],words[42],words[43]}; assign key_round11 = {words[44],words[45],words[46],words[47]};
assign key_round12 = {words[48],words[49],words[50],words[51]}; assign key_round13 = {words[52],words[53],words[54],words[55]};
assign key_finalround = {words[56],words[57],words[58],words[59]}; 

wire [31:0] rcon1 = 32'h01000000, rcon2 = 32'h02000000, rcon3 = 32'h04000000,
rcon4 = 32'h08000000, rcon5 = 32'h10000000, rcon6 = 32'h20000000, rcon7 = 32'h40000000;

always @(posedge sys_clk)
    begin
        if (counter != 7 && !flag)
            begin
                counter <= counter + 1;
                key_store_temp <= aes_key;
                mywords[0] <= key_store_temp[255:224];
                mywords[1] <= key_store_temp[223:192];
                mywords[2] <= key_store_temp[191:160];
                mywords[3] <= key_store_temp[159:128];
                mywords[4] <= key_store_temp[127:96];
                mywords[5] <= key_store_temp[95:64];
                mywords[6] <= key_store_temp[63:32];
                mywords[7] <= key_store_temp[31:0];
            end
        else
            begin
                counter <= 0;
                flag <= 1;
                key_store_temp <= 0;
            end
    end

//Key generation module. Generate blocks used as word generation depends on its index
genvar i;   
generate
    for (i=8;i<60;i=i+1)
        begin: key_generators 
            if (i == 8)
                roundkey_generator #(i) mygen1(words[i-1],words[i-8],words[i],rcon1,sys_clk);
            else if (i == 16)
                roundkey_generator #(i) mygen2(words[i-1],words[i-8],words[i],rcon2,sys_clk);
            else if (i == 24)
                roundkey_generator #(i) mygen3(words[i-1],words[i-8],words[i],rcon3,sys_clk);
            else if (i == 32)
                roundkey_generator #(i) mygen4(words[i-1],words[i-8],words[i],rcon4,sys_clk);
            else if (i == 40)
                roundkey_generator #(i) mygen5(words[i-1],words[i-8],words[i],rcon5,sys_clk);
            else if (i == 48)
                roundkey_generator #(i) mygen6(words[i-1],words[i-8],words[i],rcon6,sys_clk);
            else if (i == 56)
                roundkey_generator #(i) mygen7(words[i-1],words[i-8],words[i],rcon7,sys_clk);
            else
                roundkey_generator #(i) mygen8(words[i-1],words[i-8],words[i],rcon1,sys_clk);
        end
endgenerate    
    
    
    
endmodule
