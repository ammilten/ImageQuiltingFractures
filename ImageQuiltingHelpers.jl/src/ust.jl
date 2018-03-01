function ust(im)
    s=size(im)
    
    N=s[1]*s[2]*s[3]
    vec=reshape(im,N)
    
    si=sortperm(vec)
    
    out=zeros(N)
    out[si]=(1:length(si))/length(si)

    return reshape(out,s[1],s[2],s[3])
end
;
