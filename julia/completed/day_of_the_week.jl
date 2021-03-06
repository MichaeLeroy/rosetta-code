#! /usr/bin/julia

# Rosetta Code, Day of the week

isdefined(:Date) || using Dates

lo = 2008
hi = 2121
xmas = Date(lo, 12, 25):Year(1):Date(hi, 12, 25)

smas = recur(xmas) do y
    Dates.dayofweek(y) == Dates.Sun
end

println("Years (from ", lo, " to ", hi, ") having Christmas on a Sunday:")

for y in smas
    println("    ", Dates.year(y))
end
