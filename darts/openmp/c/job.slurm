#!/bin/bash -l

## SLURM job-script to run the serial version of darts program.

#SBATCH --job-name=darts-openmp
#SBATCH --account=courses01
#SBATCH --nodes=1
#SBATCH --time=00:05:00
#SBATCH --export=NONE

module swap PrgEnv-cray PrgEnv-intel 

export OMP_NUM_THREADS=24
srun --export=all -n 1 -c 24 darts-omp
