#include <stdlib.h>
#include <stdio.h>


unsigned char caixaS[256] = {
    // 0     1    2      3     4    5     6     7      8    9     A      B    C     D     E     F
    0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5, 0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76,  // 0
    0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0, 0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0,  // 1
    0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc, 0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15,  // 2
    0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a, 0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75,  // 3
    0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0, 0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84,  // 4
    0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b, 0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf,  // 5
    0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85, 0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8,  // 6
    0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5, 0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2,  // 7
    0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17, 0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73,  // 8
    0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88, 0x46, 0xee, 0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb,  // 9
    0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c, 0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79,  // A
    0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9, 0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08,  // B
    0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6, 0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a,  // C
    0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e, 0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e,  // D
    0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94, 0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf,  // E
    0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68, 0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16}; // F

unsigned char caixaSInv[256] =
    {0x52, 0x09, 0x6a, 0xd5, 0x30, 0x36, 0xa5, 0x38, 0xbf, 0x40, 0xa3, 0x9e, 0x81, 0xf3, 0xd7, 0xfb, 0x7c, 0xe3, 0x39, 0x82, 0x9b, 0x2f, 0xff, 0x87, 0x34, 0x8e, 0x43, 0x44, 0xc4, 0xde, 0xe9, 0xcb, 0x54, 0x7b, 0x94, 0x32, 0xa6, 0xc2, 0x23, 0x3d, 0xee, 0x4c, 0x95, 0x0b, 0x42, 0xfa, 0xc3, 0x4e, 0x08, 0x2e, 0xa1, 0x66, 0x28, 0xd9, 0x24, 0xb2, 0x76, 0x5b, 0xa2, 0x49, 0x6d, 0x8b, 0xd1, 0x25, 0x72, 0xf8, 0xf6, 0x64, 0x86, 0x68, 0x98, 0x16, 0xd4, 0xa4, 0x5c, 0xcc, 0x5d, 0x65, 0xb6, 0x92, 0x6c, 0x70, 0x48, 0x50, 0xfd, 0xed, 0xb9, 0xda, 0x5e, 0x15, 0x46, 0x57, 0xa7, 0x8d, 0x9d, 0x84, 0x90, 0xd8, 0xab, 0x00, 0x8c, 0xbc, 0xd3, 0x0a, 0xf7, 0xe4, 0x58, 0x05, 0xb8, 0xb3, 0x45, 0x06, 0xd0, 0x2c, 0x1e, 0x8f, 0xca, 0x3f, 0x0f, 0x02, 0xc1, 0xaf, 0xbd, 0x03, 0x01, 0x13, 0x8a, 0x6b, 0x3a, 0x91, 0x11, 0x41, 0x4f, 0x67, 0xdc, 0xea, 0x97, 0xf2, 0xcf, 0xce, 0xf0, 0xb4, 0xe6, 0x73, 0x96, 0xac, 0x74, 0x22, 0xe7, 0xad, 0x35, 0x85, 0xe2, 0xf9, 0x37, 0xe8, 0x1c, 0x75, 0xdf, 0x6e, 0x47, 0xf1, 0x1a, 0x71, 0x1d, 0x29, 0xc5, 0x89, 0x6f, 0xb7, 0x62, 0x0e, 0xaa, 0x18, 0xbe, 0x1b, 0xfc, 0x56, 0x3e, 0x4b, 0xc6, 0xd2, 0x79, 0x20, 0x9a, 0xdb, 0xc0, 0xfe, 0x78, 0xcd, 0x5a, 0xf4, 0x1f, 0xdd, 0xa8, 0x33, 0x88, 0x07, 0xc7, 0x31, 0xb1, 0x12, 0x10, 0x59, 0x27, 0x80, 0xec, 0x5f, 0x60, 0x51, 0x7f, 0xa9, 0x19, 0xb5, 0x4a, 0x0d, 0x2d, 0xe5, 0x7a, 0x9f, 0x93, 0xc9, 0x9c, 0xef, 0xa0, 0xe0, 0x3b, 0x4d, 0xae, 0x2a, 0xf5, 0xb0, 0xc8, 0xeb, 0xbb, 0x3c, 0x83, 0x53, 0x99, 0x61, 0x17, 0x2b, 0x04, 0x7e, 0xba, 0x77, 0xd6, 0x26, 0xe1, 0x69, 0x14, 0x63, 0x55, 0x21, 0x0c, 0x7d};

unsigned char rcon[10] = {1, 2, 4, 8, 16, 32, 64, 128, 27, 54};

unsigned char chave[4][4];
unsigned char chaveExpandida[4][40];


// XOR entre o bloco atual e chave de rodada
void adicionaChave (unsigned char bloco[4][4], int rodada) {
    for (int i = 0; i < 4; i++) {
        bloco[i][0] = bloco[i][0] ^ chaveExpandida[i][rodada + 0];
        bloco[i][1] = bloco[i][1] ^ chaveExpandida[i][rodada + 1];
        bloco[i][2] = bloco[i][2] ^ chaveExpandida[i][rodada + 2];
        bloco[i][3] = bloco[i][3] ^ chaveExpandida[i][rodada + 3];
    }

    return;
}

void substituiBytes(unsigned char bloco[4][4]) {
    for (int i = 0; i < 4; i++) {
        bloco[i][0] = caixaSInv[bloco[i][0]];
        bloco[i][1] = caixaSInv[bloco[i][1]];
        bloco[i][2] = caixaSInv[bloco[i][2]];
        bloco[i][3] = caixaSInv[bloco[i][3]];
    }
}

void rotacionaLinhas (unsigned char bloco[4][4]) {
    unsigned char aux1, aux2, aux3, aux4;
    
    for (int i = 1; i < 4; i++) {
        aux1 = bloco[i][(4 - i) % 4];
        aux2 = bloco[i][(5 - i) % 4];
        aux3 = bloco[i][(6 - i) % 4];
        aux4 = bloco[i][(7 - i) % 4];

        bloco[i][0] = aux1;
        bloco[i][1] = aux2;
        bloco[i][2] = aux3;
        bloco[i][3] = aux4;
    }
    
    return;
}

unsigned char gfMultiplica(unsigned char dado, unsigned char constante) {
    unsigned char produto = 0;
    while (constante) {
        if (constante & 1) {
            produto ^= dado;
        }
        dado = (dado << 1) ^ ((dado & 0x80) ? 0x1B : 0x00);
        constante >>= 1;
    }
    return produto;
}

unsigned char GF2 (unsigned char dado) {
    return (dado << 1) ^ (dado >> 7 ) * 0x1B;
}

void multiplicaColunas(unsigned char bloco[4][4]) {
    unsigned char matriz_aux[4][4];

    for (int i = 0; i < 4; i++) {
        matriz_aux[0][i] = gfMultiplica(bloco[0][i], 0x0E) ^ gfMultiplica(bloco[1][i], 0x0B) ^ 
                           gfMultiplica(bloco[2][i], 0x0D) ^ gfMultiplica(bloco[3][i], 0x09);

        matriz_aux[1][i] = gfMultiplica(bloco[0][i], 0x09) ^ gfMultiplica(bloco[1][i], 0x0E) ^ 
                           gfMultiplica(bloco[2][i], 0x0B) ^ gfMultiplica(bloco[3][i], 0x0D);
                           
        matriz_aux[2][i] = gfMultiplica(bloco[0][i], 0x0D) ^ gfMultiplica(bloco[1][i], 0x09) ^ 
                           gfMultiplica(bloco[2][i], 0x0E) ^ gfMultiplica(bloco[3][i], 0x0B);

        matriz_aux[3][i] = gfMultiplica(bloco[0][i], 0x0B) ^ gfMultiplica(bloco[1][i], 0x0D) ^ 
                           gfMultiplica(bloco[2][i], 0x09) ^ gfMultiplica(bloco[3][i], 0x0E);
    }

    // Copia os resultados de volta para o bloco original
    for (int i = 0; i < 4; i++)
        for (int j = 0; j < 4; j++)
            bloco[i][j] = matriz_aux[i][j];

    return;
}

void funcaoG (unsigned char palavra[4], unsigned char p0, unsigned char p1, unsigned char p2, unsigned char p3, int rodada) {
    palavra[0] = p1;
    palavra[1] = p2;
    palavra[2] = p3;
    palavra[3] = p0;

    palavra[0] = caixaS[palavra[0]];
    palavra[1] = caixaS[palavra[1]];
    palavra[2] = caixaS[palavra[2]];
    palavra[3] = caixaS[palavra[3]];

    palavra[0] = palavra[0] ^ rcon[rodada];

    return;
}

void expandeChave () {
    unsigned char aux[4];
    int rodada = 0;
    
    funcaoG(aux, chave[0][3], chave[1][3], chave[2][3], chave[3][3], 0);
    chaveExpandida[0][0] = aux[0] ^ chave[0][0];
    chaveExpandida[1][0] = aux[1] ^ chave[1][0];
    chaveExpandida[2][0] = aux[2] ^ chave[2][0];
    chaveExpandida[3][0] = aux[3] ^ chave[3][0];

    chaveExpandida[0][1] = chaveExpandida[0][0] ^ chave[0][1];
    chaveExpandida[1][1] = chaveExpandida[1][0] ^ chave[1][1];
    chaveExpandida[2][1] = chaveExpandida[2][0] ^ chave[2][1];
    chaveExpandida[3][1] = chaveExpandida[3][0] ^ chave[3][1];

    chaveExpandida[0][2] = chaveExpandida[0][1] ^ chave[0][2];
    chaveExpandida[1][2] = chaveExpandida[1][1] ^ chave[1][2];
    chaveExpandida[2][2] = chaveExpandida[2][1] ^ chave[2][2];
    chaveExpandida[3][2] = chaveExpandida[3][1] ^ chave[3][2];

    chaveExpandida[0][3] = chaveExpandida[0][2] ^ chave[0][3];
    chaveExpandida[1][3] = chaveExpandida[1][2] ^ chave[1][3];
    chaveExpandida[2][3] = chaveExpandida[2][2] ^ chave[2][3];
    chaveExpandida[3][3] = chaveExpandida[3][2] ^ chave[3][3];
    
    for (int i = 4; i < 40; i+= 4)
    {
        rodada++;
        funcaoG(aux, chaveExpandida[0][i - 1], chaveExpandida[1][i - 1], chaveExpandida[2][i - 1], chaveExpandida[3][i - 1], rodada);
        chaveExpandida[0][i] = aux[0] ^ chaveExpandida[0][i - 4];
        chaveExpandida[1][i] = aux[1] ^ chaveExpandida[1][i - 4];
        chaveExpandida[2][i] = aux[2] ^ chaveExpandida[2][i - 4];
        chaveExpandida[3][i] = aux[3] ^ chaveExpandida[3][i - 4];

        chaveExpandida[0][i + 1] = chaveExpandida[0][i + 1 - 1] ^ chaveExpandida[0][i + 1 - 4];
        chaveExpandida[1][i + 1] = chaveExpandida[1][i + 1 - 1] ^ chaveExpandida[1][i + 1 - 4];
        chaveExpandida[2][i + 1] = chaveExpandida[2][i + 1 - 1] ^ chaveExpandida[2][i + 1 - 4];
        chaveExpandida[3][i + 1] = chaveExpandida[3][i + 1 - 1] ^ chaveExpandida[3][i + 1 - 4];

        chaveExpandida[0][i + 2] = chaveExpandida[0][i + 2 - 1] ^ chaveExpandida[0][i + 2 - 4];
        chaveExpandida[1][i + 2] = chaveExpandida[1][i + 2 - 1] ^ chaveExpandida[1][i + 2 - 4];
        chaveExpandida[2][i + 2] = chaveExpandida[2][i + 2 - 1] ^ chaveExpandida[2][i + 2 - 4];
        chaveExpandida[3][i + 2] = chaveExpandida[3][i + 2 - 1] ^ chaveExpandida[3][i + 2 - 4];

        chaveExpandida[0][i + 3] = chaveExpandida[0][i + 3 - 1] ^ chaveExpandida[0][i + 3 - 4];
        chaveExpandida[1][i + 3] = chaveExpandida[1][i + 3 - 1] ^ chaveExpandida[1][i + 3 - 4];
        chaveExpandida[2][i + 3] = chaveExpandida[2][i + 3 - 1] ^ chaveExpandida[2][i + 3 - 4];
        chaveExpandida[3][i + 3] = chaveExpandida[3][i + 3 - 1] ^ chaveExpandida[3][i + 3 - 4];
    }
    

    return;
}

void decifraBloco (unsigned char bloco [4][4]) {
    // adicionaChave(bloco, 36);

    // for (int i = 8; i >= 0; i--) {
        // rotacionaLinhas(bloco);
        // substituiBytes(bloco);
        // adicionaChave(bloco, i * 4);
        multiplicaColunas(bloco);
    // }
    
    // rotacionaLinhas(bloco);
    // substituiBytes(bloco);
    // for (int i = 0; i < 4; i++) {
    //     bloco[i][0] = bloco[i][0] ^ chave[i][0];
    //     bloco[i][1] = bloco[i][1] ^ chave[i][1];
    //     bloco[i][2] = bloco[i][2] ^ chave[i][2];
    //     bloco[i][3] = bloco[i][3] ^ chave[i][3];
    // }
    
    return;
}

void preencheChave(char *senha) {
    unsigned char aux[17];

    if (senha == NULL) {
        printf("Digite a senha.\n");
        int res = scanf ("%16s", aux);
        if (res == 0) {
            perror ("Erro ao ler chave") ;
            exit (1) ;
        }
    }
    else {
        FILE *arq;
        arq = fopen(senha, "r");
        if (!arq) {
            perror ("Erro ao abrir arquivo") ;
            exit (1) ;
        }
        int tam = fread(aux, 1, 16, arq);
        if (tam != 16) {
            perror ("Erro ao ler chave") ;
            exit (1) ;
        }

        fclose (arq);
    }

    int k = 0;
    for (int i = 0; i < 4; i++) {
        chave[0][i] = aux[k++];
        chave[1][i] = aux[k++];
        chave[2][i] = aux[k++];
        chave[3][i] = aux[k++];
    }

    expandeChave();
}

int leBloco (unsigned char bloco [4][4], FILE *arq) {
    unsigned char aux[17];
    
    int tam = fread (aux, 1, 16, arq) ;    
    if (tam < 1)
        return 0;
    
    for (int i = tam; i < 16; i++)
        aux[i] = 'X';

    int k = 0;
    for (int i = 0; i < 4; i++) {
        bloco[0][i] = aux[k++];
        bloco[1][i] = aux[k++];
        bloco[2][i] = aux[k++];
        bloco[3][i] = aux[k++];
    }

    return 1;
}

int main (int argc, char *argv[]) {
    char *dados, *senha = NULL;

    if (argc < 2) {
        printf("Informe o arquivo de dados.\n");
        return 1;
    }
    else if (argc > 2) {
        senha = argv[2];
    }
    
    dados = argv[1];

    preencheChave(senha);

    FILE *arq;
    arq = fopen(dados, "r");
    if (!arq) {
        perror ("Erro ao abrir arquivo") ;
        exit (1) ;
    }

    unsigned char bloco [4][4];
    while (!feof (arq)) {
        if (leBloco(bloco, arq)) {
            for (int i = 0; i < 4; i++)
            {
                for (int j = 0; j < 4; j++)
                    printf("%02x", bloco[i][j]);        
            }
            printf("\n");

            printf("\n");
            decifraBloco(bloco);
            
            // for (int i = 0; i < 4; i++)
            // {
            //     for (int j = 0; j < 4; j++)
            //         printf("%c", bloco[j][i]);        
            // }

            for (int i = 0; i < 4; i++)
            {
                for (int j = 0; j < 4; j++)
                    printf("%02x", bloco[i][j]);        
            }
            printf("\n");
        }
    }

    fclose (arq);
    return 0;
}