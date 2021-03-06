#! /usr/bin/julia

# Rosetta Code, Determine if a string is numeric

function isnumeric{T<:String}(s::T)
    isa(parse(s), Number)
end

tests = ["1",
         "-121",
         "one",
         "pi",
         "1 + 1",
         "NaN",
         "1234567890123456789",
         "1234567890123456789123456789",
         "1234567890123456789123456789.0",
         "1.3",
         "1.4e10",
         "Inf",
         "1//2",
         "1.0 + 1.0im"]

for t in tests
    fl = isnumeric(t) ? "is" : "is not"
    println(@sprintf("    %35s %s a direct numeric literal.", t, fl))
end
