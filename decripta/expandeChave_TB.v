`timescale 1ns/1ps
module expandeChave_TB ();
    reg[127:0] chave;
    wire[1279:0] chaveExpandida;


    expandeChave DUT(.chave(chave), .chaveExpandida(chaveExpandida));

    initial begin
        chave = 128'h53414548454253454e4f53494841414e;
        #10
        if (chaveExpandida == 1280'h3c7d3870dba69eee1fb927c9ef5671b8065021995c0c2db4434f62d65f1072a4ecfc8e2a778b052f7e3c6f2a665a351f91cbfee1bd7688692a5cd4bdb1ed39844ca1981c4aeb736fef047718e9ed9a82612e7d34416f122619766442d5a3c78509aa6de80ea4c921e94d84a545088c2908008ca5abab27821a5b1a544b100a5e63737927becdb493d21fab383c2388b0b1921aaa47d5cf650edb1471eb302455)
            $display("expandeChave OK");
        else
            $display("expandeChave ERRO");
    end

endmodule