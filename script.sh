#!/bin/bash
#SBATCH --time=00:10:00


threads=(1 2 4 8 16 32)


for nthreads in "${threads[@]}"
do
	export OMP_NUM_THREADS=${nthreads}
	echo ${OMP_NUM_THREADS}
	time `./MDpar.exe <inputdata.txt >lixo`
done
