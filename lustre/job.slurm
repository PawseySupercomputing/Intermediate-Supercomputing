#!/bin/bash -l

## SLURM job-script to run the lustre number of OSTs demo

#SBATCH --job-name=num-osts-demo
#SBATCH --account=courses01
#SBATCH --nodes=1
#SBATCH --time=00:10:00
#SBATCH --export=NONE

# load the necessary modules
module load python 

# change to the working directory
cd ${MYSCRATCH}

# setup environment variable pointing to training examples directory
export EXAMPLES_DIR=${MYGROUP}/Intermediate-Supercomputing

# run the Python script
srun --export=all -n 1 python ${EXAMPLES_DIR}/lustre/num_osts_demo.py 
