`timescale 1ns/1ps
module substituiBytes_TB ();
    reg [127:0] bloco;
    wire [127:0] saida;
    reg erro = 0;

    substituiBytes DUT (.bloco(bloco), .saida(saida));

    initial begin
        bloco[7:0] = 8'h50;
        bloco[15:8] = 8'h41;
        bloco[23:16] = 8'h4c;
        bloco[31:24] = 8'h41;
        bloco[39:32] = 8'h56;
        bloco[47:40] = 8'h52;
        bloco[55:48] = 8'h41;
        bloco[63:56] = 8'h54;
        bloco[71:64] = 8'h45;
        bloco[79:72] = 8'h53;
        bloco[87:80] = 8'h54;
        bloco[95:88] = 8'h45;
        bloco[103:96] = 8'h43;
        bloco[111:104] = 8'h49;
        bloco[119:112] = 8'h46;
        bloco[127:120] = 8'h52;
        #10

        if (saida[7:0] != 8'h53) erro = 1; 
        if (saida[15:8] != 8'h83) erro = 1; 
        if (saida[23:16] != 8'h29) erro = 1; 
        if (saida[31:24] != 8'h83) erro = 1; 
        if (saida[39:32] != 8'hb1) erro = 1; 
        if (saida[47:40] != 8'h00) erro = 1; 
        if (saida[55:48] != 8'h83) erro = 1; 
        if (saida[63:56] != 8'h20) erro = 1; 
        if (saida[71:64] != 8'h6e) erro = 1; 
        if (saida[79:72] != 8'hed) erro = 1; 
        if (saida[87:80] != 8'h20) erro = 1; 
        if (saida[95:88] != 8'h6e) erro = 1; 
        if (saida[103:96] != 8'h1a) erro = 1; 
        if (saida[111:104] != 8'h3b) erro = 1; 
        if (saida[119:112] != 8'h5a) erro = 1; 
        if (saida[127:120] != 8'h00) erro = 1; 

        if (erro == 0)
            $display("substituiBytes OK");
        else
            $display("substituiBytes ERRO");

    end
    
endmodule