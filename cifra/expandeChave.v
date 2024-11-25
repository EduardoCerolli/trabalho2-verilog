module expandeChave (
    input wire[127:0] chave,
    output reg[1279:0] chaveExpandida
);
    reg [31:0] palavra;
    reg [3:0] rodada = 4'd0;
    integer indice, indice2, indice3;

    // Função G
    reg [7:0] rcon [0:9];
    caixaS cs();
    initial begin
        // Inicializa rcon
        rcon[0] = 8'd1;   rcon[1] = 8'd2;   rcon[2] = 8'd4;   rcon[3] = 8'd8;
        rcon[4] = 8'd16;  rcon[5] = 8'd32;  rcon[6] = 8'd64;  rcon[7] = 8'd128;
        rcon[8] = 8'd27;  rcon[9] = 8'd54;
    end

    always @(chave) begin
        palavra[31:24] = cs.caixaS[chave[71:64]]  ^ rcon[rodada];
        palavra[23:16] = cs.caixaS[chave[39:32]];
        palavra[15:8]  = cs.caixaS[chave[7:0]];
        palavra[7:0]   = cs.caixaS[chave[103:96]];

        chaveExpandida[1279:1272] = palavra[31:24] ^ chave[127:120];
        chaveExpandida[959:952] = palavra[23:16] ^ chave[95:88];
        chaveExpandida[639:632] = palavra[15:8] ^ chave[63:56];
        chaveExpandida[319:312] = palavra[7:0] ^ chave[31:24];

        chaveExpandida[1271:1264] = chaveExpandida[1279:1272] ^ chave[119:112];
        chaveExpandida[951:944] = chaveExpandida[959:952] ^ chave[87:80];
        chaveExpandida[631:624] = chaveExpandida[639:632] ^ chave[55:48];
        chaveExpandida[311:304] = chaveExpandida[319:312] ^ chave[23:16];

        chaveExpandida[1263:1256] = chaveExpandida[1271:1264] ^ chave[111:104];
        chaveExpandida[943:936] = chaveExpandida[951:944] ^ chave[79:72];
        chaveExpandida[623:616] = chaveExpandida[631:624] ^ chave[47:40];
        chaveExpandida[303:296] = chaveExpandida[311:304] ^ chave[15:8];

        chaveExpandida[1255:1248] = chaveExpandida[1263:1256] ^ chave[103:96];
        chaveExpandida[935:928] = chaveExpandida[943:936] ^ chave[71:64];
        chaveExpandida[615:608] = chaveExpandida[623:616] ^ chave[39:32];
        chaveExpandida[295:288] = chaveExpandida[303:296] ^ chave[7:0];

        rodada = 4'd0;
        for (integer i = 4; i < 40; i = i + 4) begin
            rodada = rodada + 1;
             
            indice = (159 - (40 + i - 1)) * 8;
            palavra[31:24] = cs.caixaS[{chaveExpandida[indice + 7], chaveExpandida[indice + 6], chaveExpandida[indice + 5], chaveExpandida[indice + 4],
                              chaveExpandida[indice + 3], chaveExpandida[indice + 2], chaveExpandida[indice + 1], chaveExpandida[indice]}] ^ rcon[rodada];

            indice = (159 - (80 + i - 1)) * 8;
            palavra[23:16] = cs.caixaS[{chaveExpandida[indice + 7], chaveExpandida[indice + 6], chaveExpandida[indice + 5], chaveExpandida[indice + 4],
                              chaveExpandida[indice + 3], chaveExpandida[indice + 2], chaveExpandida[indice + 1], chaveExpandida[indice]}];
                              
            indice = (159 - (120 + i - 1)) * 8;
            palavra[15:8] = cs.caixaS[{chaveExpandida[indice + 7], chaveExpandida[indice + 6], chaveExpandida[indice + 5], chaveExpandida[indice + 4],
                              chaveExpandida[indice + 3], chaveExpandida[indice + 2], chaveExpandida[indice + 1], chaveExpandida[indice]}];
                              
            indice = (159 - (i - 1)) * 8;
            palavra[7:0] = cs.caixaS[{chaveExpandida[indice + 7], chaveExpandida[indice + 6], chaveExpandida[indice + 5], chaveExpandida[indice + 4],
                              chaveExpandida[indice + 3], chaveExpandida[indice + 2], chaveExpandida[indice + 1], chaveExpandida[indice]}];

            // chaveExpandida[      i] = aux[0] ^ chaveExpandida[      i - 4];
            indice = (159 - i) * 8;
            indice2 = (159 - (i - 4)) * 8;
            chaveExpandida[indice + 7] = palavra[31] ^ chaveExpandida[indice2 + 7];
            chaveExpandida[indice + 6] = palavra[30] ^ chaveExpandida[indice2 + 6];
            chaveExpandida[indice + 5] = palavra[29] ^ chaveExpandida[indice2 + 5];
            chaveExpandida[indice + 4] = palavra[28] ^ chaveExpandida[indice2 + 4];
            chaveExpandida[indice + 3] = palavra[27] ^ chaveExpandida[indice2 + 3];
            chaveExpandida[indice + 2] = palavra[26] ^ chaveExpandida[indice2 + 2];
            chaveExpandida[indice + 1] = palavra[25] ^ chaveExpandida[indice2 + 1];
            chaveExpandida[indice] = palavra[24] ^ chaveExpandida[indice2];

            // chaveExpandida[ 40 + i] = aux[1] ^ chaveExpandida[ 40 + i - 4];
            indice = (159 - (40 + i)) * 8;
            indice2 = (159 - (40 + i - 4)) * 8;
            chaveExpandida[indice + 7] = palavra[23] ^ chaveExpandida[indice2 + 7];
            chaveExpandida[indice + 6] = palavra[22] ^ chaveExpandida[indice2 + 6];
            chaveExpandida[indice + 5] = palavra[21] ^ chaveExpandida[indice2 + 5];
            chaveExpandida[indice + 4] = palavra[20] ^ chaveExpandida[indice2 + 4];
            chaveExpandida[indice + 3] = palavra[19] ^ chaveExpandida[indice2 + 3];
            chaveExpandida[indice + 2] = palavra[18] ^ chaveExpandida[indice2 + 2];
            chaveExpandida[indice + 1] = palavra[17] ^ chaveExpandida[indice2 + 1];
            chaveExpandida[indice] = palavra[16] ^ chaveExpandida[indice2];

            // chaveExpandida[ 80 + i] = aux[2] ^ chaveExpandida[ 80 + i - 4];
            indice = (159 - (80 + i)) * 8;
            indice2 = (159 - (80 + i - 4)) * 8;
            chaveExpandida[indice + 7] = palavra[15] ^ chaveExpandida[indice2 + 7];
            chaveExpandida[indice + 6] = palavra[14] ^ chaveExpandida[indice2 + 6];
            chaveExpandida[indice + 5] = palavra[13] ^ chaveExpandida[indice2 + 5];
            chaveExpandida[indice + 4] = palavra[12] ^ chaveExpandida[indice2 + 4];
            chaveExpandida[indice + 3] = palavra[11] ^ chaveExpandida[indice2 + 3];
            chaveExpandida[indice + 2] = palavra[10] ^ chaveExpandida[indice2 + 2];
            chaveExpandida[indice + 1] = palavra[9] ^ chaveExpandida[indice2 + 1];
            chaveExpandida[indice] = palavra[8] ^ chaveExpandida[indice2];

            // chaveExpandida[120 + i] = aux[3] ^ chaveExpandida[120 + i - 4];
            indice = (159 - (120 + i)) * 8;
            indice2 = (159 - (120 + i - 4)) * 8;
            chaveExpandida[indice + 7] = palavra[7] ^ chaveExpandida[indice2 + 7];
            chaveExpandida[indice + 6] = palavra[6] ^ chaveExpandida[indice2 + 6];
            chaveExpandida[indice + 5] = palavra[5] ^ chaveExpandida[indice2 + 5];
            chaveExpandida[indice + 4] = palavra[4] ^ chaveExpandida[indice2 + 4];
            chaveExpandida[indice + 3] = palavra[3] ^ chaveExpandida[indice2 + 3];
            chaveExpandida[indice + 2] = palavra[2] ^ chaveExpandida[indice2 + 2];
            chaveExpandida[indice + 1] = palavra[1] ^ chaveExpandida[indice2 + 1];
            chaveExpandida[indice] = palavra[0] ^ chaveExpandida[indice2];


            // chaveExpandida[      i + 1] = chaveExpandida[      i + 1 - 1] ^ chaveExpandida[      i + 1 - 4];
            indice = (159 - (i + 1)) * 8;
            indice2 = (159 - (i + 1 - 1)) * 8;
            indice3 = (159 - (i + 1 - 4)) * 8;
            chaveExpandida[indice + 7] = chaveExpandida[indice2 + 7] ^ chaveExpandida[indice3 + 7];
            chaveExpandida[indice + 6] = chaveExpandida[indice2 + 6] ^ chaveExpandida[indice3 + 6];
            chaveExpandida[indice + 5] = chaveExpandida[indice2 + 5] ^ chaveExpandida[indice3 + 5];
            chaveExpandida[indice + 4] = chaveExpandida[indice2 + 4] ^ chaveExpandida[indice3 + 4];
            chaveExpandida[indice + 3] = chaveExpandida[indice2 + 3] ^ chaveExpandida[indice3 + 3];
            chaveExpandida[indice + 2] = chaveExpandida[indice2 + 2] ^ chaveExpandida[indice3 + 2];
            chaveExpandida[indice + 1] = chaveExpandida[indice2 + 1] ^ chaveExpandida[indice3 + 1];
            chaveExpandida[indice] = chaveExpandida[indice2] ^ chaveExpandida[indice3];

            // chaveExpandida[ 40 + i + 1] = chaveExpandida[ 40 + i + 1 - 1] ^ chaveExpandida[ 40 + i + 1 - 4];
            indice = (159 - (40 + i + 1)) * 8;
            indice2 = (159 - (40 + i + 1 - 1)) * 8;
            indice3 = (159 - (40 + i + 1 - 4)) * 8;
            chaveExpandida[indice + 7] = chaveExpandida[indice2 + 7] ^ chaveExpandida[indice3 + 7];
            chaveExpandida[indice + 6] = chaveExpandida[indice2 + 6] ^ chaveExpandida[indice3 + 6];
            chaveExpandida[indice + 5] = chaveExpandida[indice2 + 5] ^ chaveExpandida[indice3 + 5];
            chaveExpandida[indice + 4] = chaveExpandida[indice2 + 4] ^ chaveExpandida[indice3 + 4];
            chaveExpandida[indice + 3] = chaveExpandida[indice2 + 3] ^ chaveExpandida[indice3 + 3];
            chaveExpandida[indice + 2] = chaveExpandida[indice2 + 2] ^ chaveExpandida[indice3 + 2];
            chaveExpandida[indice + 1] = chaveExpandida[indice2 + 1] ^ chaveExpandida[indice3 + 1];
            chaveExpandida[indice] = chaveExpandida[indice2] ^ chaveExpandida[indice3];

            // chaveExpandida[ 80 + i + 1] = chaveExpandida[ 80 + i + 1 - 1] ^ chaveExpandida[ 80 + i + 1 - 4];
            indice = (159 - (80 + i + 1)) * 8;
            indice2 = (159 - (80 + i + 1 - 1)) * 8;
            indice3 = (159 - (80 + i + 1 - 4)) * 8;
            chaveExpandida[indice + 7] = chaveExpandida[indice2 + 7] ^ chaveExpandida[indice3 + 7];
            chaveExpandida[indice + 6] = chaveExpandida[indice2 + 6] ^ chaveExpandida[indice3 + 6];
            chaveExpandida[indice + 5] = chaveExpandida[indice2 + 5] ^ chaveExpandida[indice3 + 5];
            chaveExpandida[indice + 4] = chaveExpandida[indice2 + 4] ^ chaveExpandida[indice3 + 4];
            chaveExpandida[indice + 3] = chaveExpandida[indice2 + 3] ^ chaveExpandida[indice3 + 3];
            chaveExpandida[indice + 2] = chaveExpandida[indice2 + 2] ^ chaveExpandida[indice3 + 2];
            chaveExpandida[indice + 1] = chaveExpandida[indice2 + 1] ^ chaveExpandida[indice3 + 1];
            chaveExpandida[indice] = chaveExpandida[indice2] ^ chaveExpandida[indice3];

            // chaveExpandida[120 + i + 1] = chaveExpandida[120 + i + 1 - 1] ^ chaveExpandida[120 + i + 1 - 4];
            indice = (159 - (120 + i + 1)) * 8;
            indice2 = (159 - (120 + i + 1 - 1)) * 8;
            indice3 = (159 - (120 + i + 1 - 4)) * 8;
            chaveExpandida[indice + 7] = chaveExpandida[indice2 + 7] ^ chaveExpandida[indice3 + 7];
            chaveExpandida[indice + 6] = chaveExpandida[indice2 + 6] ^ chaveExpandida[indice3 + 6];
            chaveExpandida[indice + 5] = chaveExpandida[indice2 + 5] ^ chaveExpandida[indice3 + 5];
            chaveExpandida[indice + 4] = chaveExpandida[indice2 + 4] ^ chaveExpandida[indice3 + 4];
            chaveExpandida[indice + 3] = chaveExpandida[indice2 + 3] ^ chaveExpandida[indice3 + 3];
            chaveExpandida[indice + 2] = chaveExpandida[indice2 + 2] ^ chaveExpandida[indice3 + 2];
            chaveExpandida[indice + 1] = chaveExpandida[indice2 + 1] ^ chaveExpandida[indice3 + 1];
            chaveExpandida[indice] = chaveExpandida[indice2] ^ chaveExpandida[indice3];

            // chaveExpandida[      i + 2] = chaveExpandida[      i + 2 - 1] ^ chaveExpandida[      i + 2 - 4];
            indice = (159 - (i + 2)) * 8;
            indice2 = (159 - (i + 2 - 1)) * 8;
            indice3 = (159 - (i + 2 - 4)) * 8;
            chaveExpandida[indice + 7] = chaveExpandida[indice2 + 7] ^ chaveExpandida[indice3 + 7];
            chaveExpandida[indice + 6] = chaveExpandida[indice2 + 6] ^ chaveExpandida[indice3 + 6];
            chaveExpandida[indice + 5] = chaveExpandida[indice2 + 5] ^ chaveExpandida[indice3 + 5];
            chaveExpandida[indice + 4] = chaveExpandida[indice2 + 4] ^ chaveExpandida[indice3 + 4];
            chaveExpandida[indice + 3] = chaveExpandida[indice2 + 3] ^ chaveExpandida[indice3 + 3];
            chaveExpandida[indice + 2] = chaveExpandida[indice2 + 2] ^ chaveExpandida[indice3 + 2];
            chaveExpandida[indice + 1] = chaveExpandida[indice2 + 1] ^ chaveExpandida[indice3 + 1];
            chaveExpandida[indice] = chaveExpandida[indice2] ^ chaveExpandida[indice3];

            // chaveExpandida[ 40 + i + 2] = chaveExpandida[ 40 + i + 2 - 1] ^ chaveExpandida[ 40 + i + 2 - 4];
            indice = (159 - (40 + i + 2)) * 8;
            indice2 = (159 - (40 + i + 2 - 1)) * 8;
            indice3 = (159 - (40 + i + 2 - 4)) * 8;
            chaveExpandida[indice + 7] = chaveExpandida[indice2 + 7] ^ chaveExpandida[indice3 + 7];
            chaveExpandida[indice + 6] = chaveExpandida[indice2 + 6] ^ chaveExpandida[indice3 + 6];
            chaveExpandida[indice + 5] = chaveExpandida[indice2 + 5] ^ chaveExpandida[indice3 + 5];
            chaveExpandida[indice + 4] = chaveExpandida[indice2 + 4] ^ chaveExpandida[indice3 + 4];
            chaveExpandida[indice + 3] = chaveExpandida[indice2 + 3] ^ chaveExpandida[indice3 + 3];
            chaveExpandida[indice + 2] = chaveExpandida[indice2 + 2] ^ chaveExpandida[indice3 + 2];
            chaveExpandida[indice + 1] = chaveExpandida[indice2 + 1] ^ chaveExpandida[indice3 + 1];
            chaveExpandida[indice] = chaveExpandida[indice2] ^ chaveExpandida[indice3];

            // chaveExpandida[ 80 + i + 2] = chaveExpandida[ 80 + i + 2 - 1] ^ chaveExpandida[ 80 + i + 2 - 4];
            indice = (159 - (80 + i + 2)) * 8;
            indice2 = (159 - (80 + i + 2 - 1)) * 8;
            indice3 = (159 - (80 + i + 2 - 4)) * 8;
            chaveExpandida[indice + 7] = chaveExpandida[indice2 + 7] ^ chaveExpandida[indice3 + 7];
            chaveExpandida[indice + 6] = chaveExpandida[indice2 + 6] ^ chaveExpandida[indice3 + 6];
            chaveExpandida[indice + 5] = chaveExpandida[indice2 + 5] ^ chaveExpandida[indice3 + 5];
            chaveExpandida[indice + 4] = chaveExpandida[indice2 + 4] ^ chaveExpandida[indice3 + 4];
            chaveExpandida[indice + 3] = chaveExpandida[indice2 + 3] ^ chaveExpandida[indice3 + 3];
            chaveExpandida[indice + 2] = chaveExpandida[indice2 + 2] ^ chaveExpandida[indice3 + 2];
            chaveExpandida[indice + 1] = chaveExpandida[indice2 + 1] ^ chaveExpandida[indice3 + 1];
            chaveExpandida[indice] = chaveExpandida[indice2] ^ chaveExpandida[indice3];

            // chaveExpandida[120 + i + 2] = chaveExpandida[120 + i + 2 - 1] ^ chaveExpandida[120 + i + 2 - 4];
            indice = (159 - (120 + i + 2)) * 8;
            indice2 = (159 - (120 + i + 2 - 1)) * 8;
            indice3 = (159 - (120 + i + 2 - 4)) * 8;
            chaveExpandida[indice + 7] = chaveExpandida[indice2 + 7] ^ chaveExpandida[indice3 + 7];
            chaveExpandida[indice + 6] = chaveExpandida[indice2 + 6] ^ chaveExpandida[indice3 + 6];
            chaveExpandida[indice + 5] = chaveExpandida[indice2 + 5] ^ chaveExpandida[indice3 + 5];
            chaveExpandida[indice + 4] = chaveExpandida[indice2 + 4] ^ chaveExpandida[indice3 + 4];
            chaveExpandida[indice + 3] = chaveExpandida[indice2 + 3] ^ chaveExpandida[indice3 + 3];
            chaveExpandida[indice + 2] = chaveExpandida[indice2 + 2] ^ chaveExpandida[indice3 + 2];
            chaveExpandida[indice + 1] = chaveExpandida[indice2 + 1] ^ chaveExpandida[indice3 + 1];
            chaveExpandida[indice] = chaveExpandida[indice2] ^ chaveExpandida[indice3];

            // chaveExpandida[      i + 3] = chaveExpandida[      i + 3 - 1] ^ chaveExpandida[      i + 3 - 4];
            indice = (159 - (i + 3)) * 8;
            indice2 = (159 - (i + 3 - 1)) * 8;
            indice3 = (159 - (i + 3 - 4)) * 8;
            chaveExpandida[indice + 7] = chaveExpandida[indice2 + 7] ^ chaveExpandida[indice3 + 7];
            chaveExpandida[indice + 6] = chaveExpandida[indice2 + 6] ^ chaveExpandida[indice3 + 6];
            chaveExpandida[indice + 5] = chaveExpandida[indice2 + 5] ^ chaveExpandida[indice3 + 5];
            chaveExpandida[indice + 4] = chaveExpandida[indice2 + 4] ^ chaveExpandida[indice3 + 4];
            chaveExpandida[indice + 3] = chaveExpandida[indice2 + 3] ^ chaveExpandida[indice3 + 3];
            chaveExpandida[indice + 2] = chaveExpandida[indice2 + 2] ^ chaveExpandida[indice3 + 2];
            chaveExpandida[indice + 1] = chaveExpandida[indice2 + 1] ^ chaveExpandida[indice3 + 1];
            chaveExpandida[indice] = chaveExpandida[indice2] ^ chaveExpandida[indice3];

            // chaveExpandida[ 40 + i + 3] = chaveExpandida[ 40 + i + 3 - 1] ^ chaveExpandida[ 40 + i + 3 - 4];
            indice = (159 - (40 + i + 3)) * 8;
            indice2 = (159 - (40 + i + 3 - 1)) * 8;
            indice3 = (159 - (40 + i + 3 - 4)) * 8;
            chaveExpandida[indice + 7] = chaveExpandida[indice2 + 7] ^ chaveExpandida[indice3 + 7];
            chaveExpandida[indice + 6] = chaveExpandida[indice2 + 6] ^ chaveExpandida[indice3 + 6];
            chaveExpandida[indice + 5] = chaveExpandida[indice2 + 5] ^ chaveExpandida[indice3 + 5];
            chaveExpandida[indice + 4] = chaveExpandida[indice2 + 4] ^ chaveExpandida[indice3 + 4];
            chaveExpandida[indice + 3] = chaveExpandida[indice2 + 3] ^ chaveExpandida[indice3 + 3];
            chaveExpandida[indice + 2] = chaveExpandida[indice2 + 2] ^ chaveExpandida[indice3 + 2];
            chaveExpandida[indice + 1] = chaveExpandida[indice2 + 1] ^ chaveExpandida[indice3 + 1];
            chaveExpandida[indice] = chaveExpandida[indice2] ^ chaveExpandida[indice3];

            // chaveExpandida[ 80 + i + 3] = chaveExpandida[ 80 + i + 3 - 1] ^ chaveExpandida[ 80 + i + 3 - 4];
            indice = (159 - (80 + i + 3)) * 8;
            indice2 = (159 - (80 + i + 3 - 1)) * 8;
            indice3 = (159 - (80 + i + 3 - 4)) * 8;
            chaveExpandida[indice + 7] = chaveExpandida[indice2 + 7] ^ chaveExpandida[indice3 + 7];
            chaveExpandida[indice + 6] = chaveExpandida[indice2 + 6] ^ chaveExpandida[indice3 + 6];
            chaveExpandida[indice + 5] = chaveExpandida[indice2 + 5] ^ chaveExpandida[indice3 + 5];
            chaveExpandida[indice + 4] = chaveExpandida[indice2 + 4] ^ chaveExpandida[indice3 + 4];
            chaveExpandida[indice + 3] = chaveExpandida[indice2 + 3] ^ chaveExpandida[indice3 + 3];
            chaveExpandida[indice + 2] = chaveExpandida[indice2 + 2] ^ chaveExpandida[indice3 + 2];
            chaveExpandida[indice + 1] = chaveExpandida[indice2 + 1] ^ chaveExpandida[indice3 + 1];
            chaveExpandida[indice] = chaveExpandida[indice2] ^ chaveExpandida[indice3];

            // chaveExpandida[120 + i + 3] = chaveExpandida[120 + i + 3 - 1] ^ chaveExpandida[120 + i + 3 - 4];
            indice = (159 - (120 + i + 3)) * 8;
            indice2 = (159 - (120 + i + 3 - 1)) * 8;
            indice3 = (159 - (120 + i + 3 - 4)) * 8;
            chaveExpandida[indice + 7] = chaveExpandida[indice2 + 7] ^ chaveExpandida[indice3 + 7];
            chaveExpandida[indice + 6] = chaveExpandida[indice2 + 6] ^ chaveExpandida[indice3 + 6];
            chaveExpandida[indice + 5] = chaveExpandida[indice2 + 5] ^ chaveExpandida[indice3 + 5];
            chaveExpandida[indice + 4] = chaveExpandida[indice2 + 4] ^ chaveExpandida[indice3 + 4];
            chaveExpandida[indice + 3] = chaveExpandida[indice2 + 3] ^ chaveExpandida[indice3 + 3];
            chaveExpandida[indice + 2] = chaveExpandida[indice2 + 2] ^ chaveExpandida[indice3 + 2];
            chaveExpandida[indice + 1] = chaveExpandida[indice2 + 1] ^ chaveExpandida[indice3 + 1];
            chaveExpandida[indice] = chaveExpandida[indice2] ^ chaveExpandida[indice3];
        end
    end
    
endmodule