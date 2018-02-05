# Makefile to compile Darts Fortran MPI code

# Compiler definition
# If running on Cray use compiler wrapper ftn instead of directly using Intel/GNU/PGI compiler. Consider swapping to an appropriate PrgEnv- module.
# On other systems load appropriate MPI module and use: mpif90
MPIF90 = ftn

# Optimisation level set to -O2
# Debugging enabled if using -g
FFLAGS = -O2 -g

darts-mpi: lcgenerator.o darts-mpi.o
	${MPIF90} ${FFLAGS} -o darts-mpi darts-mpi.o lcgenerator.o

%.o: %.f
	${MPIF90} ${FFLAGS} -c $< -o $@

clean:
	rm -rf *.o *.mod darts-mpi
