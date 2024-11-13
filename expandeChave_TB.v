`timescale 1ns/1ps
module expandeChave_TB ();
    reg[127:0] chave;
    wire[1279:0] chaveExpandida;


    expandeChave DUT(.chave(chave), .chaveExpandida(chaveExpandida));

    initial begin
        chave = 128'h53454e4841424f41455353414845494e;
        #10

        $display("%h", chaveExpandida[7:0]);        
    end

endmodule