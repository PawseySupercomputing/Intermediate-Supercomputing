#!/bin/bash --login
 
# SLURM directives
#
# This is an array job with two subtasks 0 and 1 (--array=0,1).
#
# The output for each subtask will be sent to a separate file
# identified by the jobid (--output=array-%j.out)
#
# Each subtask will occupy one node (--nodes=1) with
# a wall-clock time limit of one minute (--time=00:01:00)
#
# Replace [your-project] with the appropriate project name
# following --account (e.g., --account=project123)
 
#SBATCH --array=0,1
#SBATCH --output=array-%j.out
#SBATCH --nodes=1
#SBATCH --time=00:01:00
#SBATCH --account=[your-project]
#SBATCH --export=NONE
 
# To launch the job, we specify to aprun 24 MPI tasks (-n 24)
# to occupy 1 node (-N 24)
#
# Note we avoid any inadvertent OpenMP threading by setting
# OMP_NUM_THREADS=1
#
# The input to the execuatable is the unique array task identifier
# $SLURM_ARRAY_TASK_ID which will be either 0 or 1
 
export OMP_NUM_THREADS=1
 
echo This job shares a SLURM array job ID with the parent job: $SLURM_ARRAY_JOB_ID
echo This job has a SLURM job ID: $SLURM_JOBID
echo This job has a unique SLURM array index: $SLURM_ARRAY_TASK_ID
 
srun -n 24 --export=ALL ./code_mpi.x $SLURM_ARRAY_TASK_ID
