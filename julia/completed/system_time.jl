#! /usr/bin/julia

# Rosetta Code, Date format

ts = time()

println("The system time is (in ISO 8601 format):")
println(strftime("    %F %T %Z", ts))

