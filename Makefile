CC = gcc
SRC = src/
CFLAGS = -Ofast -Wall -funroll-loops -g -fno-omit-frame-pointer -mavx -march=native -ftree-vectorizer-verbose=2 -pg -faggressive-loop-optimizations -fno-exceptions

.DEFAULT_GOAL = all

all: MDseq.exe MDpar.exe MD2seq.exe

MDseq.exe: $(SRC)/MDseq.cpp
	module load gcc/11.2.0;\
	$(CC) $(CFLAGS) $(SRC)MDseq.cpp -lm -o MDseq.exe

MDpar.exe: $(SRC)/MDpar.cpp
	module load gcc/11.2.0;\
	$(CC) $(CFLAGS) $(SRC)MDpar.cpp -lm -fopenmp -o MDpar.exe

MD2seq.exe : $(SRC)/MD2seq.cpp
	module load gcc/11.2.0;\
	$(CC) $(CFLAGS) $(SRC)MDseq.cpp -lm -o MD2seq.exe

clean:
	rm ./MD*.exe

runseq: MDseq.exe
	./MDseq.exe < inputdataOriginal.txt

runpar: MDpar.exe
	./MDpar.exe < inputdata.txt

runorig: MD2seq.exe
	./MD2seq.exe < inputdataOriginal.txt
