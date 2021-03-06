#! /usr/bin/julia

# Rosetta Code, Multifactorial

function multifact{T<:Integer,U<:Integer}(n::T, k::U)
    -1<n && 0<k || throw(DomainError())
    1 < k || return factorial(n)
    r = one(T)
    for i in n:-k:2
        r *= i
    end
    return r
end

khi = 5
nhi = 10
println("Showing multifactorial for n in [1,", nhi, "] and k in [1,", khi, "].")
for k = 1:khi
    a = Int64[multifact(i, k) for i in 1:nhi]
    lab = "n"*"!"^k
    println(@sprintf("  %-6s =>  ", lab), a)
end

        
    
    
    
