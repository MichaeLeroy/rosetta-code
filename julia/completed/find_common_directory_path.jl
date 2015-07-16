#! /usr/bin/julia

# Rosetta Code, Find common directory path

function commonpath{T<:String}(ds::Array{T,1}, delim::Char='/')
    0 < length(ds) || return convert(T, "")
    1 < length(ds) || return ds[1]
    p = split(ds[1], delim)
    mcnt = length(p)
    for d in ds[2:end]
        q = split(d, delim)
        mcnt = min(mcnt, length(q))
        hits = findfirst(p[1:mcnt] .== q[1:mcnt], false)
        hits != 0 || continue
        mcnt = hits - 1
        mcnt != 0 || return convert(T, "")
    end
    1 < mcnt || p[1] != "" || return convert(T, string(delim))
    convert(T, join(p[1:mcnt], delim))
end

test = ["/home/user1/tmp/coverage/test",
        "/home/user1/tmp/covert/operator",
        "/home/user1/tmp/coven/members"]

println("Comparing")
for s in test
    println("    ", s)
end
println("for their common directory path yields:")
println("    ", commonpath(test))
