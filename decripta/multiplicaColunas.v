module multiplicaColunas (
    input wire[127:0] bloco,
    output wire [127:0] saida
);
      
    // saida[0]
    wire [7:0] s0_0, s0_1, s0_2, s0_3;
    multiplicaGalois mg0_0 (.e(bloco[127:120]), .c(8'h0E), .s(s0_0));
    multiplicaGalois mg0_1 (.e(bloco[95:88]), .c(8'h0B), .s(s0_1));
    multiplicaGalois mg0_2 (.e(bloco[63:56]), .c(8'h0D), .s(s0_2));
    multiplicaGalois mg0_3 (.e(bloco[31:24]), .c(8'h09), .s(s0_3));
    assign saida[127:120] = s0_0 ^ s0_1 ^ s0_2 ^ s0_3;

    // saida[1]
    wire [7:0] s1_0, s1_1, s1_2, s1_3;
    multiplicaGalois mg1_0 (.e(bloco[119:112]), .c(8'h0E), .s(s1_0));
    multiplicaGalois mg1_1 (.e(bloco[87:80]), .c(8'h0B), .s(s1_1));
    multiplicaGalois mg1_2 (.e(bloco[55:48]), .c(8'h0D), .s(s1_2));
    multiplicaGalois mg1_3 (.e(bloco[23:16]), .c(8'h09), .s(s1_3));
    assign saida[119:112] = s1_0 ^ s1_1 ^ s1_2 ^ s1_3;

    // saida[2]
    wire [7:0] s2_0, s2_1, s2_2, s2_3;
    multiplicaGalois mg2_0 (.e(bloco[111:104]), .c(8'h0E), .s(s2_0));
    multiplicaGalois mg2_1 (.e(bloco[79:72]), .c(8'h0B), .s(s2_1));
    multiplicaGalois mg2_2 (.e(bloco[47:40]), .c(8'h0D), .s(s2_2));
    multiplicaGalois mg2_3 (.e(bloco[15:8]), .c(8'h09), .s(s2_3));
    assign saida[111:104] = s2_0 ^ s2_1 ^ s2_2 ^ s2_3;

    // saida[3]
    wire [7:0] s3_0, s3_1, s3_2, s3_3;
    multiplicaGalois mg3_0 (.e(bloco[103:96]), .c(8'h0E), .s(s3_0));
    multiplicaGalois mg3_1 (.e(bloco[71:64]), .c(8'h0B), .s(s3_1));
    multiplicaGalois mg3_2 (.e(bloco[39:32]), .c(8'h0D), .s(s3_2));
    multiplicaGalois mg3_3 (.e(bloco[7:0]), .c(8'h09), .s(s3_3));
    assign saida[103:96] = s3_0 ^ s3_1 ^ s3_2 ^ s3_3;
    
    // saida[4]
    wire [7:0] s4_0, s4_1, s4_2, s4_3;
    multiplicaGalois mg4_0 (.e(bloco[127:120]), .c(8'h09), .s(s4_0));
    multiplicaGalois mg4_1 (.e(bloco[95:88]), .c(8'h0E), .s(s4_1));
    multiplicaGalois mg4_2 (.e(bloco[63:56]), .c(8'h0B), .s(s4_2));
    multiplicaGalois mg4_3 (.e(bloco[31:24]), .c(8'h0D), .s(s4_3));
    assign saida[95:88] = s4_0 ^ s4_1 ^ s4_2 ^ s4_3;

    // saida[5]
    wire [7:0] s5_0, s5_1, s5_2, s5_3;
    multiplicaGalois mg5_0 (.e(bloco[119:112]), .c(8'h09), .s(s5_0));
    multiplicaGalois mg5_1 (.e(bloco[87:80]), .c(8'h0E), .s(s5_1));
    multiplicaGalois mg5_2 (.e(bloco[55:48]), .c(8'h0B), .s(s5_2));
    multiplicaGalois mg5_3 (.e(bloco[23:16]), .c(8'h0D), .s(s5_3));
    assign saida[87:80] = s5_0 ^ s5_1 ^ s5_2 ^ s5_3;

    // saida[6]
    wire [7:0] s6_0, s6_1, s6_2, s6_3;
    multiplicaGalois mg6_0 (.e(bloco[111:104]), .c(8'h09), .s(s6_0));
    multiplicaGalois mg6_1 (.e(bloco[79:72]), .c(8'h0E), .s(s6_1));
    multiplicaGalois mg6_2 (.e(bloco[47:40]), .c(8'h0B), .s(s6_2));
    multiplicaGalois mg6_3 (.e(bloco[15:8]), .c(8'h0D), .s(s6_3));
    assign saida[79:72] = s6_0 ^ s6_1 ^ s6_2 ^ s6_3;

    // saida[7]
    wire [7:0] s7_0, s7_1, s7_2, s7_3;
    multiplicaGalois mg7_0 (.e(bloco[103:96]), .c(8'h09), .s(s7_0));
    multiplicaGalois mg7_1 (.e(bloco[71:64]), .c(8'h0E), .s(s7_1));
    multiplicaGalois mg7_2 (.e(bloco[39:32]), .c(8'h0B), .s(s7_2));
    multiplicaGalois mg7_3 (.e(bloco[7:0]), .c(8'h0D), .s(s7_3));
    assign saida[71:64] = s7_0 ^ s7_1 ^ s7_2 ^ s7_3;

    // saida[8]
    wire [7:0] s8_0, s8_1, s8_2, s8_3;
    multiplicaGalois mg8_0 (.e(bloco[127:120]), .c(8'h0D), .s(s8_0));
    multiplicaGalois mg8_1 (.e(bloco[95:88]), .c(8'h09), .s(s8_1));
    multiplicaGalois mg8_2 (.e(bloco[63:56]), .c(8'h0E), .s(s8_2));
    multiplicaGalois mg8_3 (.e(bloco[31:24]), .c(8'h0B), .s(s8_3));
    assign saida[63:56] = s8_0 ^ s8_1 ^ s8_2 ^ s8_3;

    // saida[9]
    wire [7:0] s9_0, s9_1, s9_2, s9_3;
    multiplicaGalois mg9_0 (.e(bloco[119:112]), .c(8'h0D), .s(s9_0));
    multiplicaGalois mg9_1 (.e(bloco[87:80]), .c(8'h09), .s(s9_1));
    multiplicaGalois mg9_2 (.e(bloco[55:48]), .c(8'h0E), .s(s9_2));
    multiplicaGalois mg9_3 (.e(bloco[23:16]), .c(8'h0B), .s(s9_3));
    assign saida[55:48] = s9_0 ^ s9_1 ^ s9_2 ^ s9_3;

    // saida[10]
    wire [7:0] s10_0, s10_1, s10_2, s10_3;
    multiplicaGalois mg10_0 (.e(bloco[111:104]), .c(8'h0D), .s(s10_0));
    multiplicaGalois mg10_1 (.e(bloco[79:72]), .c(8'h09), .s(s10_1));
    multiplicaGalois mg10_2 (.e(bloco[47:40]), .c(8'h0E), .s(s10_2));
    multiplicaGalois mg10_3 (.e(bloco[15:8]), .c(8'h0B), .s(s10_3));
    assign saida[47:40] = s10_0 ^ s10_1 ^ s10_2 ^ s10_3;
                            
    // saida[11]
    wire [7:0] s11_0, s11_1, s11_2, s11_3;
    multiplicaGalois mg11_0 (.e(bloco[103:96]), .c(8'h0D), .s(s11_0));
    multiplicaGalois mg11_1 (.e(bloco[71:64]), .c(8'h09), .s(s11_1));
    multiplicaGalois mg11_2 (.e(bloco[39:32]), .c(8'h0E), .s(s11_2));
    multiplicaGalois mg11_3 (.e(bloco[7:0]), .c(8'h0B), .s(s11_3));
    assign saida[39:32] = s11_0 ^ s11_1 ^ s11_2 ^ s11_3;

    // saida[12]
    wire [7:0] s12_0, s12_1, s12_2, s12_3;
    multiplicaGalois mg12_0 (.e(bloco[127:120]), .c(8'h0B), .s(s12_0));
    multiplicaGalois mg12_1 (.e(bloco[95:88]), .c(8'h0D), .s(s12_1));
    multiplicaGalois mg12_2 (.e(bloco[63:56]), .c(8'h09), .s(s12_2));
    multiplicaGalois mg12_3 (.e(bloco[31:24]), .c(8'h0E), .s(s12_3));
    assign saida[31:24] = s12_0 ^ s12_1 ^ s12_2 ^ s12_3;

    // saida[13]
    wire [7:0] s13_0, s13_1, s13_2, s13_3;
    multiplicaGalois mg13_0 (.e(bloco[119:112]), .c(8'h0B), .s(s13_0));
    multiplicaGalois mg13_1 (.e(bloco[87:80]), .c(8'h0D), .s(s13_1));
    multiplicaGalois mg13_2 (.e(bloco[55:48]), .c(8'h09), .s(s13_2));
    multiplicaGalois mg13_3 (.e(bloco[23:16]), .c(8'h0E), .s(s13_3));
    assign saida[23:16] = s13_0 ^ s13_1 ^ s13_2 ^ s13_3;

    // saida[14]
    wire [7:0] s14_0, s14_1, s14_2, s14_3;
    multiplicaGalois mg14_0 (.e(bloco[111:104]), .c(8'h0B), .s(s14_0));
    multiplicaGalois mg14_1 (.e(bloco[79:72]), .c(8'h0D), .s(s14_1));
    multiplicaGalois mg14_2 (.e(bloco[47:40]), .c(8'h09), .s(s14_2));
    multiplicaGalois mg14_3 (.e(bloco[15:8]), .c(8'h0E), .s(s14_3));
    assign saida[15:8] = s14_0 ^ s14_1 ^ s14_2 ^ s14_3;
    
    // saida[15]
    wire [7:0] s15_0, s15_1, s15_2, s15_3;
    multiplicaGalois mg15_0 (.e(bloco[103:96]), .c(8'h0B), .s(s15_0));
    multiplicaGalois mg15_1 (.e(bloco[71:64]), .c(8'h0D), .s(s15_1));
    multiplicaGalois mg15_2 (.e(bloco[39:32]), .c(8'h09), .s(s15_2));
    multiplicaGalois mg15_3 (.e(bloco[7:0]), .c(8'h0E), .s(s15_3));
    assign saida[7:0] = s15_0 ^ s15_1 ^ s15_2 ^ s15_3;

endmodule