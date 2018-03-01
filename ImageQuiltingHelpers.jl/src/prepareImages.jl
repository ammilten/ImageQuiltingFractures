#This function does 3 things:
#    1. Clips and transposes binary image
#    2. Interpolates the enveloped image to match binary image dims
#    3. Computes the proximity transform of clipped binary image
#
#It is intended to be used to easily prepare my custom data for
#use in image quilting simulation

function prepareImages(st,proxTol=30)
    
    #Initial size
    s=size(st["binary"]);

    xAux=st["xTI"][1,:];
    xPrim=st["x"][22:end-21]; #There's padding
    
    #Compute average distance and use it to find proper indices for clipping
    md=meanDiff(st["xTI"]);
    ind1=closest_index(xPrim,xAux[1]-md);
    ind2=closest_index(xPrim,xAux[end]+md);
    
    #Initialize outputs
    outP=transpose(st["binary"][ind1:ind2,1:end-1]);
    outS=zeros(s[2]-1,ind2-ind1+1)
    
    #Interpolation
    for i=ind1:ind2
        ni=closest_index(xAux,xPrim[i]);
        outS[:,i-ind1+1]=st["sTI"][:,ni];
    end
	
	#For normalizing
	auxMax=maximum(outS)
	auxMin=minimum(outS)
    
    return im2TI(outP), im2TI((outS-auxMin)/(auxMax-auxMin)), im2TI(proximityTransform(outP,proxTol))
end;