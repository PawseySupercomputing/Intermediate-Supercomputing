/* Compute pi in serial */
#include <mkl_vsl.h>
#include <stdio.h>
static long num_trials = 1000000;

int main(int argc, char **argv) {
  long i;
  long Ncirc = 0;
  double pi, xy[2];
  double r = 1.0; // radius of circle
  double r2 = r*r;

  VSLStreamStatePtr stream;

  vslNewStream(&stream, VSL_BRNG_MT2203, 1);

  for (i = 0; i < num_trials; i++) {
    vdRngUniform(VSL_RNG_METHOD_UNIFORMBITS_STD, stream, 2, xy, 0.0, 1.0);
    if ((xy[0]*xy[0] + xy[1]*xy[1]) <= r2)
      Ncirc++;
  }

  pi = 4.0 * ((double)Ncirc)/((double)num_trials);
  
  printf("\n \t Computing pi in serial: \n");
  printf("\t For %ld trials, pi = %f\n", num_trials, pi);
  printf("\n");

  return 0;
}
