#! /usr/bin/julia

# Rosetta Code, Cholesky decomposition

a = [25 15 5; 15 18 0; -5 0 11]
b = [18 22 54 22; 22 70 86 62; 54 86 174 134; 42 62 134 106]

println(a, "\n => \n", chol(a, :L))
println(b, "\n => \n", chol(b, :L))
