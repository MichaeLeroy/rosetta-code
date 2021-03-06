#! /usr/bin/julia

# Rosetta Code, Narcissistic decimal number

function isnarcissist{T<:Integer}(n::T, b::Int=10)
    -1 < n || return false
    d = digits(n, b)
    m = length(d)
    n == mapreduce((x)->x^m, +, d)
end

goal = 25
ncnt = 0
println("Finding the first ", goal, " Narcissistic numbers:")
for i in 0:typemax(1)
    isnarcissist(i) || continue
    ncnt += 1
    println(@sprintf "    %2d %7d" ncnt i)
    ncnt < goal || break
end
