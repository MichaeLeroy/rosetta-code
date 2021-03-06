#! /usr/bin/julia

# Rosetta Code, Rep-string

function list_reps{T<:String}(r::T)
    n = length(r)
    replst = T[]
    for m in 1:n>>1
        s = r[1:chr2ind(r,m)]
        (s^(div(n,m)+1))[1:chr2ind(r,n)] == r || continue
        push!(replst, s)
    end
    return replst
end

tests = {"1001110011",
         "1110111011",
         "0010010010",
         "1010101010",
         "1111111111",
         "0100101101",
         "0100100",
         "101",
         "11",
         "00",
         "1",
         "\u2200\u2203\u2200\u2203\u2200\u2203\u2200\u2203"}

for r in tests
    replst = list_reps(r)
    rlen = length(replst)
    print(@sprintf("    %s ", r))
    if rlen == 0
        println("is not a rep-string.")
    else
        println("is a rep-string of ", join(replst, ", "), ".")
    end
end

        
