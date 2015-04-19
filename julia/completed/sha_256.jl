#! /usr/bin/julia

# Rosetta Code, SHA-256

clear = "Rosetta code"
standard = "764faf5c61ac315f1497f9dfa542713965b785e5cc2f707d6468d7d1124cdfcf"

using SHA

crypt = sha256(clear)

println("Testing Julia's SHA-256:")
if crypt == standard
    println("  OK, \"", clear, "\" => ", crypt)
else
    println("The hash does not match the standard value.")
end
