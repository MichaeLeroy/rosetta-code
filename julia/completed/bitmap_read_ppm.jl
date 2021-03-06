#! /usr/bin/julia

# Rosetta Code, Bitmap/Read a PPM file

using Color, Images, FixedPointNumbers

const M_RGB_Y = reshape(Color.M_RGB_XYZ[2,:], 3)

function rgb2gray(img::Image)
    g = red(img)*M_RGB_Y[1] + green(img)*M_RGB_Y[2] + blue(img)*M_RGB_Y[3]
    g = clamp(g, 0.0, 1.0)
    return grayim(g)
end

 
ima = imread("bitmap_read_ppm_in.ppm")
imb = convert(Image{Gray{Ufixed8}}, ima)
imwrite(imb, "bitmap_read_ppm_out.png")

