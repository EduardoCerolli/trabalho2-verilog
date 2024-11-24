`timescale 1ns/1ps
module aes ();
    reg [127:0] bloco, chave;
    wire [127:0] blocoInv, chaveInv;
    wire [127:0] cifrado, cifradoInv;

    inverteBloco iv1(.bloco(bloco), .saida(blocoInv));
    inverteBloco iv2(.bloco(chave), .saida(chaveInv));

    cifraBloco cb(.bloco(blocoInv), .chave(chaveInv), .saida(cifrado));

    inverteBloco iv3(.bloco(cifrado), .saida(cifradoInv));

    integer dados, senha, saida, res_scan;

    initial begin
        dados = $fopen("hexa.txt", "r");
        senha = $fopen("senhaHexa.txt", "r");
        saida = $fopen("teste.txt", "w");

        res_scan = $fscanf(dados, "%h", bloco);
        res_scan = $fscanf(senha, "%h", chave);

        #10
        $display("%h", cifradoInv);
    end

endmodule