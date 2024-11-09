CC = gcc
CFLAGS = -Wall

ICARUS = iverilog
ARQS_V = substituiBytes.v 
TBS = substituiBytes_TB.v

all:
	$(ICARUS) -o aes $(ARQS_V)

tbs:
	$(ICARUS) -o aes $(ARQS_V) $(TBS)

cod_c:
	$(CC) $(CFLAGS) -o aes_c aes.c 
	$(CC) $(CFLAGS) -o decifra_c decifra.c