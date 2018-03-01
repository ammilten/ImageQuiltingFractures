#This proximity transform function basically uses a v-shaped 
# function __/\__ near positive occurences. The value at each 
#pixel is determined by the nearest positive occurence. 
#A positive occurence is a pixel with a value of 1.

function proximityTransform(im,tol)
    
    s=size(im);
    prox=copy(im);

    #Loop through all pixels
    for i=1:s[1]
        for j=1:s[2]

            #For efficiency only sample around the points 
            #near events
            if im[i,j]==1

                #Subsample image near event
                l=i-tol;
                r=i+tol;
                u=j+tol;
                d=j-tol;

                #Account for edges in subsampling
                if u>s[2]
                    u=s[2];
                end
                if d<=0
                    d=1;
                end
                if r>s[1]
                    r=s[1];
                end
                if l<=0
                    l=1;
                end

                #Loop through subsampled image and transform
                for i2=l:r
                    for j2=d:u

                        #Compute distance to center pixel
                        dist=sqrt((i2-i)^2+(j2-j)^2);

                        #Compute prox transform value
                        val=max(1-dist/tol,0);

                        #Only assign if this is the nearest 
                        #occurence to the point
                        prox[i2,j2]=max(prox[i2,j2],val);
                    end
                end
            end
        end
    end
    return prox
end;