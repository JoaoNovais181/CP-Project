CC = gcc
SRC = src/
CFLAGS = -Ofast -Wall -funroll-loops -g -fno-omit-frame-pointer -mavx -march=native -ftree-vectorizer-verbose=2 -pg -faggressive-loop-optimizations

.DEFAULT_GOAL = MD.exe

MD.exe: $(SRC)MD.cpp
	$(CC) $(CFLAGS) $(SRC)MD.cpp -lm -o MD.exe

clean:
	rm ./MD.exe

run:
	./MD.exe < inputdata.txt

run2:
	./MD2.exe < inputdataOriginal.txt

MD2.exe: $(SRC)MD2.cpp
	$(CC)  $(SRC)MD2.cpp -lm -o MD2.exe

