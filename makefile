ARQ_DADOS ?= dados.txt
ARQ_SENHA ?= senha.txt
ARQ_SAIDA ?= teste.txt

ARQ_DADOS_DECIFRA ?= teste.txt
ARQ_SENHA_DECIFRA ?= senha.txt
ARQ_SAIDA_DECIFRA ?= decifrado.txt

CC = gcc
CFLAGS = -Wall

ICARUS = iverilog
ARQS_V = cifra/substituiBytes.v cifra/rotacionaLinhas.v cifra/caixaS.v cifra/expandeChave.v cifra/multiplicaColunas.v cifra/mioloCifraBloco.v cifra/cifraBloco.v cifra/inverteBloco.v cifra/aes.v
ARQS_DECIFRA_V = decripta/caixaSInv.v decripta/caixaS.v decripta/substituiBytes.v decripta/rotacionaLinhas.v decripta/expandeChave.v decripta/inverteBloco.v decripta/multiplicaColunas.v decripta/multiplicaGalois.v decripta/galois2.v decripta/mioloCifraBloco.v decripta/decifraBloco.v decripta/decifra.v
TBS = cifra/substituiBytes_TB.v cifra/rotacionaLinhas_TB.v cifra/expandeChave_TB.v cifra/multiplicaColunas_TB.v cifra/mioloCifraBloco_TB.v cifra/cifraBloco_TB.v cifra/inverteBloco_TB.v
TBS_DECIFRA = decripta/substituiBytes_TB.v decripta/rotacionaLinhas_TB.v decripta/expandeChave_TB.v decripta/inverteBloco_TB.v decripta/multiplicaColunas_TB.v decripta/multiplicaGalois_TB.v decripta/mioloCifraBloco_TB.v decripta/decifraBloco_TB.v

all:
	$(ICARUS) -o aes $(ARQS_V) -Paes.ARQ_DADOS='"$(ARQ_DADOS)"' -Paes.ARQ_SENHA='"$(ARQ_SENHA)"' -Paes.ARQ_SAIDA='"$(ARQ_SAIDA)"'
	$(CC) $(CFLAGS) -o aes_c cifra/aes.c 

tbs:
	$(ICARUS) -o aes $(ARQS_V) $(TBS)

decifra:
	$(ICARUS) -o decifra $(ARQS_DECIFRA_V) -Pdecifra.ARQ_DADOS='"$(ARQ_DADOS_DECIFRA)"' -Pdecifra.ARQ_SENHA='"$(ARQ_SENHA_DECIFRA)"' -Pdecifra.ARQ_SAIDA='"$(ARQ_SAIDA_DECIFRA)"'
	$(CC) $(CFLAGS) -o decifra_c decripta/decifra.c

tbs_decifra:
	$(ICARUS) -o decifra $(ARQS_DECIFRA_V) $(TBS_DECIFRA)

clear:
	rm -f aes
	rm -f decifra
	rm -f aes_c
	rm -f decifra_c