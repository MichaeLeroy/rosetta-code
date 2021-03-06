#! /usr/bin/julia

# Rosetta Code, Detect division by zero

function isdefinite{T<:Number}(n::T)
    !isequal(n, NaN) && abs(n) != Inf
end

for n in {1, 1//1, 1.0, 1im, 0}
    d = n/0
    print("Divding ", n, " by 0 ")
    if isdefinite(d)
        println("results in ", d, ".")
    else
        println("yields an indefinite value (", d, ").")
    end
end

        



