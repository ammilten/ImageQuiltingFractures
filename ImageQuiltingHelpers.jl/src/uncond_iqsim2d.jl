#Wrapper function for easy unconditional 2d image quilting simulation

function uncond_iqsim2d(TI,templ,nreals);
    TI2=im2TI(TI);
    sim=iqsim(TI2, templ..., size(TI2)..., nreal=nreals);
    return sim;
end;