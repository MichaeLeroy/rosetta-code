#! /usr/bin/julia

# Rosetta Code, Web scraping

using Requests

function getusnotime()
    const url = "http://tycho.usno.navy.mil/timer.pl"
    s = try
        get(url)
        catch err
        @sprintf "get(%s)\n   => %s" url err
    end
    isa(s, Requests.Response) || return (s, false)
    t = match(r"<BR>(.*UTC)", s.data)
    isa(t, RegexMatch) || return (@sprintf("raw html:\n %s", s.data), false)
    return (t.captures[1], true)
end

(t, issuccess) = getusnotime()

if issuccess
    println("The USNO time is ", t)
else
    println("Failed to fetch UNSO time:\n", t)
end
