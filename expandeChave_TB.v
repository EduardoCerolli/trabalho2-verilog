`timescale 1ns/1ps
module expandeChave_TB ();
    reg[127:0] chave;
    wire[1279:0] chaveExpandida;


    expandeChave DUT(.chave(chave), .chaveExpandida(chaveExpandida));

    initial begin
        chave = 128'h53414548454253454e4f53494841414e;
    end

endmodule