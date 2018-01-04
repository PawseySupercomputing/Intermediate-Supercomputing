# Makefile to compile Darts code
# If running on Magnus, use Cray compiler wrapper cc/ftn instead of directly using Intel compilers.
# Notice the Flags and Libraries requested. The current ones are for Intel compilation so consider swapping to PrgEnv-intel if compiling on Magnus.

# Compiler definition
F90 = ifort

# Optimisation level set to -O2
# Debugging enabled if using -g
FFLAGS = -O2 -g

darts: darts.o
	${F90} ${FFLAGS} -o darts darts.o

%.o: %.f
	${F90} ${FFLAGS} -c $< -o $@

clean:
	rm -rf *.o *.mod darts
