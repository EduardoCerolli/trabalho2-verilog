module substituiBytes (
    input wire[127:0] bloco,
    output wire [127:0] saida
);

        
    reg [7:0] caixaS [0:255];

    // Inicializa a CaixaS
    initial begin
        // Linha 0
        caixaS[0] = 8'h63;  caixaS[1] = 8'h7c;  caixaS[2] = 8'h77;  caixaS[3] = 8'h7b;
        caixaS[4] = 8'hf2;  caixaS[5] = 8'h6b;  caixaS[6] = 8'h6f;  caixaS[7] = 8'hc5;
        caixaS[8] = 8'h30;  caixaS[9] = 8'h01;  caixaS[10] = 8'h67; caixaS[11] = 8'h2b;
        caixaS[12] = 8'hfe; caixaS[13] = 8'hd7; caixaS[14] = 8'hab; caixaS[15] = 8'h76;

        // Linha 1
        caixaS[16] = 8'hca; caixaS[17] = 8'h82; caixaS[18] = 8'hc9; caixaS[19] = 8'h7d;
        caixaS[20] = 8'hfa; caixaS[21] = 8'h59; caixaS[22] = 8'h47; caixaS[23] = 8'hf0;
        caixaS[24] = 8'had; caixaS[25] = 8'hd4; caixaS[26] = 8'ha2; caixaS[27] = 8'haf;
        caixaS[28] = 8'h9c; caixaS[29] = 8'ha4; caixaS[30] = 8'h72; caixaS[31] = 8'hc0;

        // Linha 2
        caixaS[32] = 8'hb7; caixaS[33] = 8'hfd; caixaS[34] = 8'h93; caixaS[35] = 8'h26;
        caixaS[36] = 8'h36; caixaS[37] = 8'h3f; caixaS[38] = 8'hf7; caixaS[39] = 8'hcc;
        caixaS[40] = 8'h34; caixaS[41] = 8'ha5; caixaS[42] = 8'he5; caixaS[43] = 8'hf1;
        caixaS[44] = 8'h71; caixaS[45] = 8'hd8; caixaS[46] = 8'h31; caixaS[47] = 8'h15;

        // Linha 3
        caixaS[48] = 8'h04; caixaS[49] = 8'hc7; caixaS[50] = 8'h23; caixaS[51] = 8'hc3;
        caixaS[52] = 8'h18; caixaS[53] = 8'h96; caixaS[54] = 8'h05; caixaS[55] = 8'h9a;
        caixaS[56] = 8'h07; caixaS[57] = 8'h12; caixaS[58] = 8'h80; caixaS[59] = 8'he2;
        caixaS[60] = 8'heb; caixaS[61] = 8'h27; caixaS[62] = 8'hb2; caixaS[63] = 8'h75;

        // Linha 4
        caixaS[64] = 8'h09; caixaS[65] = 8'h83; caixaS[66] = 8'h2c; caixaS[67] = 8'h1a;
        caixaS[68] = 8'h1b; caixaS[69] = 8'h6e; caixaS[70] = 8'h5a; caixaS[71] = 8'ha0;
        caixaS[72] = 8'h52; caixaS[73] = 8'h3b; caixaS[74] = 8'hd6; caixaS[75] = 8'hb3;
        caixaS[76] = 8'h29; caixaS[77] = 8'he3; caixaS[78] = 8'h2f; caixaS[79] = 8'h84;

        // Linha 5
        caixaS[80] = 8'h53; caixaS[81] = 8'hd1; caixaS[82] = 8'h00; caixaS[83] = 8'hed;
        caixaS[84] = 8'h20; caixaS[85] = 8'hfc; caixaS[86] = 8'hb1; caixaS[87] = 8'h5b;
        caixaS[88] = 8'h6a; caixaS[89] = 8'hcb; caixaS[90] = 8'hbe; caixaS[91] = 8'h39;
        caixaS[92] = 8'h4a; caixaS[93] = 8'h4c; caixaS[94] = 8'h58; caixaS[95] = 8'hcf;

        // Linha 6
        caixaS[96] = 8'hd0; caixaS[97] = 8'hef; caixaS[98] = 8'haa; caixaS[99] = 8'hfb;
        caixaS[100] = 8'h43; caixaS[101] = 8'h4d; caixaS[102] = 8'h33; caixaS[103] = 8'h85;
        caixaS[104] = 8'h45; caixaS[105] = 8'hf9; caixaS[106] = 8'h02; caixaS[107] = 8'h7f;
        caixaS[108] = 8'h50; caixaS[109] = 8'h3c; caixaS[110] = 8'h9f; caixaS[111] = 8'ha8;

        // Linha 7
        caixaS[112] = 8'h51; caixaS[113] = 8'ha3; caixaS[114] = 8'h40; caixaS[115] = 8'h8f;
        caixaS[116] = 8'h92; caixaS[117] = 8'h9d; caixaS[118] = 8'h38; caixaS[119] = 8'hf5;
        caixaS[120] = 8'hbc; caixaS[121] = 8'hb6; caixaS[122] = 8'hda; caixaS[123] = 8'h21;
        caixaS[124] = 8'h10; caixaS[125] = 8'hff; caixaS[126] = 8'hf3; caixaS[127] = 8'hd2;

        // Linha 8
        caixaS[128] = 8'hcd; caixaS[129] = 8'h0c; caixaS[130] = 8'h13; caixaS[131] = 8'hec;
        caixaS[132] = 8'h5f; caixaS[133] = 8'h97; caixaS[134] = 8'h44; caixaS[135] = 8'h17;
        caixaS[136] = 8'hc4; caixaS[137] = 8'ha7; caixaS[138] = 8'h7e; caixaS[139] = 8'h3d;
        caixaS[140] = 8'h64; caixaS[141] = 8'h5d; caixaS[142] = 8'h19; caixaS[143] = 8'h73;

        // Linha 9
        caixaS[144] = 8'h60; caixaS[145] = 8'h81; caixaS[146] = 8'h4f; caixaS[147] = 8'hdc;
        caixaS[148] = 8'h22; caixaS[149] = 8'h2a; caixaS[150] = 8'h90; caixaS[151] = 8'h88;
        caixaS[152] = 8'h46; caixaS[153] = 8'hee; caixaS[154] = 8'hb8; caixaS[155] = 8'h14;
        caixaS[156] = 8'hde; caixaS[157] = 8'h5e; caixaS[158] = 8'h0b; caixaS[159] = 8'hdb;

            // Linha A
        caixaS[164] = 8'h49; caixaS[165] = 8'h06; caixaS[166] = 8'h24; caixaS[167] = 8'h5c;
        caixaS[168] = 8'hc2; caixaS[169] = 8'hd3; caixaS[170] = 8'hac; caixaS[171] = 8'h62;
        caixaS[172] = 8'h91; caixaS[173] = 8'h95; caixaS[174] = 8'he4; caixaS[175] = 8'h79;

        // Linha B
        caixaS[176] = 8'he7; caixaS[177] = 8'hc8; caixaS[178] = 8'h37; caixaS[179] = 8'h6d;
        caixaS[180] = 8'h8d; caixaS[181] = 8'hd5; caixaS[182] = 8'h4e; caixaS[183] = 8'ha9;
        caixaS[184] = 8'h6c; caixaS[185] = 8'h56; caixaS[186] = 8'hf4; caixaS[187] = 8'hea;
        caixaS[188] = 8'h65; caixaS[189] = 8'h7a; caixaS[190] = 8'hae; caixaS[191] = 8'h08;

        // Linha C
        caixaS[192] = 8'hba; caixaS[193] = 8'h78; caixaS[194] = 8'h25; caixaS[195] = 8'h2e;
        caixaS[196] = 8'h1c; caixaS[197] = 8'ha6; caixaS[198] = 8'hb4; caixaS[199] = 8'hc6;
        caixaS[200] = 8'he8; caixaS[201] = 8'hdd; caixaS[202] = 8'h74; caixaS[203] = 8'h1f;
        caixaS[204] = 8'h4b; caixaS[205] = 8'hbd; caixaS[206] = 8'h8b; caixaS[207] = 8'h8a;

        // Linha D
        caixaS[208] = 8'h70; caixaS[209] = 8'h3e; caixaS[210] = 8'hb5; caixaS[211] = 8'h66;
        caixaS[212] = 8'h48; caixaS[213] = 8'h03; caixaS[214] = 8'hf6; caixaS[215] = 8'h0e;
        caixaS[216] = 8'h61; caixaS[217] = 8'h35; caixaS[218] = 8'h57; caixaS[219] = 8'hb9;
        caixaS[220] = 8'h86; caixaS[221] = 8'hc1; caixaS[222] = 8'h1d; caixaS[223] = 8'h9e;

        // Linha E
        caixaS[224] = 8'he1; caixaS[225] = 8'hf8; caixaS[226] = 8'h98; caixaS[227] = 8'h11;
        caixaS[228] = 8'h69; caixaS[229] = 8'hd9; caixaS[230] = 8'h8e; caixaS[231] = 8'h94;
        caixaS[232] = 8'h9b; caixaS[233] = 8'h1e; caixaS[234] = 8'h87; caixaS[235] = 8'he9;
        caixaS[236] = 8'hce; caixaS[237] = 8'h55; caixaS[238] = 8'h28; caixaS[239] = 8'hdf;

        // Linha F
        caixaS[240] = 8'h8c; caixaS[241] = 8'ha1; caixaS[242] = 8'h89; caixaS[243] = 8'h0d;
        caixaS[244] = 8'hbf; caixaS[245] = 8'he6; caixaS[246] = 8'h42; caixaS[247] = 8'h68;
        caixaS[248] = 8'h41; caixaS[249] = 8'h99; caixaS[250] = 8'h2d; caixaS[251] = 8'h0f;
        caixaS[252] = 8'hb0; caixaS[253] = 8'h54; caixaS[254] = 8'hbb; caixaS[255] = 8'h16;

    end


    assign saida[7:0]    = caixaS[bloco[7:0]];
    assign saida[15:8]   = caixaS[bloco[15:8]];
    assign saida[23:16]  = caixaS[bloco[23:16]];
    assign saida[31:24]  = caixaS[bloco[31:24]];
    assign saida[39:32]  = caixaS[bloco[39:32]];
    assign saida[47:40]  = caixaS[bloco[47:40]];
    assign saida[55:48]  = caixaS[bloco[55:48]];
    assign saida[63:56]  = caixaS[bloco[63:56]];
    assign saida[71:64]  = caixaS[bloco[71:64]];
    assign saida[79:72]  = caixaS[bloco[79:72]];
    assign saida[87:80]  = caixaS[bloco[87:80]];
    assign saida[95:88]  = caixaS[bloco[95:88]];
    assign saida[103:96] = caixaS[bloco[103:96]];
    assign saida[111:104] = caixaS[bloco[111:104]];
    assign saida[119:112] = caixaS[bloco[119:112]];
    assign saida[127:120] = caixaS[bloco[127:120]];


endmodule