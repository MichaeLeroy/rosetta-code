#! /usr/bin/julia

# Rosetta Code, Zero to the zero power


zs = Any[zero(Complex),
         zero(FloatingPoint),
         zero(Rational),
         zero(Integer),
         zero(Bool)]

for i in zs, j in zs
    println(i, "^", j, " = ", i^j, " (", typeof(i^j), ")")
end

