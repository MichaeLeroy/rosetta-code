#! /usr/bin/julia

# Rosetta Code, Sorting algorithms/Pancake sort

function pancakesort!{T<:Real}(a::Array{T,1})
    len = length(a)
    if len < 2
        return a
    end
    for i in len:-1:2
        j = indmax(a[1:i])
        i != j || continue
        a[1:j] = reverse(a[1:j])
        a[1:i] = reverse(a[1:i])
    end
    return a
end

pancakesort{T<:Real}(a::Array{T,1}) = pancakesort!(copy(a))

println("Testing a pancake sort.")
a = [rand(-100:100) for i in 1:20]
println("Pre:   ", a)
b = pancakesort(a)
println("Post:  ", b)

