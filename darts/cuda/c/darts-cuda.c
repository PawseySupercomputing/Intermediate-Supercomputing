/* Compute pi in serial */
#include "lcgenerator.h"
#include <stdio.h>
static long num_trials = 1000000;

__global__ void kernel(int* Ncirc,float *randnum)
{
  int i;
  double r = 1.0; // radius of circle
  double r2 = r*r;
  double x,y;

  i = blockDim.x * blockIdx.x + threadIdx.x;
  x=randnum[2*i];
  y=randnum[2*i+1];
  
  if ((x*x + y*y) <= r2)
      Ncirc[i]=1;
  else 
      Ncirc[i]=0;
}

int main(int argc, char **argv) {
  long Ncirc=0;
  float *randnum;
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


  //pi = 4.0 * ((double)Ncirc)/((double)num_trials);
  
  printf("\n \t Computing pi in serial: \n");
  printf("\t For %ld trials, pi = %f\n", num_trials, pi);
  printf("\n");

  cudaFree(randnum);

  return 0;
}
