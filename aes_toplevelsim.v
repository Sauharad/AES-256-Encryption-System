`timescale 1ns / 1ps

//Test Vectors from the official AES 256 documentation have been picked up to check the correctness of encryption

module aes_toplevelsim;

reg [255:0] aes_key = 256'h603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4;
reg clk_P,clk_N;
reg [127:0] input_data;
wire [127:0] out;



aes_toplevel myaes(.aes_input_data(input_data),
                   .aes_key(aes_key),
                   .SYSCLK_P(clk_P),
                   .SYSCLK_N(clk_N),
                   .aes_output_data(out));

//These are the outputs that should be produced if encryption is correct
wire [127:0] cipher1 = 128'hf3eed1bdb5d2a03c064b5a7e3db181f8;
wire [127:0] cipher2 = 128'h591ccb10d410ed26dc5ba74a31362870;
wire [127:0] cipher3 = 128'hb6ed21b99ca6f4f9f153e7b1beafed1d;
wire [127:0] cipher4 = 128'h23304b7a39f9f3ff067d8d8f9e24ecc7;

wire check_out_1 = (out == cipher1);
wire check_out_2 = (out == cipher2);
wire check_out_3 = (out == cipher3);
wire check_out_4 = (out == cipher4);


initial
begin
    clk_P = 1'b0; 
    forever #2.5 clk_P = ~clk_P;
end

initial
begin
    clk_N = 1'b1;
    forever #2.5 clk_N = ~clk_N;
end

initial
begin
    #4.5 input_data = 128'h6BC1BEE22E409F96E93D7E117393172A;
    #5 input_data = 128'hae2d8a571e03ac9c9eb76fac45af8e51;
    #5 input_data = 128'h30c81c46a35ce411e5fbc1191a0a52ef;
    #5 input_data = 128'hf69f2445df4f9b17ad2b417be66c3710;
    
    #200 $finish;
end
endmodule
