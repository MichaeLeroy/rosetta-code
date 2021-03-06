#! /usr/bin/julia

# Rosetta Code, Knapsack problem/Bounded

using MathProgBase

immutable KPDSupply{S<:String, T<:Integer}
    item::S
    weight::T
    value::T
    quant::T
end

function solve{S<:String, T<:Integer}(gear::Array{KPDSupply{S,T},1},
                                      capacity::T)
    w = map(x->x.weight, gear)
    v = map(x->x.value, gear)
    q = map(x->x.quant, gear)
    sol = mixintprog(-v, w', '<', capacity, :Int, 0, q)
    sol.status == :Optimal || error("This Problem could not be solved")
    if all(q .== 1)
        return gear[sol.sol .== 1.0]
    else
        pack = KPDSupply[]
        s = int(sol.sol)
        for (i, g) in enumerate(gear)
            s[i] != 0 || continue
            push!(pack, KPDSupply(g.item, g.weight, g.value, s[i]))
        end
        return pack
    end
end

gear = [KPDSupply("map", 9, 150, 1),
        KPDSupply("compass", 13, 35, 1),
        KPDSupply("water", 153, 200, 2),
        KPDSupply("sandwich", 50, 60, 2),
        KPDSupply("glucose", 15, 60, 2),
        KPDSupply("tin", 68, 45, 3),
        KPDSupply("banana", 27, 60, 3),
        KPDSupply("apple", 39, 40, 3),
        KPDSupply("cheese", 23, 30, 1),
        KPDSupply("beer", 52, 10, 3),
        KPDSupply("suntan cream", 11, 70, 1),
        KPDSupply("camera", 32, 30, 1),
        KPDSupply("T-shirt", 24, 15, 2),
        KPDSupply("trousers", 48, 10, 2),
        KPDSupply("umbrella", 73, 40, 1),
        KPDSupply("waterproof trousers", 42, 70, 1),
        KPDSupply("waterproof overclothes", 43, 75, 1),
        KPDSupply("note-case", 22, 80, 1),
        KPDSupply("sunglasses", 7, 20, 1),
        KPDSupply("towel", 18, 12, 2),
        KPDSupply("socks", 4, 50, 1),
        KPDSupply("book", 30, 10, 2)]

pack = solve(gear, 400)

println("The hiker should pack:")
for s in pack
    println("    ", s.quant, " ", s.item)
end
println()
println("Packed Weight:  ", mapreduce(x->x.weight*x.quant, +, pack))
println("Packed Value:  ", mapreduce(x->x.value*x.quant, +, pack))
