#! /usr/bin/julia

# Rosetta Code, Loops/Continue

for i in 1:10
    print(i)
    if i%5 == 0
        println()
        continue
    end
    print(", ")
end



    


    
