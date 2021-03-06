#! /usr/bin/julia

# Rosetta Code, Brownian tree


using Color, Images, FixedPointNumbers

const W = 512
const W0 = W>>1
const H = 512
const H0 = H>>1
const N = iceil(1.0*W*H)
const SIDESTICK = false


function motecolor(x::Int, y::Int)
    h = clamp(180*(atan2(y-H0, x-W0)/pi + 1.0), 0.0, 360.0)
    return HSV(h, 0.5, 0.5)
end

img = Image(zeros(RGB{Ufixed8}, H, W))
img["x", W0, "y", H0] = RGB(1, 1, 1)
isfree = trues(W, H)
isfree[W0, H0] = false
for i in 1:N
    x = rand(1:W)
    y = rand(1:H)
    isfree[x, y] || continue
    mc = motecolor(x, y)
    for j in 1:10^3
        xp = x + rand(-1:1)
        yp = y + rand(-1:1)
        iscontained = 0 < xp <= W && 0 < yp <= H
        if  iscontained && isfree[xp, yp]
            x = xp
            y = yp
            continue
        else
            if SIDESTICK || (iscontained && !isfree[xp, yp])
                isfree[x, y] = false
                img["x", x, "y", y] = mc
            end
            break
        end
    end
end

imwrite(img, "brownian_tree.png")

