CC = gcc
SRC = src/
CFLAGS = -Ofast -Wall 

.DEFAULT_GOAL = MD.exe

MD.exe: $(SRC)MD.cpp
	$(CC) $(CFLAGS) $(SRC)MD.cpp -lm -o MD.exe

clean:
	rm ./MD.exe

run:
	./MD.exe < inputdata.txt

run2:
	./MD2.exe < inputdata.txt

MD2.exe: $(SRC)MD2.cpp
	$(CC) $(CFLAGS) $(SRC)MD2.cpp -lm -o MD2.exe

