#!/bin/bash -l

## SLURM job-script to run the hybrid xthi program.

#SBATCH --job-name=xthi
#SBATCH --account=courses01
#SBATCH --nodes=1
#SBATCH --time=00:05:00
#SBATCH --export=NONE

export OMP_NUM_THREADS=4
srun --export=all -n 6 xthi
