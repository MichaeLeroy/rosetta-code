#! /usr/bin/julia

# Rosetta Code, Pernicious numbers

ispernicious(n::Int) = isprime(count_ones(n))

pcnt = 0
i = 0
print("    ")
while pcnt < 25
    i += 1
    ispernicious(i) || continue
    pcnt += 1
    print(i, " ")
end
println()

print("    ")
for i in 888888877:888888888
    ispernicious(i) || continue
    print(i, " ")
end
println()
