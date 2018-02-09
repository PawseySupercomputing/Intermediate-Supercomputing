#!/bin/bash -l

## SLURM job-script to run the serial version of darts program.

#SBATCH --job-name=darts-serial
#SBATCH --account=courses01
#SBATCH --nodes=1
#SBATCH --time=00:05:00
#SBATCH --export=NONE

module load python

srun --export=all -n 1 python ./darts.py
