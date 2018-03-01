module ImageQuiltingHelpers

using MAT
using ImageQuilting
using PyPlot
using Distances
using JLD

include("closest_index.jl")
include("distMat.jl")
include("im2TI.jl")
include("uncond_iqsim2d.jl")
include("meanDiff.jl")
include("plotImage.jl")
include("prepareImages.jl")
include("proximityTransform.jl")
include("realProxTrans.jl")
include("templSizeTest.jl")
include("load_wavesim_results.jl")
include("realizationStats.jl")
include("ust.jl")
include("collectSimulation.jl")

export
	distMat,
	im2TI,
	uncond_iqsim2d,
	closest_index,
	meanDiff,
	plotImage,
	prepareImages,
	proximityTransform,
	realProxTrans,
	templSizeTest,
	load_wavesim_results,
	realizationStats,
	ust,
	collectSimulation
end
