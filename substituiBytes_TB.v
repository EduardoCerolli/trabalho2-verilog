`timescale 1ns/1ps
module substituiBytes_TB ();
    reg [127:0] bloco;
    wire [127:0] saida;

    substituiBytes DUT (.bloco(bloco), .saida(saida));

    initial begin
        bloco = 256'h50414c41565241544553544543494652;
        #10

        if (saida == 256'h53832983b10083206eed206e1a3b5a00)
            $display("substituiBytes OK");
        else
            $display("substituiBytes ERRO");

    end
    
endmodule