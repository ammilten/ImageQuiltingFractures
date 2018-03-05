function realizationStatsl(reals)
    nreals=length(reals)
    s=size(reals[1])
    
    meanReal=zeros(s[1],s[2],s[3])
    stdReal=zeros(s[1],s[2],s[3])
	entropyReal=zeros(s[1],s[2],s[3])
    
    for i=1:s[1]
        for j=1:s[2]
            for k=1:s[3]
            
                vals=zeros(nreals)
                for m=1:nreals
                    vals[m]=reals[m][i,j,k]
                end
                stdReal[i,j,k]=std(vals)
                meanReal[i,j,k]=mean(vals)
                
                #mess with the zeros and ones because they aren't probabilities
                v1=convert(Array{Float16,1},vals.>=.95)
                v0=convert(Array{Float16,1},vals.<=.05)
                v2=v1*.95+v0*.05
                unchanged=convert(Array{Float16,1},v2.==0)
                vnew=v2+unchanged.*vals
                
				entropyReal[i,j,k]=StatsBase.entropy(vnew)
            end
        end
    end
    return meanReal, stdReal, entropyReal
end
;