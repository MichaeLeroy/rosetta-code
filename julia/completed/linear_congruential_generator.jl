#! /usr/bin/julia

# Rosetta Code, Linear congruential generator

function lcg_maker{T<:Integer}(r::T, a::T, c::T, m::T, sh::T)
    state = r
    function lcg_rand()
        state = mod(a*state + c, m)
        return state >> sh
    end
    return lcg_rand
end

snum = 10
seed = 0
bsd_rand = lcg_maker(seed, 1103515245, 12345, 2^31, 0)

print("The first ", snum, " results for a BSD rand() seeded with ")
println(seed, ":")

for i in 1:snum
    println(@sprintf "%14d" bsd_rand())
end

ms_rand = lcg_maker(seed, 214013, 2531011, 2^31, 16)

println()
print("The first ", snum, " results for a M\$ rand() seeded with ")
println(seed, ":")

for i in 1:snum
    println(@sprintf "%14d" ms_rand())
end


        
