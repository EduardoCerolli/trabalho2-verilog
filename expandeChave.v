module expandeChave (
    input wire[127:0] chave,
    output reg[1279:0] chaveExpandida
);
    wire [31:0] aux;
    wire[3:0] rodada = 4'd0;

    funcaoG fg(.palavra({chave[127:120], chave[95:88], chave[63:56], chave[31:24]}) .rodada(rodada), .saida(aux));
    initial begin
        // chaveExpandida[  0] = aux[0] ^ chave[0];
        // chaveExpandida[ 40] = aux[1] ^ chave[4];
        // chaveExpandida[ 80] = aux[2] ^ chave[8];
        // chaveExpandida[120] = aux[3] ^ chave[12];

        // chaveExpandida[  1] = chaveExpandida[  0] ^ chave[1];
        // chaveExpandida[ 41] = chaveExpandida[ 40] ^ chave[5];
        // chaveExpandida[ 81] = chaveExpandida[ 80] ^ chave[9];
        // chaveExpandida[121] = chaveExpandida[120] ^ chave[13];

        // chaveExpandida[  2] = chaveExpandida[  1] ^ chave[2];
        // chaveExpandida[ 42] = chaveExpandida[ 41] ^ chave[6];
        // chaveExpandida[ 82] = chaveExpandida[ 81] ^ chave[10];
        // chaveExpandida[122] = chaveExpandida[121] ^ chave[14];

        // chaveExpandida[  3] = chaveExpandida[  2] ^ chave[3];
        // chaveExpandida[ 43] = chaveExpandida[ 42] ^ chave[7];
        // chaveExpandida[ 83] = chaveExpandida[ 82] ^ chave[11];
        // chaveExpandida[123] = chaveExpandida[122] ^ chave[15];

        // for (int i = 4; i < 40; i+= 4)
        // {
        //     rodada++;
        //     funcaoG(aux, chaveExpandida[i - 1], chaveExpandida[40 + i - 1], chaveExpandida[80 +  i - 1], chaveExpandida[120 + i - 1], rodada);
        //     chaveExpandida[      i] = aux[0] ^ chaveExpandida[      i - 4];
        //     chaveExpandida[ 40 + i] = aux[1] ^ chaveExpandida[ 40 + i - 4];
        //     chaveExpandida[ 80 + i] = aux[2] ^ chaveExpandida[ 80 + i - 4];
        //     chaveExpandida[120 + i] = aux[3] ^ chaveExpandida[120 + i - 4];

        //     chaveExpandida[      i + 1] = chaveExpandida[      i + 1 - 1] ^ chaveExpandida[      i + 1 - 4];
        //     chaveExpandida[ 40 + i + 1] = chaveExpandida[ 40 + i + 1 - 1] ^ chaveExpandida[ 40 + i + 1 - 4];
        //     chaveExpandida[ 80 + i + 1] = chaveExpandida[ 80 + i + 1 - 1] ^ chaveExpandida[ 80 + i + 1 - 4];
        //     chaveExpandida[120 + i + 1] = chaveExpandida[120 + i + 1 - 1] ^ chaveExpandida[120 + i + 1 - 4];

        //     chaveExpandida[      i + 2] = chaveExpandida[      i + 2 - 1] ^ chaveExpandida[      i + 2 - 4];
        //     chaveExpandida[ 40 + i + 2] = chaveExpandida[ 40 + i + 2 - 1] ^ chaveExpandida[ 40 + i + 2 - 4];
        //     chaveExpandida[ 80 + i + 2] = chaveExpandida[ 80 + i + 2 - 1] ^ chaveExpandida[ 80 + i + 2 - 4];
        //     chaveExpandida[120 + i + 2] = chaveExpandida[120 + i + 2 - 1] ^ chaveExpandida[120 + i + 2 - 4];

        //     chaveExpandida[      i + 3] = chaveExpandida[      i + 3 - 1] ^ chaveExpandida[      i + 3 - 4];
        //     chaveExpandida[ 40 + i + 3] = chaveExpandida[ 40 + i + 3 - 1] ^ chaveExpandida[ 40 + i + 3 - 4];
        //     chaveExpandida[ 80 + i + 3] = chaveExpandida[ 80 + i + 3 - 1] ^ chaveExpandida[ 80 + i + 3 - 4];
        //     chaveExpandida[120 + i + 3] = chaveExpandida[120 + i + 3 - 1] ^ chaveExpandida[120 + i + 3 - 4];
        // }
    end
    
endmodule