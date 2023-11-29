#!/bin/bash
#SBATCH --partition=cpar
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --time=00:10:00
#SBATCH --exclusive


threads=(1 2 4 8 16 20 32 40)


for nthreads in "${threads[@]}"
do
	export OMP_NUM_THREADS=${nthreads}
	echo  Numero de threads ${OMP_NUM_THREADS}
    perf stat -r 5 -e  instructions,cycles,cache-misses,cache-references make runpar > lixo
done
