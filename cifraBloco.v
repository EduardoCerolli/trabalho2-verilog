module cifraBloco (
    input wire [127:0] bloco,
    input wire [1279:0] chaveExpandida,
    input wire [3:0] rodada,
    output wire [127:0] saida
);
    wire [127:0] saidaSB, saidaRL, saidaMC;
    wire [31:0] linha0, linha1, linha2, linha3;

    substituiBytes sb(.bloco(bloco), .saida(saidaSB));
    rotacionaLinhas rl (.bloco(saidaSB), .saida(saidaRL));
    multiplicaColunas mc (.bloco(saidaRL), .saida(saidaMC));

    assign linha0 = rodada == 4'd0 ? chaveExpandida[1279:1248] : 
                    rodada == 4'd1 ? chaveExpandida[1247:1216] :
                    rodada == 4'd2 ? chaveExpandida[1215:1184] :
                    rodada == 4'd3 ? chaveExpandida[1183:1152] :
                    rodada == 4'd4 ? chaveExpandida[1151:1120] :
                    rodada == 4'd5 ? chaveExpandida[1119:1088] :
                    rodada == 4'd6 ? chaveExpandida[1087:1056] :
                    rodada == 4'd7 ? chaveExpandida[1055:1024] :
                    rodada == 4'd8 ? chaveExpandida[1023:992] :
                    rodada == 4'd9 ? chaveExpandida[991:960] : 0;
    
    assign linha1 = rodada == 4'd0 ? chaveExpandida[959:928] :
                    rodada == 4'd1 ? chaveExpandida[927:896] :
                    rodada == 4'd2 ? chaveExpandida[895:864] :
                    rodada == 4'd3 ? chaveExpandida[863:832] :
                    rodada == 4'd4 ? chaveExpandida[831:800] :
                    rodada == 4'd5 ? chaveExpandida[799:768] :
                    rodada == 4'd6 ? chaveExpandida[767:736] :
                    rodada == 4'd7 ? chaveExpandida[735:704] :
                    rodada == 4'd8 ? chaveExpandida[703:672] :
                    rodada == 4'd9 ? chaveExpandida[671:640] : 0;

    assign linha2 = rodada == 4'd0 ? chaveExpandida[639:608] :
                    rodada == 4'd1 ? chaveExpandida[607:576] :
                    rodada == 4'd2 ? chaveExpandida[575:544] :
                    rodada == 4'd3 ? chaveExpandida[543:512] :
                    rodada == 4'd4 ? chaveExpandida[511:480] :
                    rodada == 4'd5 ? chaveExpandida[479:448] :
                    rodada == 4'd6 ? chaveExpandida[447:416] :
                    rodada == 4'd7 ? chaveExpandida[415:384] :
                    rodada == 4'd8 ? chaveExpandida[383:352] :
                    rodada == 4'd9 ? chaveExpandida[351:320] : 0;

    assign linha3 = rodada == 4'd0 ? chaveExpandida[319:288] :
                    rodada == 4'd1 ? chaveExpandida[287:256] :
                    rodada == 4'd2 ? chaveExpandida[255:224] :
                    rodada == 4'd3 ? chaveExpandida[223:192] :
                    rodada == 4'd4 ? chaveExpandida[191:160] :
                    rodada == 4'd5 ? chaveExpandida[159:128] :
                    rodada == 4'd6 ? chaveExpandida[127:96] :
                    rodada == 4'd7 ? chaveExpandida[95:64] :
                    rodada == 4'd8 ? chaveExpandida[63:32] :
                    rodada == 4'd9 ? chaveExpandida[31:0] : 0;

    assign saida[127:96] = saidaMC[127:96] ^ linha0;
    assign saida[95:64] = saidaMC[95:64] ^ linha1;
    assign saida[63:32] = saidaMC[63:32] ^ linha2;
    assign saida[31:0] = saidaMC[31:0] ^ linha3;

endmodule