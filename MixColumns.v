`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.01.2025 20:10:12
// Design Name: 
// Module Name: MixColumns
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

module MixColumns(input wire [127:0] input_data,
                  output wire [127:0] output_data);
                  
wire [7:0] rijndael_multiplyby2_lookup [0:255];

assign rijndael_multiplyby2_lookup[0] = 8'h00,    rijndael_multiplyby2_lookup[1] = 8'h02;   
assign rijndael_multiplyby2_lookup[2] = 8'h04,   rijndael_multiplyby2_lookup[3] = 8'h06;
assign rijndael_multiplyby2_lookup[4] = 8'h08,    rijndael_multiplyby2_lookup[5] = 8'h0A;   
assign rijndael_multiplyby2_lookup[6] = 8'h0C,   rijndael_multiplyby2_lookup[7] = 8'h0E;
assign rijndael_multiplyby2_lookup[8] = 8'h10,    rijndael_multiplyby2_lookup[9] = 8'h12;   
assign rijndael_multiplyby2_lookup[10] = 8'h14,   rijndael_multiplyby2_lookup[11] = 8'h16;
assign rijndael_multiplyby2_lookup[12] = 8'h18,    rijndael_multiplyby2_lookup[13] = 8'h1A;   
assign rijndael_multiplyby2_lookup[14] = 8'h1C,   rijndael_multiplyby2_lookup[15] = 8'h1E;

assign rijndael_multiplyby2_lookup[16] = 8'h20,    rijndael_multiplyby2_lookup[17] = 8'h22;   
assign rijndael_multiplyby2_lookup[18] = 8'h24,   rijndael_multiplyby2_lookup[19] = 8'h26;
assign rijndael_multiplyby2_lookup[20] = 8'h28,    rijndael_multiplyby2_lookup[21] = 8'h2A;   
assign rijndael_multiplyby2_lookup[22] = 8'h2C,   rijndael_multiplyby2_lookup[23] = 8'h2E;
assign rijndael_multiplyby2_lookup[24] = 8'h30,    rijndael_multiplyby2_lookup[25] = 8'h32;  
assign rijndael_multiplyby2_lookup[26] = 8'h34,   rijndael_multiplyby2_lookup[27] = 8'h36;
assign rijndael_multiplyby2_lookup[28] = 8'h38,    rijndael_multiplyby2_lookup[29] = 8'h3A;   
assign rijndael_multiplyby2_lookup[30] = 8'h3C,   rijndael_multiplyby2_lookup[31] = 8'h3E;

assign rijndael_multiplyby2_lookup[32] = 8'h40,    rijndael_multiplyby2_lookup[33] = 8'h42;   
assign rijndael_multiplyby2_lookup[34] = 8'h44,   rijndael_multiplyby2_lookup[35] = 8'h46;
assign rijndael_multiplyby2_lookup[36] = 8'h48,    rijndael_multiplyby2_lookup[37] = 8'h4A;   
assign rijndael_multiplyby2_lookup[38] = 8'h4C,   rijndael_multiplyby2_lookup[39] = 8'h4E;
assign rijndael_multiplyby2_lookup[40] = 8'h50,    rijndael_multiplyby2_lookup[41] = 8'h52;   
assign rijndael_multiplyby2_lookup[42] = 8'h54,   rijndael_multiplyby2_lookup[43] = 8'h56;
assign rijndael_multiplyby2_lookup[44] = 8'h58,    rijndael_multiplyby2_lookup[45] = 8'h5A;   
assign rijndael_multiplyby2_lookup[46] = 8'h5C,   rijndael_multiplyby2_lookup[47] = 8'h5E;

assign rijndael_multiplyby2_lookup[48] = 8'h60,    rijndael_multiplyby2_lookup[49] = 8'h62;   
assign rijndael_multiplyby2_lookup[50] = 8'h64,   rijndael_multiplyby2_lookup[51] = 8'h66;
assign rijndael_multiplyby2_lookup[52] = 8'h68,    rijndael_multiplyby2_lookup[53] = 8'h6A;   
assign rijndael_multiplyby2_lookup[54] = 8'h6C,   rijndael_multiplyby2_lookup[55] = 8'h6E;
assign rijndael_multiplyby2_lookup[56] = 8'h70,    rijndael_multiplyby2_lookup[57] = 8'h72;   
assign rijndael_multiplyby2_lookup[58] = 8'h74,   rijndael_multiplyby2_lookup[59] = 8'h76;
assign rijndael_multiplyby2_lookup[60] = 8'h78,    rijndael_multiplyby2_lookup[61] = 8'h7A;   
assign rijndael_multiplyby2_lookup[62] = 8'h7C,   rijndael_multiplyby2_lookup[63] = 8'h7E;

assign rijndael_multiplyby2_lookup[64] = 8'h80,    rijndael_multiplyby2_lookup[65] = 8'h82;   
assign rijndael_multiplyby2_lookup[66] = 8'h84,   rijndael_multiplyby2_lookup[67] = 8'h86;
assign rijndael_multiplyby2_lookup[68] = 8'h88,    rijndael_multiplyby2_lookup[69] = 8'h8A;   
assign rijndael_multiplyby2_lookup[70] = 8'h8C,   rijndael_multiplyby2_lookup[71] = 8'h8E;
assign rijndael_multiplyby2_lookup[72] = 8'h90,    rijndael_multiplyby2_lookup[73] = 8'h92;   
assign rijndael_multiplyby2_lookup[74] = 8'h94,   rijndael_multiplyby2_lookup[75] = 8'h96;
assign rijndael_multiplyby2_lookup[76] = 8'h98,    rijndael_multiplyby2_lookup[77] = 8'h9A;   
assign rijndael_multiplyby2_lookup[78] = 8'h9C,   rijndael_multiplyby2_lookup[79] = 8'h9E;

assign rijndael_multiplyby2_lookup[80] = 8'hA0,    rijndael_multiplyby2_lookup[81] = 8'hA2;   
assign rijndael_multiplyby2_lookup[82] = 8'hA4,   rijndael_multiplyby2_lookup[83] = 8'hA6;
assign rijndael_multiplyby2_lookup[84] = 8'hA8,    rijndael_multiplyby2_lookup[85] = 8'hAA;   
assign rijndael_multiplyby2_lookup[86] = 8'hAC,   rijndael_multiplyby2_lookup[87] = 8'hAE;
assign rijndael_multiplyby2_lookup[88] = 8'hB0,    rijndael_multiplyby2_lookup[89] = 8'hB2;   
assign rijndael_multiplyby2_lookup[90] = 8'hB4,   rijndael_multiplyby2_lookup[91] = 8'hB6;
assign rijndael_multiplyby2_lookup[92] = 8'hB8,    rijndael_multiplyby2_lookup[93] = 8'hBA;   
assign rijndael_multiplyby2_lookup[94] = 8'hBC,   rijndael_multiplyby2_lookup[95] = 8'hBE;

assign rijndael_multiplyby2_lookup[96] = 8'hC0,    rijndael_multiplyby2_lookup[97] = 8'hC2;   
assign rijndael_multiplyby2_lookup[98] = 8'hC4,   rijndael_multiplyby2_lookup[99] = 8'hC6;
assign rijndael_multiplyby2_lookup[100] = 8'hC8,    rijndael_multiplyby2_lookup[101] = 8'hCA;   
assign rijndael_multiplyby2_lookup[102] = 8'hCC,   rijndael_multiplyby2_lookup[103] = 8'hCE;
assign rijndael_multiplyby2_lookup[104] = 8'hD0,    rijndael_multiplyby2_lookup[105] = 8'hD2;   
assign rijndael_multiplyby2_lookup[106] = 8'hD4,   rijndael_multiplyby2_lookup[107] = 8'hD6;
assign rijndael_multiplyby2_lookup[108] = 8'hD8,    rijndael_multiplyby2_lookup[109] = 8'hDA;   
assign rijndael_multiplyby2_lookup[110] = 8'hDC,   rijndael_multiplyby2_lookup[111] = 8'hDE;

assign rijndael_multiplyby2_lookup[112] = 8'hE0,    rijndael_multiplyby2_lookup[113] = 8'hE2;   
assign rijndael_multiplyby2_lookup[114] = 8'hE4,   rijndael_multiplyby2_lookup[115] = 8'hE6;
assign rijndael_multiplyby2_lookup[116] = 8'hE8,    rijndael_multiplyby2_lookup[117] = 8'hEA;   
assign rijndael_multiplyby2_lookup[118] = 8'hEC,   rijndael_multiplyby2_lookup[119] = 8'hEE;
assign rijndael_multiplyby2_lookup[120] = 8'hF0,    rijndael_multiplyby2_lookup[121] = 8'hF2;   
assign rijndael_multiplyby2_lookup[122] = 8'hF4,   rijndael_multiplyby2_lookup[123] = 8'hF6;
assign rijndael_multiplyby2_lookup[124] = 8'hF8,    rijndael_multiplyby2_lookup[125] = 8'hFA;   
assign rijndael_multiplyby2_lookup[126] = 8'hFC,   rijndael_multiplyby2_lookup[127] = 8'hFE;

assign rijndael_multiplyby2_lookup[128] = 8'h1B,    rijndael_multiplyby2_lookup[129] = 8'h19;   
assign rijndael_multiplyby2_lookup[130] = 8'h1F,   rijndael_multiplyby2_lookup[131] = 8'h1D;
assign rijndael_multiplyby2_lookup[132] = 8'h13,    rijndael_multiplyby2_lookup[133] = 8'h11;   
assign rijndael_multiplyby2_lookup[134] = 8'h17,   rijndael_multiplyby2_lookup[135] = 8'h15;
assign rijndael_multiplyby2_lookup[136] = 8'h0B,    rijndael_multiplyby2_lookup[137] = 8'h09;   
assign rijndael_multiplyby2_lookup[138] = 8'h0F,   rijndael_multiplyby2_lookup[139] = 8'h0D;
assign rijndael_multiplyby2_lookup[140] = 8'h03,    rijndael_multiplyby2_lookup[141] = 8'h01;   
assign rijndael_multiplyby2_lookup[142] = 8'h07,   rijndael_multiplyby2_lookup[143] = 8'h05;

assign rijndael_multiplyby2_lookup[144] = 8'h3B,    rijndael_multiplyby2_lookup[145] = 8'h39;   
assign rijndael_multiplyby2_lookup[146] = 8'h3F,   rijndael_multiplyby2_lookup[147] = 8'h3D;
assign rijndael_multiplyby2_lookup[148] = 8'h33,    rijndael_multiplyby2_lookup[149] = 8'h31;   
assign rijndael_multiplyby2_lookup[150] = 8'h37,   rijndael_multiplyby2_lookup[151] = 8'h35;
assign rijndael_multiplyby2_lookup[152] = 8'h2B,    rijndael_multiplyby2_lookup[153] = 8'h29;   
assign rijndael_multiplyby2_lookup[154] = 8'h2F,   rijndael_multiplyby2_lookup[155] = 8'h2D;
assign rijndael_multiplyby2_lookup[156] = 8'h23,    rijndael_multiplyby2_lookup[157] = 8'h21;   
assign rijndael_multiplyby2_lookup[158] = 8'h27,   rijndael_multiplyby2_lookup[159] = 8'h25;

assign rijndael_multiplyby2_lookup[160] = 8'h5B,    rijndael_multiplyby2_lookup[161] = 8'h59;   
assign rijndael_multiplyby2_lookup[162] = 8'h5F,   rijndael_multiplyby2_lookup[163] = 8'h5D;
assign rijndael_multiplyby2_lookup[164] = 8'h53,    rijndael_multiplyby2_lookup[165] = 8'h51;   
assign rijndael_multiplyby2_lookup[166] = 8'h57,   rijndael_multiplyby2_lookup[167] = 8'h55;
assign rijndael_multiplyby2_lookup[168] = 8'h4B,    rijndael_multiplyby2_lookup[169] = 8'h49;   
assign rijndael_multiplyby2_lookup[170] = 8'h4F,   rijndael_multiplyby2_lookup[171] = 8'h4D;
assign rijndael_multiplyby2_lookup[172] = 8'h43,    rijndael_multiplyby2_lookup[173] = 8'h41;   
assign rijndael_multiplyby2_lookup[174] = 8'h47,   rijndael_multiplyby2_lookup[175] = 8'h45;

assign rijndael_multiplyby2_lookup[176] = 8'h7B,    rijndael_multiplyby2_lookup[177] = 8'h79;   
assign rijndael_multiplyby2_lookup[178] = 8'h7F,   rijndael_multiplyby2_lookup[179] = 8'h7D;
assign rijndael_multiplyby2_lookup[180] = 8'h73,    rijndael_multiplyby2_lookup[181] = 8'h71;   
assign rijndael_multiplyby2_lookup[182] = 8'h77,   rijndael_multiplyby2_lookup[183] = 8'h75;
assign rijndael_multiplyby2_lookup[184] = 8'h6B,    rijndael_multiplyby2_lookup[185] = 8'h69;   
assign rijndael_multiplyby2_lookup[186] = 8'h6F,   rijndael_multiplyby2_lookup[187] = 8'h6D;
assign rijndael_multiplyby2_lookup[188] = 8'h63,    rijndael_multiplyby2_lookup[189] = 8'h61;   
assign rijndael_multiplyby2_lookup[190] = 8'h67,   rijndael_multiplyby2_lookup[191] = 8'h65;

assign rijndael_multiplyby2_lookup[192] = 8'h9B,    rijndael_multiplyby2_lookup[193] = 8'h99;   
assign rijndael_multiplyby2_lookup[194] = 8'h9F,   rijndael_multiplyby2_lookup[195] = 8'h9D;
assign rijndael_multiplyby2_lookup[196] = 8'h93,    rijndael_multiplyby2_lookup[197] = 8'h91;   
assign rijndael_multiplyby2_lookup[198] = 8'h97,   rijndael_multiplyby2_lookup[199] = 8'h95;
assign rijndael_multiplyby2_lookup[200] = 8'h8B,    rijndael_multiplyby2_lookup[201] = 8'h89;   
assign rijndael_multiplyby2_lookup[202] = 8'h8F,   rijndael_multiplyby2_lookup[203] = 8'h8D;
assign rijndael_multiplyby2_lookup[204] = 8'h83,    rijndael_multiplyby2_lookup[205] = 8'h81;   
assign rijndael_multiplyby2_lookup[206] = 8'h87,   rijndael_multiplyby2_lookup[207] = 8'h85;

assign rijndael_multiplyby2_lookup[208] = 8'hBB,    rijndael_multiplyby2_lookup[209] = 8'hB9;   
assign rijndael_multiplyby2_lookup[210] = 8'hBF,   rijndael_multiplyby2_lookup[211] = 8'hBD;
assign rijndael_multiplyby2_lookup[212] = 8'hB3,    rijndael_multiplyby2_lookup[213] = 8'hB1;   
assign rijndael_multiplyby2_lookup[214] = 8'hB7,   rijndael_multiplyby2_lookup[215] = 8'hB5;
assign rijndael_multiplyby2_lookup[216] = 8'hAB,    rijndael_multiplyby2_lookup[217] = 8'hA9;   
assign rijndael_multiplyby2_lookup[218] = 8'hAF,   rijndael_multiplyby2_lookup[219] = 8'hAD;
assign rijndael_multiplyby2_lookup[220] = 8'hA3,    rijndael_multiplyby2_lookup[221] = 8'hA1;   
assign rijndael_multiplyby2_lookup[222] = 8'hA7,   rijndael_multiplyby2_lookup[223] = 8'hA5;

assign rijndael_multiplyby2_lookup[224] = 8'hDB,    rijndael_multiplyby2_lookup[225] = 8'hD9;   
assign rijndael_multiplyby2_lookup[226] = 8'hDF,   rijndael_multiplyby2_lookup[227] = 8'hDD;
assign rijndael_multiplyby2_lookup[228] = 8'hD3,    rijndael_multiplyby2_lookup[229] = 8'hD1;   
assign rijndael_multiplyby2_lookup[230] = 8'hD7,   rijndael_multiplyby2_lookup[231] = 8'hD5;
assign rijndael_multiplyby2_lookup[232] = 8'hCB,    rijndael_multiplyby2_lookup[233] = 8'hC9;   
assign rijndael_multiplyby2_lookup[234] = 8'hCF,   rijndael_multiplyby2_lookup[235] = 8'hCD;
assign rijndael_multiplyby2_lookup[236] = 8'hC3,    rijndael_multiplyby2_lookup[237] = 8'hC1;   
assign rijndael_multiplyby2_lookup[238] = 8'hC7,   rijndael_multiplyby2_lookup[239] = 8'hC5;

assign rijndael_multiplyby2_lookup[240] = 8'hFB,    rijndael_multiplyby2_lookup[241] = 8'hF9;   
assign rijndael_multiplyby2_lookup[242] = 8'hFF,   rijndael_multiplyby2_lookup[243] = 8'hFD;
assign rijndael_multiplyby2_lookup[244] = 8'hF3,    rijndael_multiplyby2_lookup[245] = 8'hF1;   
assign rijndael_multiplyby2_lookup[246] = 8'hF7,   rijndael_multiplyby2_lookup[247] = 8'hF5;
assign rijndael_multiplyby2_lookup[248] = 8'hEB,    rijndael_multiplyby2_lookup[249] = 8'hE9;   
assign rijndael_multiplyby2_lookup[250] = 8'hEF,   rijndael_multiplyby2_lookup[251] = 8'hED;
assign rijndael_multiplyby2_lookup[252] = 8'hE3,    rijndael_multiplyby2_lookup[253] = 8'hE1;   
assign rijndael_multiplyby2_lookup[254] = 8'hE7,   rijndael_multiplyby2_lookup[255] = 8'hE5;


wire [7:0] rijndael_multiplyby3_lookup [0:255];
assign rijndael_multiplyby3_lookup[0] = 8'h00,    rijndael_multiplyby3_lookup[1] = 8'h03;   
assign rijndael_multiplyby3_lookup[2] = 8'h06,   rijndael_multiplyby3_lookup[3] = 8'h05;
assign rijndael_multiplyby3_lookup[4] = 8'h0C,    rijndael_multiplyby3_lookup[5] = 8'h0F;   
assign rijndael_multiplyby3_lookup[6] = 8'h0A,   rijndael_multiplyby3_lookup[7] = 8'h09;
assign rijndael_multiplyby3_lookup[8] = 8'h18,    rijndael_multiplyby3_lookup[9] = 8'h1B;   
assign rijndael_multiplyby3_lookup[10] = 8'h1E,   rijndael_multiplyby3_lookup[11] = 8'h1D;
assign rijndael_multiplyby3_lookup[12] = 8'h14,    rijndael_multiplyby3_lookup[13] = 8'h17;   
assign rijndael_multiplyby3_lookup[14] = 8'h12,   rijndael_multiplyby3_lookup[15] = 8'h11;

assign rijndael_multiplyby3_lookup[16] = 8'h30,    rijndael_multiplyby3_lookup[17] = 8'h33;   
assign rijndael_multiplyby3_lookup[18] = 8'h36,   rijndael_multiplyby3_lookup[19] = 8'h35;
assign rijndael_multiplyby3_lookup[20] = 8'h3C,    rijndael_multiplyby3_lookup[21] = 8'h3F;   
assign rijndael_multiplyby3_lookup[22] = 8'h3A,   rijndael_multiplyby3_lookup[23] = 8'h39;
assign rijndael_multiplyby3_lookup[24] = 8'h28,    rijndael_multiplyby3_lookup[25] = 8'h2B;   
assign rijndael_multiplyby3_lookup[26] = 8'h2E,   rijndael_multiplyby3_lookup[27] = 8'h2D;
assign rijndael_multiplyby3_lookup[28] = 8'h24,    rijndael_multiplyby3_lookup[29] = 8'h27;   
assign rijndael_multiplyby3_lookup[30] = 8'h22,   rijndael_multiplyby3_lookup[31] = 8'h21;

assign rijndael_multiplyby3_lookup[32] = 8'h60,    rijndael_multiplyby3_lookup[33] = 8'h63;   
assign rijndael_multiplyby3_lookup[34] = 8'h66,   rijndael_multiplyby3_lookup[35] = 8'h65;
assign rijndael_multiplyby3_lookup[36] = 8'h6C,    rijndael_multiplyby3_lookup[37] = 8'h6F;   
assign rijndael_multiplyby3_lookup[38] = 8'h6A,   rijndael_multiplyby3_lookup[39] = 8'h69;
assign rijndael_multiplyby3_lookup[40] = 8'h78,    rijndael_multiplyby3_lookup[41] = 8'h7B;   
assign rijndael_multiplyby3_lookup[42] = 8'h7E,   rijndael_multiplyby3_lookup[43] = 8'h7D;
assign rijndael_multiplyby3_lookup[44] = 8'h74,    rijndael_multiplyby3_lookup[45] = 8'h77;   
assign rijndael_multiplyby3_lookup[46] = 8'h72,   rijndael_multiplyby3_lookup[47] = 8'h71;

assign rijndael_multiplyby3_lookup[48] = 8'h50,    rijndael_multiplyby3_lookup[49] = 8'h53;   
assign rijndael_multiplyby3_lookup[50] = 8'h56,   rijndael_multiplyby3_lookup[51] = 8'h55;
assign rijndael_multiplyby3_lookup[52] = 8'h5C,    rijndael_multiplyby3_lookup[53] = 8'h5F;   
assign rijndael_multiplyby3_lookup[54] = 8'h5A,   rijndael_multiplyby3_lookup[55] = 8'h59;
assign rijndael_multiplyby3_lookup[56] = 8'h48,    rijndael_multiplyby3_lookup[57] = 8'h4B;   
assign rijndael_multiplyby3_lookup[58] = 8'h4E,   rijndael_multiplyby3_lookup[59] = 8'h4D;
assign rijndael_multiplyby3_lookup[60] = 8'h44,    rijndael_multiplyby3_lookup[61] = 8'h47;   
assign rijndael_multiplyby3_lookup[62] = 8'h42,   rijndael_multiplyby3_lookup[63] = 8'h41;

assign rijndael_multiplyby3_lookup[64] = 8'hC0,    rijndael_multiplyby3_lookup[65] = 8'hC3;   
assign rijndael_multiplyby3_lookup[66] = 8'hC6,   rijndael_multiplyby3_lookup[67] = 8'hC5;
assign rijndael_multiplyby3_lookup[68] = 8'hCC,    rijndael_multiplyby3_lookup[69] = 8'hCF;   
assign rijndael_multiplyby3_lookup[70] = 8'hCA,   rijndael_multiplyby3_lookup[71] = 8'hC9;
assign rijndael_multiplyby3_lookup[72] = 8'hD8,    rijndael_multiplyby3_lookup[73] = 8'hDB;   
assign rijndael_multiplyby3_lookup[74] = 8'hDE,   rijndael_multiplyby3_lookup[75] = 8'hDD;
assign rijndael_multiplyby3_lookup[76] = 8'hD4,    rijndael_multiplyby3_lookup[77] = 8'hD7;   
assign rijndael_multiplyby3_lookup[78] = 8'hD2,   rijndael_multiplyby3_lookup[79] = 8'hD1;

assign rijndael_multiplyby3_lookup[80] = 8'hF0,    rijndael_multiplyby3_lookup[81] = 8'hF3;   
assign rijndael_multiplyby3_lookup[82] = 8'hF6,   rijndael_multiplyby3_lookup[83] = 8'hF5;
assign rijndael_multiplyby3_lookup[84] = 8'hFC,    rijndael_multiplyby3_lookup[85] = 8'hFF;   
assign rijndael_multiplyby3_lookup[86] = 8'hFA,   rijndael_multiplyby3_lookup[87] = 8'hF9;
assign rijndael_multiplyby3_lookup[88] = 8'hE8,    rijndael_multiplyby3_lookup[89] = 8'hEB;   
assign rijndael_multiplyby3_lookup[90] = 8'hEE,   rijndael_multiplyby3_lookup[91] = 8'hED;
assign rijndael_multiplyby3_lookup[92] = 8'hE4,    rijndael_multiplyby3_lookup[93] = 8'hE7;   
assign rijndael_multiplyby3_lookup[94] = 8'hE2,   rijndael_multiplyby3_lookup[95] = 8'hE1;

assign rijndael_multiplyby3_lookup[96] = 8'hA0,    rijndael_multiplyby3_lookup[97] = 8'hA3;   
assign rijndael_multiplyby3_lookup[98] = 8'hA6,   rijndael_multiplyby3_lookup[99] = 8'hA5;
assign rijndael_multiplyby3_lookup[100] = 8'hAC,    rijndael_multiplyby3_lookup[101] = 8'hAF;   
assign rijndael_multiplyby3_lookup[102] = 8'hAA,   rijndael_multiplyby3_lookup[103] = 8'hA9;
assign rijndael_multiplyby3_lookup[104] = 8'hB8,    rijndael_multiplyby3_lookup[105] = 8'hBB;   
assign rijndael_multiplyby3_lookup[106] = 8'hBE,   rijndael_multiplyby3_lookup[107] = 8'hBD;
assign rijndael_multiplyby3_lookup[108] = 8'hB4,    rijndael_multiplyby3_lookup[109] = 8'hB7;   
assign rijndael_multiplyby3_lookup[110] = 8'hB2,   rijndael_multiplyby3_lookup[111] = 8'hB1;

assign rijndael_multiplyby3_lookup[112] = 8'h90,    rijndael_multiplyby3_lookup[113] = 8'h93;   
assign rijndael_multiplyby3_lookup[114] = 8'h96,   rijndael_multiplyby3_lookup[115] = 8'h95;
assign rijndael_multiplyby3_lookup[116] = 8'h9C,    rijndael_multiplyby3_lookup[117] = 8'h9F;   
assign rijndael_multiplyby3_lookup[118] = 8'h9A,   rijndael_multiplyby3_lookup[119] = 8'h99;
assign rijndael_multiplyby3_lookup[120] = 8'h88,    rijndael_multiplyby3_lookup[121] = 8'h8B;   
assign rijndael_multiplyby3_lookup[122] = 8'h8E,   rijndael_multiplyby3_lookup[123] = 8'h8D;
assign rijndael_multiplyby3_lookup[124] = 8'h84,    rijndael_multiplyby3_lookup[125] = 8'h87;   
assign rijndael_multiplyby3_lookup[126] = 8'h82,   rijndael_multiplyby3_lookup[127] = 8'h81;

assign rijndael_multiplyby3_lookup[128] = 8'h9B,    rijndael_multiplyby3_lookup[129] = 8'h98;   
assign rijndael_multiplyby3_lookup[130] = 8'h9D,   rijndael_multiplyby3_lookup[131] = 8'h9E;
assign rijndael_multiplyby3_lookup[132] = 8'h97,    rijndael_multiplyby3_lookup[133] = 8'h94;   
assign rijndael_multiplyby3_lookup[134] = 8'h91,   rijndael_multiplyby3_lookup[135] = 8'h92;
assign rijndael_multiplyby3_lookup[136] = 8'h83,    rijndael_multiplyby3_lookup[137] = 8'h80;   
assign rijndael_multiplyby3_lookup[138] = 8'h85,   rijndael_multiplyby3_lookup[139] = 8'h86;
assign rijndael_multiplyby3_lookup[140] = 8'h8F,    rijndael_multiplyby3_lookup[141] = 8'h8C;   
assign rijndael_multiplyby3_lookup[142] = 8'h89,   rijndael_multiplyby3_lookup[143] = 8'h8A;

assign rijndael_multiplyby3_lookup[144] = 8'hAB,    rijndael_multiplyby3_lookup[145] = 8'hA8;   
assign rijndael_multiplyby3_lookup[146] = 8'hAD,   rijndael_multiplyby3_lookup[147] = 8'hAE;
assign rijndael_multiplyby3_lookup[148] = 8'hA7,    rijndael_multiplyby3_lookup[149] = 8'hA4;   
assign rijndael_multiplyby3_lookup[150] = 8'hA1,   rijndael_multiplyby3_lookup[151] = 8'hA2;
assign rijndael_multiplyby3_lookup[152] = 8'hB3,    rijndael_multiplyby3_lookup[153] = 8'hB0;   
assign rijndael_multiplyby3_lookup[154] = 8'hB5,   rijndael_multiplyby3_lookup[155] = 8'hB6;
assign rijndael_multiplyby3_lookup[156] = 8'hBF,    rijndael_multiplyby3_lookup[157] = 8'hBC;   
assign rijndael_multiplyby3_lookup[158] = 8'hB9,   rijndael_multiplyby3_lookup[159] = 8'hBA;

assign rijndael_multiplyby3_lookup[160] = 8'hFB,    rijndael_multiplyby3_lookup[161] = 8'hF8;   
assign rijndael_multiplyby3_lookup[162] = 8'hFD,   rijndael_multiplyby3_lookup[163] = 8'hFE;
assign rijndael_multiplyby3_lookup[164] = 8'hF7,    rijndael_multiplyby3_lookup[165] = 8'hF4;   
assign rijndael_multiplyby3_lookup[166] = 8'hF1,   rijndael_multiplyby3_lookup[167] = 8'hF2;
assign rijndael_multiplyby3_lookup[168] = 8'hE3,    rijndael_multiplyby3_lookup[169] = 8'hE0;   
assign rijndael_multiplyby3_lookup[170] = 8'hE5,   rijndael_multiplyby3_lookup[171] = 8'hE6;
assign rijndael_multiplyby3_lookup[172] = 8'hEF,    rijndael_multiplyby3_lookup[173] = 8'hEC;   
assign rijndael_multiplyby3_lookup[174] = 8'hE9,   rijndael_multiplyby3_lookup[175] = 8'hEA;

assign rijndael_multiplyby3_lookup[176] = 8'hCB,    rijndael_multiplyby3_lookup[177] = 8'hC8;   
assign rijndael_multiplyby3_lookup[178] = 8'hCD,   rijndael_multiplyby3_lookup[179] = 8'hCE;
assign rijndael_multiplyby3_lookup[180] = 8'hC7,    rijndael_multiplyby3_lookup[181] = 8'hC4;   
assign rijndael_multiplyby3_lookup[182] = 8'hC1,   rijndael_multiplyby3_lookup[183] = 8'hC2;
assign rijndael_multiplyby3_lookup[184] = 8'hD3,    rijndael_multiplyby3_lookup[185] = 8'hD0;   
assign rijndael_multiplyby3_lookup[186] = 8'hD5,   rijndael_multiplyby3_lookup[187] = 8'hD6;
assign rijndael_multiplyby3_lookup[188] = 8'hDF,    rijndael_multiplyby3_lookup[189] = 8'hDC;   
assign rijndael_multiplyby3_lookup[190] = 8'hD9,   rijndael_multiplyby3_lookup[191] = 8'hDA;

assign rijndael_multiplyby3_lookup[192] = 8'h5B,    rijndael_multiplyby3_lookup[193] = 8'h58;   
assign rijndael_multiplyby3_lookup[194] = 8'h5D,   rijndael_multiplyby3_lookup[195] = 8'h5E;
assign rijndael_multiplyby3_lookup[196] = 8'h57,    rijndael_multiplyby3_lookup[197] = 8'h54;   
assign rijndael_multiplyby3_lookup[198] = 8'h51,   rijndael_multiplyby3_lookup[199] = 8'h52;
assign rijndael_multiplyby3_lookup[200] = 8'h43,    rijndael_multiplyby3_lookup[201] = 8'h40;   
assign rijndael_multiplyby3_lookup[202] = 8'h45,   rijndael_multiplyby3_lookup[203] = 8'h46;
assign rijndael_multiplyby3_lookup[204] = 8'h4F,    rijndael_multiplyby3_lookup[205] = 8'h4C;  
assign rijndael_multiplyby3_lookup[206] = 8'h49,   rijndael_multiplyby3_lookup[207] = 8'h4A;

assign rijndael_multiplyby3_lookup[208] = 8'h6B,    rijndael_multiplyby3_lookup[209] = 8'h68;   
assign rijndael_multiplyby3_lookup[210] = 8'h6D,   rijndael_multiplyby3_lookup[211] = 8'h6E;
assign rijndael_multiplyby3_lookup[212] = 8'h67,    rijndael_multiplyby3_lookup[213] = 8'h64;   
assign rijndael_multiplyby3_lookup[214] = 8'h61,   rijndael_multiplyby3_lookup[215] = 8'h62;
assign rijndael_multiplyby3_lookup[216] = 8'h73,    rijndael_multiplyby3_lookup[217] = 8'h70;   
assign rijndael_multiplyby3_lookup[218] = 8'h75,   rijndael_multiplyby3_lookup[219] = 8'h76;
assign rijndael_multiplyby3_lookup[220] = 8'h7F,    rijndael_multiplyby3_lookup[221] = 8'h7C;   
assign rijndael_multiplyby3_lookup[222] = 8'h79,   rijndael_multiplyby3_lookup[223] = 8'h7A;

assign rijndael_multiplyby3_lookup[224] = 8'h3B,    rijndael_multiplyby3_lookup[225] = 8'h38;   
assign rijndael_multiplyby3_lookup[226] = 8'h3D,   rijndael_multiplyby3_lookup[227] = 8'h3E;
assign rijndael_multiplyby3_lookup[228] = 8'h37,    rijndael_multiplyby3_lookup[229] = 8'h34;   
assign rijndael_multiplyby3_lookup[230] = 8'h31,   rijndael_multiplyby3_lookup[231] = 8'h32;
assign rijndael_multiplyby3_lookup[232] = 8'h23,    rijndael_multiplyby3_lookup[233] = 8'h20;   
assign rijndael_multiplyby3_lookup[234] = 8'h25,   rijndael_multiplyby3_lookup[235] = 8'h26;
assign rijndael_multiplyby3_lookup[236] = 8'h2F,    rijndael_multiplyby3_lookup[237] = 8'h2C;   
assign rijndael_multiplyby3_lookup[238] = 8'h29,   rijndael_multiplyby3_lookup[239] = 8'h2A;

assign rijndael_multiplyby3_lookup[240] = 8'h0B,    rijndael_multiplyby3_lookup[241] = 8'h08;   
assign rijndael_multiplyby3_lookup[242] = 8'h0D,   rijndael_multiplyby3_lookup[243] = 8'h0E;
assign rijndael_multiplyby3_lookup[244] = 8'h07,    rijndael_multiplyby3_lookup[245] = 8'h04;   
assign rijndael_multiplyby3_lookup[246] = 8'h01,   rijndael_multiplyby3_lookup[247] = 8'h02;
assign rijndael_multiplyby3_lookup[248] = 8'h13,    rijndael_multiplyby3_lookup[249] = 8'h10;   
assign rijndael_multiplyby3_lookup[250] = 8'h15,   rijndael_multiplyby3_lookup[251] = 8'h16;
assign rijndael_multiplyby3_lookup[252] = 8'h1F,    rijndael_multiplyby3_lookup[253] = 8'h1C;   
assign rijndael_multiplyby3_lookup[254] = 8'h19,   rijndael_multiplyby3_lookup[255] = 8'h1A;

assign output_data[127:120] = rijndael_multiplyby2_lookup[input_data[127:120]] ^ 
                              rijndael_multiplyby3_lookup[input_data[119:112]] ^ 
                              input_data[111:104] ^ 
                              input_data[103:96];
                              
assign output_data[119:112] = input_data[127:120] ^ 
                              rijndael_multiplyby2_lookup[input_data[119:112]] ^ 
                              rijndael_multiplyby3_lookup[input_data[111:104]] ^ 
                              input_data[103:96];
                              
assign output_data[111:104] = input_data[127:120] ^ 
                              input_data[119:112] ^ 
                              rijndael_multiplyby2_lookup[input_data[111:104]] ^ 
                              rijndael_multiplyby3_lookup[input_data[103:96]];
                              
assign output_data[103:96] = rijndael_multiplyby3_lookup[input_data[127:120]] ^ 
                             input_data[119:112] ^ 
                             input_data[111:104] ^ 
                             rijndael_multiplyby2_lookup[input_data[103:96]];

assign output_data[95:88] = rijndael_multiplyby2_lookup[input_data[95:88]] ^ 
                            rijndael_multiplyby3_lookup[input_data[87:80]] ^ 
                            input_data[79:72] ^ 
                            input_data[71:64];
                            
assign output_data[87:80] = input_data[95:88] ^ 
                            rijndael_multiplyby2_lookup[input_data[87:80]] ^ 
                            rijndael_multiplyby3_lookup[input_data[79:72]] ^ 
                            input_data[71:64];
                            
assign output_data[79:72] = input_data[95:88] ^ 
                            input_data[87:80] ^ 
                            rijndael_multiplyby2_lookup[input_data[79:72]] ^ 
                            rijndael_multiplyby3_lookup[input_data[71:64]];
                            
assign output_data[71:64] = rijndael_multiplyby3_lookup[input_data[95:88]] ^ 
                            input_data[87:80] ^ 
                            input_data[79:72] ^ 
                            rijndael_multiplyby2_lookup[input_data[71:64]];

assign output_data[63:56] = rijndael_multiplyby2_lookup[input_data[63:56]] ^ 
                            rijndael_multiplyby3_lookup[input_data[55:48]] ^ 
                            input_data[47:40] ^ 
                            input_data[39:32];
                            
assign output_data[55:48] = input_data[63:56] ^ 
                            rijndael_multiplyby2_lookup[input_data[55:48]] ^ 
                            rijndael_multiplyby3_lookup[input_data[47:40]] ^ 
                            input_data[39:32];
                            
assign output_data[47:40] = input_data[63:56] ^ 
                            input_data[55:48] ^ 
                            rijndael_multiplyby2_lookup[input_data[47:40]] ^ 
                            rijndael_multiplyby3_lookup[input_data[39:32]];
                            
assign output_data[39:32] = rijndael_multiplyby3_lookup[input_data[63:56]] ^ 
                            input_data[55:48] ^ 
                            input_data[47:40] ^ 
                            rijndael_multiplyby2_lookup[input_data[39:32]];

assign output_data[31:24] = rijndael_multiplyby2_lookup[input_data[31:24]] ^ 
                            rijndael_multiplyby3_lookup[input_data[23:16]] ^ 
                            input_data[15:8] ^ 
                            input_data[7:0];
                            
assign output_data[23:16] = input_data[31:24] ^ 
                            rijndael_multiplyby2_lookup[input_data[23:16]] ^ 
                            rijndael_multiplyby3_lookup[input_data[15:8]] ^ 
                            input_data[7:0];
                            
assign output_data[15:8] = input_data[31:24] ^ 
                           input_data[23:16] ^ 
                           rijndael_multiplyby2_lookup[input_data[15:8]] ^ 
                           rijndael_multiplyby3_lookup[input_data[7:0]];
                           
assign output_data[7:0] = rijndael_multiplyby3_lookup[input_data[31:24]] ^ 
                          input_data[23:16] ^ 
                          input_data[15:8] ^ 
                          rijndael_multiplyby2_lookup[input_data[7:0]];


                                                  
endmodule
