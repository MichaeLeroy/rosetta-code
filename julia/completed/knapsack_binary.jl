#! /usr/bin/julia

# Rosetta Code, Knapsack problem/0-1

using MathProgBase

immutable KPDSupply{S<:String, T<:Integer}
    item::S
    weight::T
    value::T
    quant::T
end
function KPDSupply{S<:String, T<:Integer}(item::S, weight::T, value::T)
    KPDSupply(item, weight, value, one(T))
end

function solve{S<:String, T<:Integer}(gear::Array{KPDSupply{S,T},1},
                                      capacity::T)
    w = map(x->x.weight, gear)
    v = map(x->x.value, gear)
    sol = mixintprog(-v, w', '<', capacity, :Bin, 0, 1)
    sol.status == :Optimal || error("This Problem could not be solved")
    gear[sol.sol .== 1.0]
end

gear = [KPDSupply("map", 9, 150),
        KPDSupply("compass", 13, 35),
        KPDSupply("water", 153, 200),
        KPDSupply("sandwich", 50, 160),
        KPDSupply("glucose", 15, 60),
        KPDSupply("tin", 68, 45),
        KPDSupply("banana", 27, 60),
        KPDSupply("apple", 39, 40),
        KPDSupply("cheese", 23, 30),
        KPDSupply("beer", 52, 10),
        KPDSupply("suntan cream", 11, 70),
        KPDSupply("camera", 32, 30),
        KPDSupply("T-shirt", 24, 15),
        KPDSupply("trousers", 48, 10),
        KPDSupply("umbrella", 73, 40),
        KPDSupply("waterproof trousers", 42, 70),
        KPDSupply("waterproof overclothes", 43, 75),
        KPDSupply("note-case", 22, 80),
        KPDSupply("sunglasses", 7, 20),
        KPDSupply("towel", 18, 12),
        KPDSupply("socks", 4, 50),
        KPDSupply("book", 30, 10)]

pack = solve(gear, 400)

println("The hiker should pack:")
for s in pack
    println("    ", s.item)
end
println()
println("Packed Weight:  ", mapreduce(x->x.weight, +, pack))
println("Packed Value:  ", mapreduce(x->x.value, +, pack))
