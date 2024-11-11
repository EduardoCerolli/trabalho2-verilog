CC = gcc
CFLAGS = -Wall

ICARUS = iverilog
ARQS_V = substituiBytes.v rotacionaLinhas.v caixaS.v funcaoG.v expandeChave.v
TBS = substituiBytes_TB.v rotacionaLinhas_TB.v funcaoG_TB.v expandeChave_TB.v

all:
	$(ICARUS) -o aes $(ARQS_V)
	$(CC) $(CFLAGS) -o aes_c aes.c 
	$(CC) $(CFLAGS) -o decifra_c decifra.c

tbs:
	$(ICARUS) -o aes $(ARQS_V) $(TBS)
