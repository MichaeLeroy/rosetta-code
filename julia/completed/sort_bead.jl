#! /usr/bin/julia

# Rosetta Code, Sorting algorithms/Bead sort

function beadsort{T<:Integer}(a::Array{T,1})
    (lo, hi) = extrema(a)
    if lo < 1
        throw(DomainError())
    end
    hi = convert(Int, hi)
    len = length(a)
    abacus = falses(len, hi)
    for (i, v) in enumerate(a)
           abacus[i,1:v] = true
    end
    for i in 1:hi
        v = sum(abacus[:,i])
        if v < len
            abacus[1:end-v,i] = false
            abacus[end-v+1:end,i] = true
        end
    end
    return T[sum(abacus[i,:]) for i in 1:len]
end

a = Uint8[rand(1:typemax(Uint8)) for i in 1:20]
println("Sort of Unsigned Bytes:")
println("    Before Sort:")
println("    ", a)
a = beadsort(a)
println("\n    After Sort:")
println("    ", a, "\n")

a = [rand(1:2^10) for i in 1:20]
println("Sort of Integers:")
println("    Before Sort:")
println("    ", a)
a = beadsort(a)
println("\n    After Sort:")
println("    ", a)

