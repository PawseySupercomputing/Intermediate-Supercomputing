# Makefile to compile Darts serial C code

# Compiler definition
# If running on Cray use compiler wrapper cc instead of directly using Intel/GNU/PGI compiler. Consider swapping to an appropriate PrgEnv- module.
# On other systems use: gcc (for GNU), icc (for Intel), pgcc (PGI)
CC = icc

# Optimisation level set to -O2
# Debugging enabled if using -g
CFLAGS = -O2 -g

# Default target  
all: darts

darts: darts.o 
	${CC} ${CFLAGS} -o darts darts.o

%.o: %.c lcgenerator.h
	${CC} ${CFLAGS} -c $< -o $@

clean:
	rm -rf *.o darts
