
import numpy.random as rng

num_trials = 10**6
r = 1.0
r2 = r * r

Ncirc = 0
for _ in range(num_trials):
    x = rng.random() 
    y = rng.random()
    if ( x**2 + y**2 < r2 ):
	Ncirc +=1 

pi = 4.0 * ( float(Ncirc) / float(num_trials) ) 

print("\n \t Computing pi in serial: \n")
print("\t For %d trials, pi = %f\n" % (num_trials,pi))
