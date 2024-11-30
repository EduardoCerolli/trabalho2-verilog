`timescale 1ns/1ps
module multiplicaGalois_TB ();
    
    reg [7:0] e; 
    reg [7:0] c;
    wire [7:0] s;

    multiplicaGalois DUT(.e(e), .c(c), .s(s));

    initial begin
        e = 8'h50;
        c = 8'h0E;
        #1
        if (s != 8'h4D) begin
            $display("multiplicaGalois ERRO");
            $finish;
        end

        e = 8'h41;
        c = 8'h0B;
        #1
        if (s != 8'hFD) begin
            $display("multiplicaGalois ERRO");
            $finish;
        end

        e = 8'h4c;
        c = 8'h0D;
        #1
        if (s != 8'h31) begin
            $display("multiplicaGalois ERRO");
            $finish;
        end

        e = 8'h41;
        c = 8'h09;
        #1
        if (s != 8'h7F) begin
            $display("multiplicaGalois ERRO");
            $finish;
        end

        $display("multiplicaGalois OK");
    end

endmodule