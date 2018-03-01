#Wrapper function to apply the proximity transform to each element in an array
function realProxTrans(reals,tol=30)
    N=length(reals)
    
    out=Array{Array{Float64,3},1}(N)
    
    for i=1:N
        out[i]=proximityTransform(reals[i],tol)
    end
    
    out
end
;