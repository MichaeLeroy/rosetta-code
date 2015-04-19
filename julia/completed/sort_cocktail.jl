#! /usr/bin/julia

# Rosetta Code, Sorting algorithms/Cocktail sort

function coctailsort{T<:Real}(a::Array{T,1})
    b = copy(a)
    isordered = false
    lo = one(Int)
    hi = length(b)
    while !isordered && hi > lo
        isordered = true
        for i in lo+1:hi
            if b[i] < b[i-1]
                t = b[i]
                b[i] = b[i-1]
                b[i-1] = t
                isordered = false
            end
        end
        hi -= 1
        if isordered || hi <= lo
            break
        end
        for i in hi:-1:lo+1
            if b[i-1] > b[i]
                t = b[i]
                b[i] = b[i-1]
                b[i-1] = t
                isordered = false
            end
        end
        lo += 1
    end
    return b
end

a = [rand(-2^10:2^10) for i in 1:20]
println("Before Sort:")
println(a)
a = coctailsort(a)
println("\nAfter Sort:")
println(a)

