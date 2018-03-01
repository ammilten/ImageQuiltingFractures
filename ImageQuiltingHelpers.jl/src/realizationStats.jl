function realizationStats(reals)
    nreals=length(reals)
    s=size(reals[1])
    
    meanReal=zeros(s[1],s[2],s[3])
    stdReal=zeros(s[1],s[2],s[3])

    for i=1:s[1]
        for j=1:s[2]
            for k=1:s[3]
            
                vals=zeros(nreals,1)
                for m=1:nreals
                    vals[m]=reals[m][i,j,k]
                end
                stdReal[i,j,k]=std(vals)
                meanReal[i,j,k]=mean(vals)
            end
        end
    end
    return meanReal, stdReal
end
;