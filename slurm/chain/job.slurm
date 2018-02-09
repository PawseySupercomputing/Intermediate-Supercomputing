#!/bin/bash -l

## SLURM job-script to run chained jobs with the use of job dependencies mechanism

#SBATCH --job-name=chain
#SBATCH --account=courses01
#SBATCH --nodes=1
#SBATCH --time=00:05:00
#SBATCH --export=NONE 

: ${job_number:="1"}		# set job_nubmer to 1 if it is undefined
my_job_number=${job_number}	# save my job number	
job_number_max=5
 
echo "running job ${SLURM_JOB_ID}"

if [[ ${job_number} -lt ${job_number_max} ]]
then
  (( job_number++ ))
  next_jobid=$(sbatch --export=job_number=${job_number} -d afterok:${SLURM_JOB_ID} runjob.sl | awk '{print $4}')
  echo "submitted ${next_jobid}"
fi
 
echo "doing some computations for " ${my_job_number} " seconds"
sleep ${my_job_number}
echo "${SLURM_JOB_ID} done"

