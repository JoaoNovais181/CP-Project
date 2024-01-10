#!/bin/bash
#SBATCH --partition=cpar
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --time=00:10:00
#SBATCH --exclusive


export OMP_NUM_THREADS=32
echo  Numero de threads ${OMP_NUM_THREADS}
time ./MDpar.exe < inputdataPar.txt