# Makefile to compile Darts serial C code

# Compiler definition
# If running on Cray use compiler wrapper cc instead of directly using Intel/GNU/PGI compiler. Consider swapping to an appropriate PrgEnv- module.
# On other systems use: gcc (for GNU), icc (for Intel), pgcc (PGI)
NVCC = nvcc -arch=sm_60

# Optimisation level set to -O2
# Debugging enabled if using -g
CFLAGS = -O2 -g
LIBS = -lcurand

# Default target  
all: darts-cuda

darts-cuda: darts-cuda.o 
	${NVCC} ${CFLAGS} ${LIBS} -o darts-cuda darts-cuda.o

%.o: %.cu
	${NVCC} ${CFLAGS} -c $< -o $@

clean:
	rm -rf *.o darts-cuda
