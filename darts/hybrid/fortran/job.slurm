#!/bin/bash -l

## SLURM job-script to run the hybrid "MPI+OpenMP" version of darts program.

#SBATCH --job-name=darts-hybrid
#SBATCH --account=courses01
#SBATCH --nodes=1
#SBATCH --time=00:05:00
#SBATCH --export=NONE

module swap PrgEnv-cray PrgEnv-intel 
# The following will launch darts-hybrid 4 MPI-tasks, each creating 6 OpenMP threads
export OMP_NUM_THREADS=6
export OMP_PLACES=cores
export OMP_PROC_BIND=close
srun --export=ALL -n 4 -c 6 darts-hybrid
