#!/bin/bash -l

## SLURM job-script to run the MPI collective version of darts program.

#SBATCH --job-name=darts-collective
#SBATCH --account=courses01
#SBATCH --nodes=1
#SBATCH --time=00:05:00
#SBATCH --export=NONE

module swap PrgEnv-cray PrgEnv-intel 

srun --export=all -n 24 darts-collective
