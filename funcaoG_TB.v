`timescale 1ns/1ps
module funcaoG_TB ();
    reg[31:0] palavra;
    reg[3:0] rodada;
    wire [31:0] saida;

    funcaoG dut(.palavra(palavra), .rodada(rodada), .saida(saida));

    initial begin
        palavra = 32'he6ffd3c6;
        rodada = 8'd2;
        #10

        if (saida == 32'h1266b48e)
            $display("funcaoG OK");
        else
            $display("funcaoG ERRO");
    end

endmodule