#! /usr/bin/julia

# Rosetta Code, URL encoding

function sortselected{S<:Real,T<:Integer}(a::AbstractArray{S,1},
                                          s::AbstractArray{T,1})
    sel = unique(sort(s))
    if sel[1] < 1 || length(a) < sel[end]
        throw(ArgumentError("Tried to select outside of input array."))
    end
    b = collect(copy(a))
    b[sel] = sort(b[sel])
    return b
end

a = [7, 6, 5, 4, 3, 2, 1, 0]
sel = [7, 2, 8]
b = sortselected(a, sel)

print("Original Array:  ", a)
println(" sorted on  ", sel)
println("Sorted Array:    ", b)
    
    
        



