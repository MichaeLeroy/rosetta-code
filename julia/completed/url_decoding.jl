#! /usr/bin/julia

# Rosetta Code, URL decoding

using URIParser

enc = "http%3A%2F%2Ffoo%20bar%2F"

dcd = unescape(enc)

println(enc, " => ", dcd)

        



