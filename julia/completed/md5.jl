#! /usr/bin/julia

# Rosetta Code, MD5

using Nettle

function md5sum(s::String)
    bytes2hex(md5_hash(s))
end

function Base.trunc(s::String, n::Integer)
    0 < n || throw(DomainError())
    len = length(s)
    len > n || return s
    3 < n || return s[1:n]
    return s[1:n-3]*"..."
end
    
tests = ["" => "d41d8cd98f00b204e9800998ecf8427e",
         "a" => "0cc175b9c0f1b6a831c399e269772661",
         "abc" => "900150983cd24fb0d6963f7d28e17f72",
         "message digest" => "f96b697d7cb7938d525a2f31aaf161d0",
         "abcdefghijklmnopqrstuvwxyz" => "c3fcd3d76192e4007dfb496cca67e13b",
         "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789" =>
         "d174ab98d277d9f5a5611c2c9f419d9f",
         "12345678901234567890123456789012345678901234567890123456789012345678901234567890" =>
         "57edf4a22be3c955ac49da2e2107b67a",
         "foobad" => "3858f62230ac3c915f300c664312c63f"]


println("Testing Julia's MD5 hash against RFC 1321.")
for k in sort(collect(keys(tests)), by=(x)->length(x))
    mysum = md5sum(k)
    print(@sprintf("    %15s => ", trunc(k, 15)), mysum)
    if mysum == tests[k]
        println(" MD5 OK")
    else
        println(" MD5 Bad")
        println("    The sum should be    ", tests[k])
    end
end
