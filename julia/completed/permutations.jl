#! /usr/bin/julia

# Rosetta Code, Permutations

term = "RCode"
i = 0
pcnt = factorial(length(term))
print("All the permutations of ", term, " (", pcnt, "):\n    ")
for p in permutations(split(term, ""))
    print(join(p), " ")
    i += 1
    i %= 12
    i != 0 || print("\n    ")
end
println()