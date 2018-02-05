#!/bin/bash --login
 
# SLURM directives
#
# This is an array job with three subtasks 8,16 and 32 (--array=8,16,32).
 
#SBATCH --array=8,16,32
#SBATCH --output=array-%j.out
#SBATCH --nodes=1
#SBATCH --time=00:01:00
#SBATCH --account=pawsey0001
#SBATCH --export=NONE
 
echo This job shares a SLURM array job ID with the parent job: $SLURM_ARRAY_JOB_ID
echo This job has a SLURM job ID: $SLURM_JOBID
echo This job has a unique SLURM array index: $SLURM_ARRAY_TASK_ID
 
time srun -n 24 --export=all ./darts-mpi $SLURM_ARRAY_TASK_ID
