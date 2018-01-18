# Makefile to compile Darts MPI collective C code

# Compiler definition
# If running on Cray use compiler wrapper cc instead of directly using Intel/GNU/PGI compiler. Consider swapping to an appropriate PrgEnv- module.
# On other systems load appropriate MPI module and use: mpicc
MPICC = cc

# Optimisation level set to -O2
# Debugging enabled if using -g
CFLAGS = -O2 -g

# Default target  
all: darts-collective

darts-collective: darts-collective.o 
	${MPICC} ${CFLAGS} -o darts-collective darts-collective.o

%.o: %.c lcgenerator.h
	${MPICC} ${CFLAGS} -c $< -o $@

clean:
	rm -rf *.o darts-collective
