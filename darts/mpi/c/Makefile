# Makefile to compile Darts code
# If running on Magnus, use Cray compiler wrapper cc/ftn instead of directly using Intel compilers.
# Notice the Flags and Libraries requested. The current ones are for Intel compilation so consider swapping to PrgEnv-intel if compiling on Magnus.

# Compiler definition
CC = icc
F90 = ifort
MPICC = mpicc
MPIF90 = mpif90 

OMP_FLAGS = -openmp 	# OpenMP flag for Intel compiler.  
OPT_FLAGS = -g 		# Debugging enabled if using -g.  
# from http://software.intel.com/sites/products/mkl/MKL_Link_Line_Advisor.html
MKL_FLAGS = -Wl,--start-group ${MKLROOT}/lib/intel64/libmkl_intel_lp64.a ${MKLROOT}/lib/intel64/libmkl_sequential.a ${MKLROOT}/lib/intel64/libmkl_core.a -Wl,--end-group -lpthread -lm
MKL_OMP_FLAGS =  -Wl,--start-group  $(MKLROOT)/lib/intel64/libmkl_intel_ilp64.a $(MKLROOT)/lib/intel64/libmkl_intel_thread.a $(MKLROOT)/lib/intel64/libmkl_core.a -Wl,--end-group -lpthread -lm
MKL_INCL = -DMKL_ILP64 -I$(MKLROOT)/include

PROGS = darts darts-mpi darts-collective darts-omp darts-hybrid darts-mpi-mkl darts-hybrid-mkl

all: ${PROGS}

darts: darts.o lcgenerator.h
	${CC} ${OPT_FLAGS} -o darts darts.o

darts-mpi: darts-mpi.o lcgenerator.h
	${MPICC} ${OPT_FLAGS} -o darts-mpi darts-mpi.o

darts-collective: darts-collective.o lcgenerator.h
	${MPICC} ${OPT_FLAGS} -o darts-collective darts-collective.o

darts-omp: darts-omp.o lcgenerator.h
	${CC} ${OPT_FLAGS} -o darts-omp ${OMP_FLAGS} darts-omp.o

darts-hybrid: darts-hybrid.o lcgenerator.h
	${MPICC} ${OPT_FLAGS} -o darts-hybrid ${OMP_FLAGS} darts-hybrid.o

darts-mpi-mkl: darts-mpi-mkl.o
	${MPICC} ${OPT_FLAGS} -o darts-mpi-mkl darts-mpi-mkl.o ${MKL_FLAGS}

darts-hybrid-mkl: darts-hybrid-mkl.o
	${MPICC} ${OPT_FLAGS} -o darts-hybrid-mkl ${OMP_FLAGS} darts-hybrid-mkl.o ${MKL_OMP_FLAGS}

darts-mpi.o: darts-mpi.c
	${MPICC} ${OPT_FLAGS} -c darts-mpi.c

darts-collective.o: darts-collective.c
	${MPICC} ${OPT_FLAGS} -c darts-collective.c

darts-omp.o: darts-omp.c
	${CC} ${OPT_FLAGS} ${OMP_FLAGS} -c darts-omp.c

darts-hybrid.o: darts-hybrid.c
	${MPICC} ${OPT_FLAGS} ${OMP_FLAGS} -c darts-hybrid.c

darts-mpi-mkl.o: darts-mpi-mkl.c
	${MPICC} ${OPT_FLAGS} ${MKL_INCL} -c darts-mpi-mkl.c 

darts-hybrid-mkl.o: darts-hybrid-mkl.c
	${MPICC} ${OPT_FLAGS} ${OMP_FLAGS} ${MKL_INCL} -c darts-hybrid-mkl.c 

clean:
	rm -rf *.o ${PROGS}
