#! /usr/bin/julia

# Rosetta Code, Vector products

function scltrip{T<:Number}(a::AbstractArray{T,1},
                            b::AbstractArray{T,1},
                            c::AbstractArray{T,1})
    dot(a, cross(b, c))
end

function vectrip{T<:Number}(a::AbstractArray{T,1},
                            b::AbstractArray{T,1},
                            c::AbstractArray{T,1})
    cross(a, cross(b, c))
end

a = [3, 4, 5]
b = [4, 3, 5]
c = [-5, -12, -13]

println("Test Vectors:")
println("   a = ", a)
println("   b = ", a)
println("   c = ", a)

println("\nVector Products:")
println("   a dot b = ", dot(a, b))
println("   a cross b = ", cross(a, b))
println("   a dot b cross c = ", scltrip(a, b, c))
println("   a cross b cross c = ", vectrip(a, b, c))
