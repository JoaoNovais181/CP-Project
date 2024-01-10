CC = gcc
CXX = nvcc
SRC = src/
CFLAGS = -Ofast -Wall -funroll-loops -g -fno-omit-frame-pointer -mavx -march=native -ftree-vectorizer-verbose=2 -pg -faggressive-loop-optimizations -fno-exceptions
CXXFLAGS = -O3 -g -std=c++11 -arch=sm_35 -Wno-deprecated-gpu-targets --extra-device-vectorization --use_fast_math

.DEFAULT_GOAL = all

all: MDseq.exe MDpar.exe MDoriginal.exe MD.exe

MDseq.exe: $(SRC)/MDseq.cpp
	module load gcc/11.2.0;\
	$(CC) $(CFLAGS) $(SRC)MDseq.cpp -lm -o MDseq.exe

MDpar.exe: $(SRC)/MDpar.cpp
	module load gcc/11.2.0;\
	$(CC) $(CFLAGS) $(SRC)MDpar.cpp -lm -fopenmp -o MDpar.exe

MDoriginal.exe : $(SRC)/MDoriginal.cpp
	module load gcc/11.2.0;\
	$(CC) $(CFLAGS) $(SRC)MDseq.cpp -lm -o MDoriginal.exe

MD.exe: $(SRC)/MDcuda.cu
	module load gcc/7.2.0;\
	module load cuda/11.3.1;\
	$(CXX) $(CXXFLAGS) $(SRC)MDcuda.cu -lm -o MD.exe 

clean:
	rm ./MD*.exe

runseq: MDseq.exe
	# ./MDseq.exe < inputdataOriginal.txt
	./runseq.sh

runpar: MDpar.exe
	# ./MDpar.exe < inputdataPar.txt
	./runpar.sh

runorig: MDoriginal.exe
	# ./MDoriginal.exe < inputdataOriginal.txt
	./runorig.sh

run: MD.exe
	# ./MD.exe < inputdata.txt
	./runcuda.sh
