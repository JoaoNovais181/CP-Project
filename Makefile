CC = gcc
SRC = src/
CFLAGS = -Ofast -Wall -funroll-loops -g -fno-omit-frame-pointer -mavx -march=native -ftree-vectorizer-verbose=2 -pg -faggressive-loop-optimizations -fno-exceptions

.DEFAULT_GOAL = all

all: MDseq.exe MDpar.exe

MDseq.exe: $(SRC)/MDseq.cpp
	module load gcc/11.2.0;\
	$(CC) $(CFLAGS) $(SRC)MDseq.cpp -lm -o MDseq.exe

MDpar.exe: $(SRC)/MDpar.cpp
	module load gcc/11.2.0;\
	$(CC) $(CFLAGS) $(SRC)MDpar.cpp -lm -fopenmp -o MDpar.exe

clean:
	rm ./MD*.exe

runseq: MDseq.exe
	./MDseq.exe < inputdataOriginal.txt

runpar: MDpar.exe
	export OMP_NUM_THREADS=2;\
	./MDpar.exe < inputdata.txt
