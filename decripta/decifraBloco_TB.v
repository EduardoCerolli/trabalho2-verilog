`timescale 1ns/1ps
module decifraBloco_TB ();
    
    reg [127:0] bloco, chave;
    wire [127:0] saida;

    decifraBloco DUT(.bloco(bloco), .chave(chave), .saida(saida));

    initial begin
        chave = 128'h53414548454253454e4f53494841414e;
        bloco = 128'h50564543415253494c41544641544552;
        
        #10
        if (saida == 128'h7703e46f572678cb70bce952c3c91984)
            $display("decifraBloco OK");
        else    
            $display("decifraBloco ERRO");
    end

endmodule