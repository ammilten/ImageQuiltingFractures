function collectSimulation(reals,TI,templSize;sTI=false,truth=false,soft=false,saveSim::Bool=false,savename="sim")
    out=Dict(
        "PrimaryTI"=>TI,
        "SecondaryTI"=>sTI,
        "Reference"=>truth,
        "SoftConditioning"=>soft,
        "Realizations"=>reals,
		"TemplateSize"=>templSize
    )
	if saveSim
		save(string(savename,".jld"),"sim",out)
	end
    return out
end