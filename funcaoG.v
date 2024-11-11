module funcaoG (
    input wire[31:0] palavra, 
    input wire[3:0] rodada,
    output wire [31:0] saida
);
    
    reg [7:0] rcon [0:9];
    caixaS cs();

    initial begin
        // Inicializa rcon
        rcon[0] = 8'd1;   rcon[1] = 8'd2;   rcon[2] = 8'd4;   rcon[3] = 8'd8;
        rcon[4] = 8'd16;  rcon[5] = 8'd32;  rcon[6] = 8'd64;  rcon[7] = 8'd128;
        rcon[8] = 8'd27;  rcon[9] = 8'd54;
    end

    assign saida[31:24] = cs.caixaS[palavra[23:16]]  ^ rcon[rodada];
    assign saida[23:16] = cs.caixaS[palavra[15:8]];
    assign saida[15:8]  = cs.caixaS[palavra[7:0]];
    assign saida[7:0]   = cs.caixaS[palavra[31:24]];

endmodule