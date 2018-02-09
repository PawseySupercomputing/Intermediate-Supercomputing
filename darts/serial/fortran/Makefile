# Makefile to compile Darts Fortran code

# Compiler definition
# If running on Cray use compiler wrapper ftn instead of directly using Intel/GNU/PGI compiler. Consider swapping to an appropriate PrgEnv- module.
# On other systems use: gfortran (for GNU), ifort (for Intel), pgf90 (PGI)
F90 = ftn

# Optimisation level set to -O2
# Debugging enabled if using -g
FFLAGS = -O2 -g

darts: darts.o
	${F90} ${FFLAGS} -o darts darts.o

%.o: %.f
	${F90} ${FFLAGS} -c $< -o $@

clean:
	rm -rf *.o *.mod darts
