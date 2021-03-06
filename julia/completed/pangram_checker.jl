#! /usr/bin/julia

# Rosetta Code, Pangram checker

function makepangramchecker{T<:String}(a::T)
    abet = sort(unique(split(uppercase(a), "")))
    alen = length(abet)
    function ispangram{T<:String}(s::T)
        alen <= length(s) || return false
        ps = filter(c->(c in abet), unique(split(uppercase(s), "")))
        return length(ps) == alen
    end
end

tests = ["Pack my box with five dozen liquor jugs.",
         "The quick brown fox jumps over a lazy dog.",
         "The quick brown fox jumps\u2323over the lazy dog.",
         "The five boxing wizards jump quickly.",
         "This sentence contains A-Z but not the whole alphabet."]

isenglishpang = makepangramchecker("abcdefghijklmnopqrstuvwxyz")

for s in tests
    print("The sentence \"", s, "\" is ")
    if !isenglishpang(s)
        print("not ")
    end
    println("a pangram.")
end
