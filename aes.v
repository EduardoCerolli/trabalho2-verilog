`timescale 1ns/1ps
module aes #(parameter ARQ_DADOS = "dados.txt", ARQ_SENHA = "senha.txt", ARQ_SAIDA = "teste.txt") ();
    reg [127:0] bloco, chave;
    wire [127:0] blocoInv, chaveInv;
    wire [127:0] cifrado, cifradoInv;
    reg [7:0] buffer;

    inverteBloco iv1(.bloco(bloco), .saida(blocoInv));
    inverteBloco iv2(.bloco(chave), .saida(chaveInv));

    cifraBloco cb(.bloco(blocoInv), .chave(chaveInv), .saida(cifrado));

    inverteBloco iv3(.bloco(cifrado), .saida(cifradoInv));

    integer dados, senha, saida, tam, index;

    initial begin
        dados = $fopen(ARQ_DADOS, "r");
        senha = $fopen(ARQ_SENHA, "r");
        saida = $fopen(ARQ_SAIDA, "w");

        if (dados == 0) begin
            $display("Erro ao abrir o arquivo de dados.");
            $finish;
        end
        if (senha == 0) begin
            $display("Erro ao abrir o arquivo de chave.");
            $finish;
        end
        if (saida == 0) begin
            $display("Erro ao abrir o arquivo de saida.");
            $finish;
        end

        tam = $fread(chave, senha);
        if (tam != 16) begin
            $display("Chave inválida.");
            $finish;
        end

        while (!$feof(dados)) begin
            tam = $fread(bloco, dados);

            if (tam > 0) begin
                index = ((15 - tam ) * 8) + 7;
                for (integer i = index; i >= 0; i = i - 1)
                    bloco[i] = 1'b1;

                #1
                $fwrite(saida, "%s", cifradoInv);
            end
        end

        $fclose(dados);
        $fclose(senha);
        $fclose(saida);
    end

endmodule