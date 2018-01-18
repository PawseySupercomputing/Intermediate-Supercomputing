#!/bin/bash -l

## SLURM job-script to run the CUDA version of darts program.

#SBATCH --job-name=darts-cuda
#SBATCH --account=courses01
#SBATCH --gres=gpu:4
#SBATCH --constraint=p100
#SBATCH --nodes=1
#SBATCH --time=00:05:00
#SBATCH --export=NONE

module load broadwell gcc/5.4.0 cuda

srun --export=all -n 1 ./darts-cuda
