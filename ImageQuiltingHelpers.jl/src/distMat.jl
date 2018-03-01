#This function concatenates the conditional, unconditional, and training images then 
#computes a (2n+1)x(2n+1) distance matrix to be used for multidimensional scaling.

function distMat(A,TI,Ref)
    
    #Compute lengths
    NA=length(A)

    N=NA+2
       
    #Initialize output
    D=zeros(N,N)
    
    #Convert TI & Ref to proper form
    z1=Array{Array{Float64,3},1}(1)
    z1[1]=TI
    z2=Array{Array{Float64,3},1}(1)
    z2[1]=Ref
    
    #Concatenate realizations and training image
    Z=vcat(A,z1,z2)
    
    #Compute all distances
    for i=1:N
        for j=1:N
            D[i,j]=Distances.evaluate(Euclidean(),Z[i],Z[j])
        end
    end
    
    D
end
;