#!/bin/bash
#SBATCH --partition=cpar
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --time=00:10:00
#SBATCH --exclusive


time ./MDseq.exe < inputdataSeq.txt
