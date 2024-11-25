module caixaSInv ();
    
    reg [7:0] caixaSInv [0:255];

    initial begin
        caixaSInv[0] = 8'h52; caixaSInv[1] = 8'h09; caixaSInv[2] = 8'h6a; caixaSInv[3] = 8'hd5;
        caixaSInv[4] = 8'h30; caixaSInv[5] = 8'h36; caixaSInv[6] = 8'ha5; caixaSInv[7] = 8'h38;
        caixaSInv[8] = 8'hbf; caixaSInv[9] = 8'h40; caixaSInv[10] = 8'ha3; caixaSInv[11] = 8'h9e;
        caixaSInv[12] = 8'h81; caixaSInv[13] = 8'hf3; caixaSInv[14] = 8'hd7; caixaSInv[15] = 8'hfb;
        caixaSInv[16] = 8'h7c; caixaSInv[17] = 8'he3; caixaSInv[18] = 8'h39; caixaSInv[19] = 8'h82;
        caixaSInv[20] = 8'h9b; caixaSInv[21] = 8'h2f; caixaSInv[22] = 8'hff; caixaSInv[23] = 8'h87;
        caixaSInv[24] = 8'h34; caixaSInv[25] = 8'h8e; caixaSInv[26] = 8'h43; caixaSInv[27] = 8'h44;
        caixaSInv[28] = 8'hc4; caixaSInv[29] = 8'hde; caixaSInv[30] = 8'he9; caixaSInv[31] = 8'hcb;

        caixaSInv[32] = 8'h54; caixaSInv[33] = 8'h7b; caixaSInv[34] = 8'h94; caixaSInv[35] = 8'h32;
        caixaSInv[36] = 8'ha6; caixaSInv[37] = 8'hc2; caixaSInv[38] = 8'h23; caixaSInv[39] = 8'h3d;
        caixaSInv[40] = 8'hee; caixaSInv[41] = 8'h4c; caixaSInv[42] = 8'h95; caixaSInv[43] = 8'h0b;
        caixaSInv[44] = 8'h42; caixaSInv[45] = 8'hfa; caixaSInv[46] = 8'hc3; caixaSInv[47] = 8'h4e;
        caixaSInv[48] = 8'h08; caixaSInv[49] = 8'h2e; caixaSInv[50] = 8'ha1; caixaSInv[51] = 8'h66;
        caixaSInv[52] = 8'h28; caixaSInv[53] = 8'hd9; caixaSInv[54] = 8'h24; caixaSInv[55] = 8'hb2;
        caixaSInv[56] = 8'h76; caixaSInv[57] = 8'h5b; caixaSInv[58] = 8'ha2; caixaSInv[59] = 8'h49;
        caixaSInv[60] = 8'h6d; caixaSInv[61] = 8'h8b; caixaSInv[62] = 8'hd1; caixaSInv[63] = 8'h25;

        caixaSInv[64] = 8'h72; caixaSInv[65] = 8'hf8; caixaSInv[66] = 8'hf6; caixaSInv[67] = 8'h64;
        caixaSInv[68] = 8'h86; caixaSInv[69] = 8'h68; caixaSInv[70] = 8'h98; caixaSInv[71] = 8'h16;
        caixaSInv[72] = 8'hd4; caixaSInv[73] = 8'ha4; caixaSInv[74] = 8'h5c; caixaSInv[75] = 8'hcc;
        caixaSInv[76] = 8'h5d; caixaSInv[77] = 8'h65; caixaSInv[78] = 8'hb6; caixaSInv[79] = 8'h92;
        caixaSInv[80] = 8'h6c; caixaSInv[81] = 8'h70; caixaSInv[82] = 8'h48; caixaSInv[83] = 8'h50;
        caixaSInv[84] = 8'hfd; caixaSInv[85] = 8'hed; caixaSInv[86] = 8'hb9; caixaSInv[87] = 8'hda;
        caixaSInv[88] = 8'h5e; caixaSInv[89] = 8'h15; caixaSInv[90] = 8'h46; caixaSInv[91] = 8'h57;
        caixaSInv[92] = 8'ha7; caixaSInv[93] = 8'h8d; caixaSInv[94] = 8'h9d; caixaSInv[95] = 8'h84;

        caixaSInv[96] = 8'h90; caixaSInv[97] = 8'hd8; caixaSInv[98] = 8'hab; caixaSInv[99] = 8'h00;
        caixaSInv[100] = 8'h8c; caixaSInv[101] = 8'hbc; caixaSInv[102] = 8'hd3; caixaSInv[103] = 8'h0a;
        caixaSInv[104] = 8'hf7; caixaSInv[105] = 8'he4; caixaSInv[106] = 8'h58; caixaSInv[107] = 8'h05;
        caixaSInv[108] = 8'hb8; caixaSInv[109] = 8'hb3; caixaSInv[110] = 8'h45; caixaSInv[111] = 8'h06;
        caixaSInv[112] = 8'hd0; caixaSInv[113] = 8'h2c; caixaSInv[114] = 8'h1e; caixaSInv[115] = 8'h8f;
        caixaSInv[116] = 8'hca; caixaSInv[117] = 8'h3f; caixaSInv[118] = 8'h0f; caixaSInv[119] = 8'h02;
        caixaSInv[120] = 8'hc1; caixaSInv[121] = 8'haf; caixaSInv[122] = 8'hbd; caixaSInv[123] = 8'h03;
        caixaSInv[124] = 8'h01; caixaSInv[125] = 8'h13; caixaSInv[126] = 8'h8a; caixaSInv[127] = 8'h6b;

        caixaSInv[128] = 8'h3a; caixaSInv[129] = 8'h91; caixaSInv[130] = 8'h11; caixaSInv[131] = 8'h41;
        caixaSInv[132] = 8'h4f; caixaSInv[133] = 8'h67; caixaSInv[134] = 8'hdc; caixaSInv[135] = 8'hea;
        caixaSInv[136] = 8'h97; caixaSInv[137] = 8'hf2; caixaSInv[138] = 8'hcf; caixaSInv[139] = 8'hce;
        caixaSInv[140] = 8'hf0; caixaSInv[141] = 8'hb4; caixaSInv[142] = 8'he6; caixaSInv[143] = 8'h73;
        caixaSInv[144] = 8'h96; caixaSInv[145] = 8'hac; caixaSInv[146] = 8'h74; caixaSInv[147] = 8'h22;
        caixaSInv[148] = 8'he7; caixaSInv[149] = 8'had; caixaSInv[150] = 8'h35; caixaSInv[151] = 8'h85;
        caixaSInv[152] = 8'he2; caixaSInv[153] = 8'hf9; caixaSInv[154] = 8'h37; caixaSInv[155] = 8'he8;
        caixaSInv[156] = 8'h1c; caixaSInv[157] = 8'h75; caixaSInv[158] = 8'hdf; caixaSInv[159] = 8'h6e;

        caixaSInv[160] = 8'h47; caixaSInv[161] = 8'hf1; caixaSInv[162] = 8'h1a; caixaSInv[163] = 8'h71;
        caixaSInv[164] = 8'h1d; caixaSInv[165] = 8'h29; caixaSInv[166] = 8'hc5; caixaSInv[167] = 8'h89;
        caixaSInv[168] = 8'h6f; caixaSInv[169] = 8'hb7; caixaSInv[170] = 8'h62; caixaSInv[171] = 8'h0e;
        caixaSInv[172] = 8'haa; caixaSInv[173] = 8'h18; caixaSInv[174] = 8'hbe; caixaSInv[175] = 8'h1b;
        caixaSInv[176] = 8'hfc; caixaSInv[177] = 8'h56; caixaSInv[178] = 8'h3e; caixaSInv[179] = 8'h4b;
        caixaSInv[180] = 8'hc6; caixaSInv[181] = 8'hd2; caixaSInv[182] = 8'h79; caixaSInv[183] = 8'h20;
        caixaSInv[184] = 8'h9a; caixaSInv[185] = 8'hdb; caixaSInv[186] = 8'hc0; caixaSInv[187] = 8'hfe;
        caixaSInv[188] = 8'h78; caixaSInv[189] = 8'hcd; caixaSInv[190] = 8'h5a; caixaSInv[191] = 8'hf4;
        caixaSInv[192] = 8'h1f; caixaSInv[193] = 8'hdd; caixaSInv[194] = 8'ha8; caixaSInv[195] = 8'h33;
        caixaSInv[196] = 8'h88; caixaSInv[197] = 8'h07; caixaSInv[198] = 8'hc7; caixaSInv[199] = 8'h31;
        caixaSInv[200] = 8'hb1; caixaSInv[201] = 8'h12; caixaSInv[202] = 8'h10; caixaSInv[203] = 8'h59;
        caixaSInv[204] = 8'h27; caixaSInv[205] = 8'h80; caixaSInv[206] = 8'hec; caixaSInv[207] = 8'h5f;
        caixaSInv[208] = 8'h60; caixaSInv[209] = 8'h51; caixaSInv[210] = 8'h7f; caixaSInv[211] = 8'ha9;
        caixaSInv[212] = 8'h19; caixaSInv[213] = 8'hb5; caixaSInv[214] = 8'h4a; caixaSInv[215] = 8'h0d;
        caixaSInv[216] = 8'h2d; caixaSInv[217] = 8'he5; caixaSInv[218] = 8'h7a; caixaSInv[219] = 8'h9f;
        caixaSInv[220] = 8'h93; caixaSInv[221] = 8'hc9; caixaSInv[222] = 8'h9c; caixaSInv[223] = 8'hef;
        caixaSInv[224] = 8'ha0; caixaSInv[225] = 8'he0; caixaSInv[226] = 8'h3b; caixaSInv[227] = 8'h4d;
        caixaSInv[228] = 8'hae; caixaSInv[229] = 8'h2a; caixaSInv[230] = 8'hf5; caixaSInv[231] = 8'hb0;
        caixaSInv[232] = 8'hc8; caixaSInv[233] = 8'heb; caixaSInv[234] = 8'hbb; caixaSInv[235] = 8'h3c;
        caixaSInv[236] = 8'h83; caixaSInv[237] = 8'h53; caixaSInv[238] = 8'h99; caixaSInv[239] = 8'h61;
        caixaSInv[240] = 8'h17; caixaSInv[241] = 8'h2b; caixaSInv[242] = 8'h04; caixaSInv[243] = 8'h7e;
        caixaSInv[244] = 8'hba; caixaSInv[245] = 8'h77; caixaSInv[246] = 8'hd6; caixaSInv[247] = 8'h26;
        caixaSInv[248] = 8'he1; caixaSInv[249] = 8'h69; caixaSInv[250] = 8'h14; caixaSInv[251] = 8'h63;
        caixaSInv[252] = 8'h55; caixaSInv[253] = 8'h21; caixaSInv[254] = 8'h0c; caixaSInv[255] = 8'h7d;

    end

    
endmodule