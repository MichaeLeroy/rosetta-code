#! /usr/bin/julia

# Rosetta Code, Sorting algorithms/Bogosort

function isordered{T}(a::AbstractArray{T,1})
    if length(a) < 2
        return true
    end
    for i in 2:length(a)
        if a[i] < a[i-1]
            return false
        end
    end
    return true
end

function bogosort!{T}(a::AbstractArray{T,1})
    while !isordered(a)
        shuffle!(a)
    end
    return a
end

a = [rand(-10:10) for i in 1:10]
println("Before bogosort:")
println(a)
bogosort!(a)
println("\nAfter bogosort:")
println(a)

