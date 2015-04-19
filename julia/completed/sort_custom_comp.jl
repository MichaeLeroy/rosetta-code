#! /usr/bin/julia

# Rosetta Code, Sort using a custom comparator

st = """You will rejoice to hear that no disaster has accompanied the
commencement of an enterprise which you have regarded with such evil
forebodings."""

wl = filter(x->length(x)>0, split(st, r"\W+"))

println("Original List:")
for w in wl
    println("   ", w)
end

wl = sort(wl, by=x->(-length(x), lowercase(x)))

println("\nSorted List:")
for w in wl
    println("   ", w)
end



    


    
