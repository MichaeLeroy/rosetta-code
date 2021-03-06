#! /usr/bin/julia

# Rosetta Code, Arithmetic-geometric mean/Calculate Pi

function agm_step{T<:FloatingPoint}(x::T, y::T)
    (0.5*(x + y), sqrt(x*y))
end

function approx_pi_step{T<:FloatingPoint,U<:Integer}(x::T, y::T, z::T, n::U)
    (a, g) = agm_step(x, y)
    k = n + 1
    s = z + 2^(k+1)*(a^2 - g^2)
    return (a, g, s, k)
end

function approx_pi{T<:FloatingPoint}(a::T, g::T, s::T)
    4a^2/(1 - s)
end

prec = 512
set_bigfloat_precision(prec)
println("Approximating pi using ", prec, "-bit floats.")
println("   k     Error  Result")
a = big(1.0)
g = a/sqrt(big(2.0))
s = big(0.0)
k = 0
oldagpi = big(0.0)
for i in 1:100
    (a, g, s, k) = approx_pi_step(a, g, s, k)
    agpi = approx_pi(a, g, s)
    2eps(agpi) < abs(agpi-oldagpi) || break
    oldagpi = agpi
    err = pi - agpi
    print(@sprintf("  %2d ", i))
    print(@sprintf(" %9.1e", err))
    println(@sprintf(" %.60e", agpi))
end


