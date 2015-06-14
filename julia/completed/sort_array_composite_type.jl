#! /usr/bin/julia

# Rosetta Code, "Sort an array of composite structures"

type Pair{T<:String}
    name::T
    value::T
end

Base.show(a::Pair) = @sprintf "%s => %s" a.name a.value

x = Pair[Pair("gold", "shiny"),
         Pair("neon", "inert"),
         Pair("sulphur", "yellow"),
         Pair("iron", "magnetic"),
         Pair("zebra", "striped"),
         Pair("star", "brilliant"),
         Pair("apple", "tasty"),
         Pair("ruby", "red"),
         Pair("dice", "random"),
         Pair("coffee", "stimulating"),
         Pair("book", "interesting")]


println("x, the original list of pairs: ")
for p in x
    println("    ", show(p))
end

println()
println("x sorted by name:")
x = sort(x, by=a->a.name)
for p in x
    println("    ", show(p))
end

println()
println("x sorted by value:")
x = sort(x, by=a->a.value)
for p in x
    println("    ", show(p))
end

