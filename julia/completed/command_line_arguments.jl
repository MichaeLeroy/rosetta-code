#! /usr/bin/julia

# Rosetta Code, Command-line arguments

prog = basename(Base.source_path())

println(prog, "'s command-line arguments are:")
for s in ARGS
    println("    ", s)
end

