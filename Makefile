CC = gcc
CXX = nvcc
SRC = src/
CFLAGS = -Ofast -Wall -funroll-loops -g -fno-omit-frame-pointer -mavx -march=native -ftree-vectorizer-verbose=2 -pg -faggressive-loop-optimizations -fno-exceptions
CXXFLAGS = -O3 -g -std=c++11 -arch=sm_35 -Wno-deprecated-gpu-targets --extra-device-vectorization --use_fast_math

.DEFAULT_GOAL = all

all: MDseq.exe MDpar.exe MD2seq.exe MDcuda.exe

MDseq.exe: $(SRC)/MDseq.cpp
	module load gcc/11.2.0;\
	$(CC) $(CFLAGS) $(SRC)MDseq.cpp -lm -o MDseq.exe

MDpar.exe: $(SRC)/MDpar.cpp
	module load gcc/11.2.0;\
	$(CC) $(CFLAGS) $(SRC)MDpar.cpp -lm -fopenmp -o MDpar.exe

MD2seq.exe : $(SRC)/MD2seq.cpp
	module load gcc/11.2.0;\
	$(CC) $(CFLAGS) $(SRC)MDseq.cpp -lm -o MD2seq.exe

MDcuda.exe: $(SRC)/MDcuda.cu
	module load gcc/7.2.0;\
	module load cuda/11.3.1;\
	$(CXX) $(CXXFLAGS) $(SRC)MDcuda.cu -lm -o MDcuda.exe 

clean:
	rm ./MD*.exe

runseq: MDseq.exe
	./MDseq.exe < inputdataOriginal.txt

runpar: MDpar.exe
	./MDpar.exe < inputdataPar.txt

runorig: MD2seq.exe
	./MD2seq.exe < inputdataOriginal.txt

runcuda: MDcuda.exe
	./MDcuda.exe < inputdata.txt
