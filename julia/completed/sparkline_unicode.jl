#! /usr/bin/julia

# Rosetta Code, Sparkline in unicode

function sparklineit(a)
    const sparkchars = '\u2581':'\u2588'
    const dyn = length(sparkchars)
    (lo, hi) = extrema(a)
    b = max(iceil(dyn*(a-lo)/(hi-lo)), 1)
    return join(sparkchars[b], "")
end

function getnumbers(s)
    a = split(s, r"[,,\s]+")
    a = try
        map(parseint, a)
    catch
        map(parsefloat, a)
    end
end

test = getnumbers("1 2 3 4 5 6 7 8 7 6 5 4 3 2 1")
println(test, " => ", sparklineit(test))

test = getnumbers("1.5, 0.5 3.5, 2.5 5.5, 4.5 7.5, 6.5")
println(test, " => ", sparklineit(test))
