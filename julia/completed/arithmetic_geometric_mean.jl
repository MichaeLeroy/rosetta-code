#! /usr/bin/julia

# Rosetta Code, Arithmetic-geometric mean

function agm{T<:FloatingPoint,U<:Integer}(x::T, y::T, e::U=5)
    0 < y && 0 < y && 0 < e || throw(DomainError())
    err = e*eps(x)
    (g, a) = extrema([x, y])
    while err < (a - g)
        ap = a
        a = 0.5*(a + g)
        g = sqrt(ap*g)
    end
    return a
end

x = 1.0
y = 1.0/sqrt(2.0)

println("Using literal-precision float numbers:")
println("    agm(", x, ",", y, ") = ", agm(x, y))

println()
println("Using half-precision float numbers:")
x = float16(x)
y = float16(y)
println("    agm(", x, ",", y, ") = ", agm(x, y))

println()
println("Using ", get_bigfloat_precision(), "-bit float numbers:")
x = BigFloat(1.0)
y = x/sqrt(BigFloat(2.0))
println("    agm(", x, ",", y, ") = \n    ", agm(x, y))



