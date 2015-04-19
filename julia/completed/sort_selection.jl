#! /usr/bin/julia

# Rosetta Code, Sorting algorithms/Selection sort

function selectionsort!{T<:Real}(a::Array{T,1})
    len = length(a)
    if len < 2
        return nothing
    end
    for i in 1:len-1
        (lmin, j) = findmin(a[i+1:end])
        if lmin < a[i]
            a[i+j] = a[i]
            a[i] = lmin
        end
    end
    return nothing
end

a = [rand(-100:100) for i in 1:20]
println("Before Sort:")
println(a)
selectionsort!(a)
println("\nAfter Sort:")
println(a)

