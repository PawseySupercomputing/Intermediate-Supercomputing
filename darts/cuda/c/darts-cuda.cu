/* Compute pi in serial */
#include <stdio.h>
#include <cuda.h>
#include <curand.h>
static long num_trials = 1000000;

__global__ void kernel(int* Ncirc_t_device,float *randnum)
{
  int i;
  double r = 1.0; // radius of circle
  double r2 = r*r;
  double x,y;

  i = blockDim.x * blockIdx.x + threadIdx.x;
  x=randnum[2*i];
  y=randnum[2*i+1];
  
  if ((x*x + y*y) <= r2)
      Ncirc_t_device[i]=1;
  else 
      Ncirc_t_device[i]=0;
}

int main(int argc, char **argv) {
  int i;
  long Ncirc=0;
  int *Ncirc_t_device;
  int *Ncirc_t_host;
  float *randnum;
  int threads, blocks;
  double pi;

  // Allocate an array for the random numbers in GPU memory space
  cudaMalloc((void**)&randnum,(2*num_trials)*sizeof(float));

  // Generate random numbers 
  int status;
  curandGenerator_t randgen;
  status = curandCreateGenerator(&randgen, CURAND_RNG_PSEUDO_MRG32K3A);
  status |= curandSetPseudoRandomGeneratorSeed(randgen, 4294967296ULL^time(NULL));
  status |= curandGenerateUniform(randgen, randnum, (2*num_trials));
  status |= curandDestroyGenerator(randgen);  

  threads=1000;
  blocks=num_trials/threads; 

  // Allocate hit array on host
  Ncirc_t_host=(int*)malloc(num_trials*sizeof(int));
  // Allocate hit array on device
  cudaMalloc((void**)&Ncirc_t_device,num_trials*sizeof(int));

  kernel <<<blocks, threads>>> (Ncirc_t_device,randnum);

  // Synchronize host and device
  cudaDeviceSynchronize();

  // Copy the hit array to host
  cudaMemcpy(Ncirc_t_host,Ncirc_t_device,num_trials*sizeof(int),cudaMemcpyDeviceToHost);

  // Count hits 
  for(i=0; i<num_trials; i++)
    Ncirc+=Ncirc_t_host[i];

  pi = 4.0 * ((double)Ncirc)/((double)num_trials);
  
  printf("\n \t Computing pi in serial: \n");
  printf("\t For %ld trials, pi = %f\n", num_trials, pi);
  printf("\n");

  cudaFree(randnum);
  cudaFree(Ncirc_t_device);
  free(Ncirc_t_host);

  return 0;
}
