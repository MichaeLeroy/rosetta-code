#! /usr/bin/julia

# Rosetta Code, Knuth's algorithm S

function makesofn(n::Int)
    buf = Any[]
    i = 0
    function sofn(item)
        i += 1
        if i <= n
            push!(buf, item)
        else
            j = rand(1:i)
            if j <= n
                buf[j] = item
            end
        end
        return buf
    end
    return sofn
end


nhist = zeros(Int, 10)

for i in 1:10^5
    kas = makesofn(3)
    for j in 0:8
        kas(j)
    end
    for k in kas(9)
        nhist[k+1] += 1
    end
end

println("Simulating sof3(0:9) 100000 times:")
for (i, c) in enumerate(nhist)
    println(@sprintf "   %2d => %5d" i-1 c)
end



