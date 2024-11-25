ARQ_DADOS ?= dados.txt
ARQ_SENHA ?= senha.txt
ARQ_SAIDA ?= teste.txt

CC = gcc
CFLAGS = -Wall

ICARUS = iverilog
ARQS_V = substituiBytes.v rotacionaLinhas.v caixaS.v expandeChave.v multiplicaColunas.v mioloCifraBloco.v cifraBloco.v inverteBloco.v aes.v
TBS = substituiBytes_TB.v rotacionaLinhas_TB.v expandeChave_TB.v multiplicaColunas_TB.v mioloCifraBloco_TB.v cifraBloco_TB.v inverteBloco_TB.v

all:
	$(ICARUS) -o aes $(ARQS_V) -Paes.ARQ_DADOS='"$(ARQ_DADOS)"' -Paes.ARQ_SENHA='"$(ARQ_SENHA)"' -Paes.ARQ_SAIDA='"$(ARQ_SAIDA)"'
	$(CC) $(CFLAGS) -o aes_c aes.c 
	$(CC) $(CFLAGS) -o decifra_c decifra.c

tbs:
	$(ICARUS) -o aes $(ARQS_V) $(TBS)
