# Makefile to compile Darts hybrid C code using the MKL library

# Compiler definition
# If running on Cray use compiler wrapper cc instead of directly using Intel/GNU/PGI compiler. Consider swapping to an appropriate PrgEnv- module.
# On other systems load appropriate MPI module and use: mpicc
MPICC = cc

# Optimisation level set to -O2
# Debugging enabled if using -g
CFLAGS = -O2 -g -mkl=parallel

# Setup include directory and libraries for MKL. Use the Intel MKL Link Line Advisor
MKL_LIBS=-Wl,--start-group ${MKLROOT}/lib/intel64/libmkl_intel_lp64.a ${MKLROOT}/lib/intel64/libmkl_sequential.a ${MKLROOT}/lib/intel64/libmkl_core.a -Wl,--end-group -lpthread -lm
MKL_INCL=-DMKL_ILP64 -I$(MKLROOT)/include

# Default target  
all: darts-hybrid-mkl

darts-hybrid-mkl: darts-hybrid-mkl.o 
	${MPICC} ${CFLAGS} ${MKL_LIBS} -o darts-hybrid-mkl darts-hybrid-mkl.o

%.o: %.c 
	${MPICC} ${CFLAGS} ${MKL_INCL} -c $< -o $@

clean:
	rm -rf *.o darts-hybrid-mkl
