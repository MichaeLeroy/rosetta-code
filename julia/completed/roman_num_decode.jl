#! /usr/bin/julia

# Rosetta Code, Roman numerals/Encode

function parseroman(r::ASCIIString)
    const RD = ["I" => 1, "V" => 5, "X" => 10, "L" => 50,
                "C" => 100, "D" => 500, "M" => 1000]
    maxval = 0
    accum = 0
    for d in reverse(split(uppercase(r), ""))
        if !(d in keys(RD))
            throw(DomainError())
        end
        val = RD[d]
        if val > maxval
            maxval = val
        end
        if val < maxval
            accum -= val
        else
            accum += val
        end
    end
    return accum
end
    

testcases = ASCIIString["I", "III", "IX", "IVI", "IIM",
                        "CMMDXL", "icv", "cDxLiV", "MCMLD", "ccccccd",
                        "iiiiiv", "MMXV", "MCMLXXXIV", "ivxmm", "SPQR"]

println("Test parseroman, roman => arabic:")
for r in testcases
    print(r, " => ")
    i = try
        parseroman(r)
    catch
        "Invalid"
    end
    println(i)
end
