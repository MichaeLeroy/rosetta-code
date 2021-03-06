#! /usr/bin/julia

# Rosetta Code, Sorting algorithms/Counting sort

function countsort{T<:Integer}(a::Array{T,1})
    (lo, hi) = extrema(a)
    b = zeros(T, length(a))
    cnt = zeros(Int, hi - lo + 1)
    for i in a
        cnt[i - lo + 1] += 1
    end
    z = one(Int)
    for i in lo:hi
        while cnt[i - lo + 1] > 0
            b[z] = i
            z += 1
            cnt[i - lo + 1] -= 1
        end
    end
    return b
end

a = Uint8[rand(1:typemax(Uint8)) for i in 1:20]
println("Sort of Unsigned Bytes:")
println("    Before Sort:")
println("    ", a)
a = countsort(a)
println("\n    After Sort:")
println("    ", a, "\n")

a = [rand(1:2^10) for i in 1:20]
println("Sort of Integers:")
println("    Before Sort:")
println("    ", a)
a = countsort(a)
println("\n    After Sort:")
println("    ", a)

