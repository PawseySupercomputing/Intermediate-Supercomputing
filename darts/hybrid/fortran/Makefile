# Makefile to compile Darts Fortran MPI+OpenMP hybrid code

# Compiler definition
# If running on Cray use compiler wrapper ftn instead of directly using Intel/GNU/PGI compiler. Consider swapping to an appropriate PrgEnv- module.
# On other systems load appropriate MPI module and use: mpif90
MPIF90 = ftn

# Optimisation level set to -O2
# Debugging enabled if using -g
# Notice that OpenMP flag differs for different compiler families
# Use: -fopenmp (for GNU), -qopenmp (for Intel), -mp (for PGI)
# OpenMP is enabled by default for Cray compiler.
FFLAGS = -O2 -g -qopenmp

darts-hybrid: lcgenerator.o darts-hybrid.o
	${MPIF90} ${FFLAGS} -o darts-hybrid darts-hybrid.o lcgenerator.o

%.o: %.f
	${MPIF90} ${FFLAGS} -c $< -o $@

clean:
	rm -rf *.o *.mod darts-hybrid
