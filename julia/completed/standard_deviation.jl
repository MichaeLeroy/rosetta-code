#! /usr/bin/julia

# Rosetta Code, Standard deviation

function makerunningstd()
    a = zero(Float64)
    b = zero(Float64)
    n = zero(Int64)
    function runningstd(x)
        a += x
        b += x^2
        n += 1
        std = sqrt(n*b - a^2)/n
        return std
    end
    return runningstd
end

test = [2, 4, 4, 4, 5, 5, 7, 9]

rstd = makerunningstd()

println("Perform a running standard deviation of ", test)
for i in test
    println(i, " => ", rstd(i))
end

