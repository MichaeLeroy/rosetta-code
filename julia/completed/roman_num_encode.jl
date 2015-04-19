#! /usr/bin/julia

# Rosetta Code, Roman numerals/Encode

function romanencode(n::Integer)
    const DR = [["I", "X", "C", "M"] ["V", "L", "D", "MMM"]]
    rnum = ""
    if n > 4999 || n < 1
        throw(DomainError())
    end
    for (omag, d) in enumerate(digits(n))
        if d == 0
            omr = ""
        elseif d < 4
            omr = DR[omag, 1]^d
        elseif d == 4
            omr = DR[omag, 1]*DR[omag, 2]
        elseif d == 5
            omr = DR[omag, 2]
        elseif d < 9
            omr = DR[omag, 2]*(DR[omag, 1]^(d - 5))
        else
            omr = DR[omag, 1]*DR[(omag +1), 1]
        end
        rnum = omr*rnum
    end
    return rnum
end

testcases = Int64[1990, 2008, 1668]
for i in 1:12
    push!(testcases, rand(1:4999))
end
testcases = unique(testcases)

println("Test romanencode, arabic => roman:")
for i in testcases
    println(i, " => ", romanencode(i))
end
