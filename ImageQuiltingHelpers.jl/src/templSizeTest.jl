#Wrapper function to loop through template sizes for unconditional simulations.
#templSizes must be a nx3 array where n is the number of templates to test

function templSizeTest(TI,templSizes,nreals)
    TI_size=size(TI)
    s=size(templSizes)
    
    out=Array{Array{Array{Float64,3},1}}(s[1])
    for i=1:s[1]
        println("Simulating Template $(i) of $(s[1])");
        out[i]=uncond_iqsim2d(TI, templSizes[i,:], nreals)
    end
    return out
end;