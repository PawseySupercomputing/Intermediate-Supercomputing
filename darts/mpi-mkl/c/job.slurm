#!/bin/bash -l

## SLURM job-script to run the MPI MKL version of darts program.

#SBATCH --job-name=darts-mpi-mkl
#SBATCH --account=courses01
#SBATCH --reservation=courseq
#SBATCH --nodes=1
#SBATCH --time=00:05:00
#SBATCH --export=NONE

module swap PrgEnv-cray PrgEnv-intel 

srun --export=ALL -n 24  darts-mpi-mkl
