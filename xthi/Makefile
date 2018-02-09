# Makefile to compile xthi code

# Compiler definition
# If running on Cray use compiler wrapper cc instead of directly using Intel/GNU/PGI compiler. Consider swapping to an appropriate PrgEnv- module.
# On other systems load appropriate MPI module and use: mpicc
MPICC = cc

# Optimisation level set to -O2
# Debugging enabled if using -g
# Notice that OpenMP flag differs for different compiler families
# Use: -fopenmp (for GNU), -qopenmp (for Intel), -mp (for PGI)
# OpenMP is enabled by default for Cray compiler.
CFLAGS = -O2 -g 

# Default target  
all: xthi

xthi: xthi.o 
	${MPICC} ${CFLAGS} -o xthi xthi.o

%.o: %.c
	${MPICC} ${CFLAGS} -c $< -o $@

clean:
	rm -f *.o xthi
