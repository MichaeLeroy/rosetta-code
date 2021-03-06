#! /usr/bin/julia

# Rosetta Code, RIPEMD-160

using Nettle

function ripemdsum(s::String)
    bytes2hex(ripemd160_hash(s))
end

mes = ["", "a", "abc", "message digest", "abcdefghijklmnopqrstuvwxyz",
       "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq",
       "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"]

h = ASCIIString[]
for s in mes
    push!(h, ripemdsum(s))
end
push!(h, ripemdsum("1234567890"^8))
push!(h, ripemdsum("a"^10^6))

t = ["9c1185a5c5e9fc54612808977ee8f548b2258d31",
     "0bdc9d2d256b3ee9daae347be6f4dc835a467ffe",
     "8eb208f7e05d987a9b044a8e98c6b087f15a0bfc",
     "5d0689ef49d2fae572b881b123a85ffa21595f36",
     "f71c27109c692c1b56bbdceb5b9d2865b3708dbc",
     "12a053384a9c0c88e405a06c27dcf49ada62eb2b",
     "b0e20b6e3116640286ed3a87a5713079b21f5189",
     "9b752e45573d4b39f4dbd3323cab82bf63326bfb",
     "52783243c1697bdbe16d37f97f68f08325dc1528"]

lab = ["\"\" (empty string)", "\"a\"", "\"abc\"",
       "\"message digest\"", "\"a...z\"",
       "\"abcdbcde...nopq\"", "\"A...Za...z0...9\"",
       "8 times \"1234567890\"", "1 million times \"a\""]
       
isok = t .== h

println("Testing Julia's RIPEMD-160 hash against its test vectors.")
for i in 1:length(h)
    print(@sprintf("    %20s => ", lab[i]), h[i], " ")
    if isok[i]
        println('\u263a')
    else
        println('\u26a0')
    end
end

if all(isok)
    println("The function passes for all test vectors.\n")
else
    println("The function fid not pass for all test vectors.\n")
end

msg = "Rosetta Code"
h = ripemdsum(msg)
println(msg, " => ", h)
