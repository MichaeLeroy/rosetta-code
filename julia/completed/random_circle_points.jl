#! /usr/bin/julia

# Rosetta Code, Constrained random points on a circle

const LO = 10
const HI = 15
const GOAL = 100

canvas = falses(2HI+1, 2HI+1)
i = 0

while i < GOAL
    x = rand(-HI:HI)
    y = rand(-HI:HI)
    LO^2-1 < x^2 + y^2 < HI^2+1 || continue
    i += 1
    canvas[x+HI+1, y+HI+1] = true
end

for i in 1:(2HI+1)
    println("    ", join(map(j -> j ? "\u25cf " : "  ", canvas[i,:])))
end

