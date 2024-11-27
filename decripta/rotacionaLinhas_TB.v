`timescale 1ns/1ps
module rotacionaLinhas_TB ();
    reg [127:0] bloco;
    wire [127:0] saida;

    rotacionaLinhas DUT (.bloco(bloco), .saida(saida));

    initial begin
        bloco = 128'h50564543415253494c41544641544552;
        #10

        if (saida == 128'h505645434941525354464c4154455241)
            $display("rotacionaLinhas OK");
        else
            $display("rotacionaLinhas ERRO");
    end

endmodule