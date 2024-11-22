CC = gcc
CFLAGS = -Wall

ICARUS = iverilog
ARQS_V = substituiBytes.v rotacionaLinhas.v caixaS.v expandeChave.v multiplicaColunas.v mioloCifraBloco.v cifraBloco.v
TBS = substituiBytes_TB.v rotacionaLinhas_TB.v expandeChave_TB.v multiplicaColunas_TB.v mioloCifraBloco_TB.v cifraBloco_TB.v

all:
	$(ICARUS) -o aes $(ARQS_V)
	$(CC) $(CFLAGS) -o aes_c aes.c 
	$(CC) $(CFLAGS) -o decifra_c decifra.c

tbs:
	$(ICARUS) -o aes $(ARQS_V) $(TBS)
