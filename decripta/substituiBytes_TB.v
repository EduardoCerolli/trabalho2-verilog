`timescale 1ns/1ps
module substituiBytes_TB ();
    reg [127:0] bloco;
    wire [127:0] saida;

    substituiBytes DUT (.bloco(bloco), .saida(saida));

    initial begin
        bloco = 128'h50414c41565241544553544543494652;
        #10

        if (saida == 128'h6cf85df8b948f8fd6850fd6864a49848)
            $display("substituiBytes OK");
        else
            $display("substituiBytes ERRO");

    end
    
endmodule