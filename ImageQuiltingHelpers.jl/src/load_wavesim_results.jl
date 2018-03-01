
function load_wavesim_results(fracdata)
#Load Wavesim MPS simulations
wavesim=matread("conditional sims.mat")

#Convert those realizations to our standard training image format
cond_wavesim_mat=wavesim["sim2"]["results"]
cond_wavesim=Array{Array{Float64,3},1}(3)

for k=1:3
    z=reshape(cond_wavesim_mat[:,k],1000,31)

    #Initial size
    st=fracdata["TI2_dmig"]
    s=size(st["binary"]);

    xAux=st["xTI"][1,:];
    xPrim=st["x"][22:end-21]; #There's padding

    #Compute average distance and use it to find proper indices for clipping
    md=meanDiff(st["xTI"]);
    ind1=closest_index(xPrim,xAux[1]-md);
    ind2=closest_index(xPrim,xAux[end]+md);

    #Initialize outputs
    z2=zeros(s[2]-1,ind2-ind1+1)

    #Interpolation
    for i=ind1:ind2
        ni=closest_index(xAux,xPrim[i]);
        z2[:,i-ind1+1]=z[:,ni];
    end
    
    cond_wavesim[k]=im2TI(z2)
end
cond_wavesim
end
;