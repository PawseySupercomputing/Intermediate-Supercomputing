#!/bin/bash -l
#SBATCH --job-name=darts-openmp
#SBATCH --account=courses01
#SBATCH --reservation=courseq
#SBATCH --nodes=1
#SBATCH --time=00:05:00
#SBATCH --export=NONE

module swap PrgEnv-cray PrgEnv-intel 

export OMP_NUM_THREADS=24
aprun -n 1 -N 1 -d 24 darts-omp
