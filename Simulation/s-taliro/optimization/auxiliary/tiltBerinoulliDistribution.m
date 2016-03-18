function nDistrib = tiltBerinoulliDistribution(oldDistrib,samples,lo, hi, n)

%% build an histogram by binning the samples.

discountFactor = 0.5;

delta = (hi-lo)/n;
[nSamples dummy] = size(samples);
nDistrib = zeros(size(oldDistrib));
for i = 1:nSamples
    j = 1+floor( (samples(i,1) - lo)/delta);
    assert( j >= 1);
    assert( j <= n);
    nDistrib(1,j) = nDistrib(1,j) + 1;
end

nDistrib = nDistrib ./ nSamples;

nDistrib = discountFactor .* nDistrib  + (1 - discountFactor) .* oldDistrib;

end