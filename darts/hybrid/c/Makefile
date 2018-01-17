# Makefile to compile Darts MPI+OpenMP hybrid C code

# Compiler definition
# If running on Cray use compiler wrapper cc instead of directly using Intel/GNU/PGI compiler. Consider swapping to an appropriate PrgEnv- module.
# On other systems load appropriate MPI module and use: mpicc
MPICC = cc

# Optimisation level set to -O2
# Debugging enabled if using -g
# Notice that OpenMP flag differs for different compiler families
# Use: -fopenmp (for GNU), -qopenmp (for Intel), -mp (for PGI)
# OpenMP is enabled by default for Cray compiler.
CFLAGS = -O2 -g -qopenmp

# Default target  
all: darts-hybrid

darts-hybrid: darts-hybrid.o 
	${MPICC} ${CFLAGS} -o darts-hybrid darts-hybrid.o

%.o: %.c lcgenerator.h
	${MPICC} ${CFLAGS} -c $< -o $@

clean:
	rm -rf *.o darts-hybrid
