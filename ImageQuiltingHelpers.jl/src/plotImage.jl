#Easy Plotting function
function plotImage(im)
    s=size(im);
    if s[1]==s[2]
        pcolormesh(transpose(im[:,end:-1:1]))
    else
        pcolormesh(im[end:-1:1,:])
    end
end;