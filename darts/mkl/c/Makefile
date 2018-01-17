# Makefile to compile Darts serial C code using the MKL library

# Compiler definition
# If running on Cray use compiler wrapper cc instead of directly using Intel/GNU/PGI compiler. Consider swapping to an appropriate PrgEnv- module.
# On other systems use: gcc (for GNU), icc (for Intel), pgcc (PGI)
CC = cc

# Optimisation level set to -O2
# Debugging enabled if using -g
CFLAGS = -O2 -g -mkl=sequential

# Setup include directory and libraries for MKL. Use the Intel MKL Link Line Advisor
MKL_LIBS=-Wl,--start-group ${MKLROOT}/lib/intel64/libmkl_intel_lp64.a ${MKLROOT}/lib/intel64/libmkl_sequential.a ${MKLROOT}/lib/intel64/libmkl_core.a -Wl,--end-group -lpthread -lm
MKL_INCL=-DMKL_ILP64 -I$(MKLROOT)/include

# Default target  
all: darts-mkl

darts-mkl: darts-mkl.o 
	${CC} ${CFLAGS} ${MKL_LIBS} -o darts-mkl darts-mkl.o

%.o: %.c 
	${CC} ${CFLAGS} ${MKL_INCL} -c $< -o $@

clean:
	rm -rf *.o darts-mkl
