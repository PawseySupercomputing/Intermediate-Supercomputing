#!/bin/bash -l

## SLURM job-script to run the hybrid "MPI+OpenMP" version of darts program.
## Use this script to test the hybrid version linked with MKL libraries by changing the 
## filename from darts-mpi to darts-hybrid-mkl

#SBATCH --job-name=darts-mpi
#SBATCH --account=courses01
#SBATCH --reservation=courseq
#SBATCH --nodes=1
#SBATCH --time=00:05:00
#SBATCH --export=NONE

module swap PrgEnv-cray PrgEnv-intel 
# The following will launch darts-hybrid 4 MPI-tasks, each creating 6 OpenMP threads
export OMP_NUM_THREADS=6
aprun -n 4 -N 4 -d 6 darts-hybrid
