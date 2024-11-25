`timescale 1ns/1ps
module cifraBloco_TB ();
    
    reg [127:0] bloco, chave;
    wire [127:0] saida;

    cifraBloco DUT(.bloco(bloco), .chave(chave), .saida(saida));

    initial begin
        chave = 128'h53414548454253454e4f53494841414e;
        bloco = 128'h50564543415253494c41544641544552;
        
        #10
        if (saida == 128'hb6bde4499661f1653f0743cb77a06394)
            $display("cifraBloco OK");
        else
            $display("cifraBloco ERRO");
    end

endmodule