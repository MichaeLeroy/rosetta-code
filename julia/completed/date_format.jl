#! /usr/bin/julia

# Rosetta Code, Date format

ts = time()

println("Today's date is:")
println("    ", strftime("%F", ts))
println("    ", strftime("%A, %B %d, %Y", ts))
