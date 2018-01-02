# Makefile to compile Darts serial C code
# If running on Magnus, use Cray compiler wrapper cc/ftn instead of directly using Intel compilers.
# Notice the Flags and Libraries requested. The current ones are for Intel compilation so consider swapping to PrgEnv-intel if compiling on Magnus.

# Compiler definition
CC = icc

# Optimisation level set to -O2
# Debugging enabled if using -g
OPT_FLAGS = -O2 -g

# Default target  
all: darts

darts: darts.o 
	${CC} ${OPT_FLAGS} -o darts darts.o

%.o: %.c lcgenerator.h
	$(CC) $(OPT_FLAGS) -c $< -o $@

clean:
	rm -rf *.o darts
