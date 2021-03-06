#! /usr/bin/julia

# Rosetta Code, Four bit adder

xor{T<:Bool}(a::T, b::T) = (a&~b)|(~a&b)

halfadder{T<:Bool}(a::T, b::T) = (xor(a,b), a&b)

function fulladder{T<:Bool}(a::T, b::T, c::T=false)
    (s, ca) = halfadder(c, a)
    (s, cb) = halfadder(s, b)
    (s, ca|cb)
end

function adder(a::BitArray{1}, b::BitArray{1}, c0::Bool=false)
    len = length(a)
    length(b) == len || error("Addend width mismatch.")
    c = c0
    s = falses(len)
    for i in 1:len
        (s[i], c) = fulladder(a[i], b[i], c)
    end
    (s, c)
end

function adder{T<:Integer}(m::T, n::T, wid::T=4, c0::Bool=false)
    a = bitpack(digits(m, 2, wid))[1:wid]
    b = bitpack(digits(n, 2, wid))[1:wid]
    adder(a, b, c0)
end

Base.bits(n::BitArray{1}) = join(reverse(int(n)), "")

xavail = trues(15,15)
xcnt = 0
xgoal = 10
println("Testing adder with 4-bit words:")
while xcnt < xgoal
    m = rand(1:15)
    n = rand(1:15)
    xavail[m,n] || continue
    xavail[m,n] = xavail[n,m] = false
    xcnt += 1
    (s, c) = adder(m, n)
    oflow = c ? "*" : ""
    print(@sprintf "    %2d + %2d = %2d => " m n m+n)
    println(@sprintf("%s + %s = %s%s",
                     bits(m)[end-3:end],
                     bits(n)[end-3:end],
                     bits(s), oflow))
end
