`timescale 1ns / 1ps

module s_box(
    input  [7:0] data_i,
    output wire [7:0] data_out
    );

	wire [7:0] box [0:255];
            
    assign box[0] = 8'h63; assign box[1] = 8'h7c;
    assign box[2] = 8'h77; assign box[3] = 8'h7b;
    assign box[4] = 8'hf2; assign box[5] = 8'h6b;
    assign box[6] = 8'h6f; assign box[7] = 8'hc5;
    assign box[8] = 8'h30; assign box[9] = 8'h01;
    assign box[10] = 8'h67; assign box[11] = 8'h2b;
    assign box[12] = 8'hfe; assign box[13] = 8'hd7;
    assign box[14] = 8'hab; assign box[15] = 8'h76;
    
    assign box[16] = 8'hca; assign box[17] = 8'h82;
    assign box[18] = 8'hc9; assign box[19] = 8'h7d;
    assign box[20] = 8'hfa; assign box[21] = 8'h59;
    assign box[22] = 8'h47; assign box[23] = 8'hf0;
    assign box[24] = 8'had; assign box[25] = 8'hd4;
    assign box[26] = 8'ha2; assign box[27] = 8'haf;
    assign box[28] = 8'h9c; assign box[29] = 8'ha4;
    assign box[30] = 8'h72; assign box[31] = 8'hc0;
    
    assign box[32] = 8'hb7; assign box[33] = 8'hfd;
    assign box[34] = 8'h93; assign box[35] = 8'h26;
    assign box[36] = 8'h36; assign box[37] = 8'h3f;
    assign box[38] = 8'hf7; assign box[39] = 8'hcc;
    assign box[40] = 8'h34; assign box[41] = 8'ha5;
    assign box[42] = 8'he5; assign box[43] = 8'hf1;
    assign box[44] = 8'h71; assign box[45] = 8'hd8;
    assign box[46] = 8'h31; assign box[47] = 8'h15;
    
    assign box[48] = 8'h04; assign box[49] = 8'hc7;
    assign box[50] = 8'h23; assign box[51] = 8'hc3;
    assign box[52] = 8'h18; assign box[53] = 8'h96;
    assign box[54] = 8'h05; assign box[55] = 8'h9a;
    assign box[56] = 8'h07; assign box[57] = 8'h12;
    assign box[58] = 8'h80; assign box[59] = 8'he2;
    assign box[60] = 8'heb; assign box[61] = 8'h27;
    assign box[62] = 8'hb2; assign box[63] = 8'h75;
    
    assign box[64] = 8'h09; assign box[65] = 8'h83;
    assign box[66] = 8'h2c; assign box[67] = 8'h1a;
    assign box[68] = 8'h1b; assign box[69] = 8'h6e;
    assign box[70] = 8'h5a; assign box[71] = 8'ha0;
    assign box[72] = 8'h52; assign box[73] = 8'h3b;
    assign box[74] = 8'hd6; assign box[75] = 8'hb3;
    assign box[76] = 8'h29; assign box[77] = 8'he3;
    assign box[78] = 8'h2f; assign box[79] = 8'h84;
    
    assign box[80] = 8'h53; assign box[81] = 8'hd1;
    assign box[82] = 8'h00; assign box[83] = 8'hed;
    assign box[84] = 8'h20; assign box[85] = 8'hfc;
    assign box[86] = 8'hb1; assign box[87] = 8'h5b;
    assign box[88] = 8'h6a; assign box[89] = 8'hcb;
    assign box[90] = 8'hbe; assign box[91] = 8'h39;
    assign box[92] = 8'h4a; assign box[93] = 8'h4c;
    assign box[94] = 8'h58; assign box[95] = 8'hcf;
    
    assign box[96] = 8'hd0; assign box[97] = 8'hef;
    assign box[98] = 8'haa; assign box[99] = 8'hfb;
    assign box[100] = 8'h43; assign box[101] = 8'h4d;
    assign box[102] = 8'h33; assign box[103] = 8'h85;
    assign box[104] = 8'h45; assign box[105] = 8'hf9;
    assign box[106] = 8'h02; assign box[107] = 8'h7f;
    assign box[108] = 8'h50; assign box[109] = 8'h3c;
    assign box[110] = 8'h9f; assign box[111] = 8'ha8;
    
    assign box[112] = 8'h51; assign box[113] = 8'ha3;
    assign box[114] = 8'h40; assign box[115] = 8'h8f;
    assign box[116] = 8'h92; assign box[117] = 8'h9d;
    assign box[118] = 8'h38; assign box[119] = 8'hf5;
    assign box[120] = 8'hbc; assign box[121] = 8'hb6;
    assign box[122] = 8'hda; assign box[123] = 8'h21;
    assign box[124] = 8'h10; assign box[125] = 8'hff;
    assign box[126] = 8'hf3; assign box[127] = 8'hd2;
    
    assign box[128] = 8'hcd; assign box[129] = 8'h0c;
    assign box[130] = 8'h13; assign box[131] = 8'hec;
    assign box[132] = 8'h5f; assign box[133] = 8'h97;
    assign box[134] = 8'h44; assign box[135] = 8'h17;
    assign box[136] = 8'hc4; assign box[137] = 8'ha7;
    assign box[138] = 8'h7e; assign box[139] = 8'h3d;
    assign box[140] = 8'h64; assign box[141] = 8'h5d;
    assign box[142] = 8'h19; assign box[143] = 8'h73;
    
    assign box[144] = 8'h60; assign box[145] = 8'h81;
    assign box[146] = 8'h4f; assign box[147] = 8'hdc;
    assign box[148] = 8'h22; assign box[149] = 8'h2a;
    assign box[150] = 8'h90; assign box[151] = 8'h88;
    assign box[152] = 8'h46; assign box[153] = 8'hee;
    assign box[154] = 8'hb8; assign box[155] = 8'h14;
    assign box[156] = 8'hde; assign box[157] = 8'h5e;
    assign box[158] = 8'h0b; assign box[159] = 8'hdb;
    
    assign box[160] = 8'he0; assign box[161] = 8'h32;
    assign box[162] = 8'h3a; assign box[163] = 8'h0a;
    assign box[164] = 8'h49; assign box[165] = 8'h06;
    assign box[166] = 8'h24; assign box[167] = 8'h5c;
    assign box[168] = 8'hc2; assign box[169] = 8'hd3;
    assign box[170] = 8'hac; assign box[171] = 8'h62;
    assign box[172] = 8'h91; assign box[173] = 8'h95;
    assign box[174] = 8'he4; assign box[175] = 8'h79;
    
    assign box[176] = 8'he7; assign box[177] = 8'hc8;
    assign box[178] = 8'h37; assign box[179] = 8'h6d;
    assign box[180] = 8'h8d; assign box[181] = 8'hd5;
    assign box[182] = 8'h4e; assign box[183] = 8'ha9;
    assign box[184] = 8'h6c; assign box[185] = 8'h56;
    assign box[186] = 8'hf4; assign box[187] = 8'hea;
    assign box[188] = 8'h65; assign box[189] = 8'h7a;
    assign box[190] = 8'hae; assign box[191] = 8'h08;
    
    assign box[192] = 8'hba; assign box[193] = 8'h78;
    assign box[194] = 8'h25; assign box[195] = 8'h2e;
    assign box[196] = 8'h1c; assign box[197] = 8'ha6;
    assign box[198] = 8'hb4; assign box[199] = 8'hc6;
    assign box[200] = 8'he8; assign box[201] = 8'hdd;
    assign box[202] = 8'h74; assign box[203] = 8'h1f;
    assign box[204] = 8'h4b; assign box[205] = 8'hbd;
    assign box[206] = 8'h8b; assign box[207] = 8'h8a;
    
    assign box[208] = 8'h70; assign box[209] = 8'h3e;
    assign box[210] = 8'hb5; assign box[211] = 8'h66;
    assign box[212] = 8'h48; assign box[213] = 8'h03;
    assign box[214] = 8'hf6; assign box[215] = 8'h0e;
    assign box[216] = 8'h61; assign box[217] = 8'h35;
    assign box[218] = 8'h57; assign box[219] = 8'hb9;
    assign box[220] = 8'h86; assign box[221] = 8'hc1;
    assign box[222] = 8'h1d; assign box[223] = 8'h9e;
    
    assign box[224] = 8'he1; assign box[225] = 8'hf8;
    assign box[226] = 8'h98; assign box[227] = 8'h11;
    assign box[228] = 8'h69; assign box[229] = 8'hd9;
    assign box[230] = 8'h8e; assign box[231] = 8'h94;
    assign box[232] = 8'h9b; assign box[233] = 8'h1e;
    assign box[234] = 8'h87; assign box[235] = 8'he9;
    assign box[236] = 8'hce; assign box[237] = 8'h55;
    assign box[238] = 8'h28; assign box[239] = 8'hdf;
    
    assign box[240] = 8'h8c; assign box[241] = 8'ha1;
    assign box[242] = 8'h89; assign box[243] = 8'h0d;
    assign box[244] = 8'hbf; assign box[245] = 8'he6;
    assign box[246] = 8'h42; assign box[247] = 8'h68;
    assign box[248] = 8'h41; assign box[249] = 8'h99;
    assign box[250] = 8'h2d; assign box[251] = 8'h0f;
    assign box[252] = 8'hb0; assign box[253] = 8'h54;
    assign box[254] = 8'hbb; assign box[255] = 8'h16; 
	
	
	assign data_out = box[data_i];
	
	
endmodule