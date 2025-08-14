`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2025 19:08:13
// Design Name: 
// Module Name: SubBytes
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

module SubBytes(input wire [127:0] input_data,
                output wire [127:0] output_data);
                
s_box box1(input_data[127:120],output_data[127:120]);
s_box box2(input_data[119:112],output_data[119:112]);
s_box box3(input_data[111:104],output_data[111:104]);
s_box box4(input_data[103:96],output_data[103:96]);
s_box box5(input_data[95:88],output_data[95:88]);
s_box box6(input_data[87:80],output_data[87:80]);
s_box box7(input_data[79:72],output_data[79:72]);
s_box box8(input_data[71:64],output_data[71:64]);
s_box box9(input_data[63:56],output_data[63:56]);
s_box box10(input_data[55:48],output_data[55:48]);
s_box box11(input_data[47:40],output_data[47:40]);
s_box box12(input_data[39:32],output_data[39:32]);
s_box box13(input_data[31:24],output_data[31:24]);
s_box box14(input_data[23:16],output_data[23:16]);
s_box box15(input_data[15:8],output_data[15:8]);
s_box box16(input_data[7:0],output_data[7:0]);


endmodule
