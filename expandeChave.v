module expandeChave (
    input wire[127:0] chave,
    output wire[1279:0] chaveExpandida
);
    wire [31:0] palavra, aux;
    wire [3:0] rodada = 4'd0;

    assign palavra[31:24] = chave[127:120];
    assign palavra[23:16] = chave[95:88];
    assign palavra[15:8] = chave[63:56];
    assign palavra[7:0] = chave[31:24];

    funcaoG fg(.palavra(palavra), .rodada(rodada), .saida(aux));

    assign chaveExpandida[7:0] = aux[7:0] ^ chave[7:0];
    assign chaveExpandida[327:320] = aux[15:8] ^ chave[39:32];
    assign chaveExpandida[647:640] = aux[23:16] ^ chave[71:64];
    assign chaveExpandida[967:960] = aux[31:24] ^ chave[103:96];

    assign chaveExpandida[15:8] = chaveExpandida[7:0] ^ chave[15:8];
    assign chaveExpandida[335:328] = chaveExpandida[327:320] ^ chave[47:40];
    assign chaveExpandida[655:648] = chaveExpandida[647:640] ^ chave[79:72];
    assign chaveExpandida[975:968] = chaveExpandida[967:960] ^ chave[111:104];

    assign chaveExpandida[23:16] = chaveExpandida[15:8] ^ chave[23:16];
    assign chaveExpandida[343:336] = chaveExpandida[335:328] ^ chave[55:48];
    assign chaveExpandida[663:656] = chaveExpandida[655:648] ^ chave[87:80];
    assign chaveExpandida[983:976] = chaveExpandida[975:968] ^ chave[119:112];

    assign chaveExpandida[31:24] = chaveExpandida[23:16] ^ chave[31:24];
    assign chaveExpandida[351:344] = chaveExpandida[343:336] ^ chave[63:56];
    assign chaveExpandida[671:664] = chaveExpandida[663:656] ^ chave[95:88];
    assign chaveExpandida[991:984] = chaveExpandida[983:976] ^ chave[127:120];

    // initial begin
  

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
    // end
    
endmodule