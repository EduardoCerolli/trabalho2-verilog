module decifra #(parameter ARQ_DADOS = "teste.txt", ARQ_SENHA = "senha.txt", ARQ_SAIDA = "decifrado.txt") ();
    reg [127:0] bloco, chave;
    wire [127:0] blocoInv, chaveInv;
    wire [127:0] decifrado, decifradoInv;
    reg [7:0] buffer;

    inverteBloco iv1(.bloco(bloco), .saida(blocoInv));
    inverteBloco iv2(.bloco(chave), .saida(chaveInv));

    decifraBloco cb(.bloco(blocoInv), .chave(chaveInv), .saida(decifrado));

    inverteBloco iv3(.bloco(decifrado), .saida(decifradoInv));

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
                $fwrite(saida, "%s", decifradoInv);
            end
        end

        $fclose(dados);
        $fclose(senha);
        $fclose(saida);
    end

endmodule