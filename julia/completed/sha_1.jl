#! /usr/bin/julia

# Rosetta Code, SHA-1

using Nettle

function sha1sum(s::String)
    bytes2hex(sha1_hash(s))
end

println("Testing SHA-1 function against FIPS 180-1")

s = sha1sum("abc")
t = lowercase("A9993E364706816ABA3E25717850C26C9CD0D89D")
print("    \"abc\" should yield ", t)
if s == t
    println(", and it does.")
else
    println(", but it yields ", s)
end

s = sha1sum("abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq")
t = lowercase("84983E441C3BD26EBAAE4AA1F95129E5E54670F1")
print("    \"abcdbc...\" should yield ", t)
if s == t
    println(", and it does.")
else
    println(", but it yields ", s)
end

s = sha1sum("a"^10^6)
t = lowercase("34AA973CD4C4DAA4F61EEB2BDBAD27316534016F")
print("    a million \"a\"s should yield ", t)
if s == t
    println(", and it does.")
else
    println(", but it yields ", s)
end

println("\nAlso")
s = "Rosetta Code"
h = sha1sum(s)
println("    ", s, " => ", h)

