#! /usr/bin/julia

# Rosetta Code, User input/Text

print("String? ")
y = chomp(readline())
println("Your input was \"", y, "\".\n")
print("Integer? ")
y = chomp(readline())
try
    y = parseint(y)
    println("Your input was \"", y, "\".\n")
catch
    println("Sorry, but \"", y, "\" does not compute as an integer.")
end

