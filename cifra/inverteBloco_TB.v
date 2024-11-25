`timescale 1ns/1ps
module inverteBloco_TB ();

    reg [127:0] bloco;
    wire [127:0] saida;

    inverteBloco DUT(.bloco(bloco), .saida(saida));

    initial begin
        bloco = 128'h50414c41565241544553544543494652;

        #10
        if (saida == 128'h50564543415253494c41544641544552)
            $display("inverteBloco OK");
        else
            $display("inverteBloco ERRO");
    end
    
endmodule