#Computes the average difference between data points
function meanDiff(x)
    diffs=x[2:end]-x[1:end-1];
    return mean(diffs)
end;