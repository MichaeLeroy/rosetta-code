#! /usr/bin/julia

# Rosetta Code, Five weekends

isdefined(:Date) || using Dates

const wday = Dates.Fri
const lo = 1900
const hi = 2100
const showres = 5

mfive = recur(Date(lo, 1):Month(1):Date(hi, 12)) do m
    Dates.daysinmonth(m) == 31 && Dates.dayofweek(m) == wday
end

println("Considering the years from ", lo, " to ", hi, ".\n")
println("There are ", length(mfive), " months having 5 3-day weekends.")

println("The first ", showres, " such months are:")
for m in mfive[1:showres]
    println("    ", Dates.monthname(m), " ", Dates.year(m))
end

println("\nThe last ", showres, " such months are:")
for m in mfive[end-showres+1:end]
    println("    ", Dates.monthname(m), " ", Dates.year(m))
end

print("\nThere are ", length(filter(y -> !(y in year(mfive)), lo:hi)))
println(" years that have no such months.")
