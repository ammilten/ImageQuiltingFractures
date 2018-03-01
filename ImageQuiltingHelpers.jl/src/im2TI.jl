#Easy function for making TIs from 2d arrays
function im2TI(im)
    s=size(im);
    TI=Array{Float64}(s[1],s[2],1);
    TI[:,:,1]=im;
    return TI;
end;