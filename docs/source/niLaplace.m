function ft = niLaplace(fun,t)
%  ft = niLaplace(fun,t)
%    fun      fun to be inverted
%    t        time.
%    ft       The value of the inverse transform at (t = time) 
%
%  Lateef Kareem
%  Computational Scientist, Cyphercresent Ltd, 2025
%
%Refferences:
% 1. Villinger, H., 1985, Solving cylindrical geothermal problems using
%   Gaver-Stehfest inverse Laplace transform, Geophysics, vol. 50 no. 10 p.
%   1581-1587
% 2. Stehfest, H., 1970, Algorithm 368: Numerical inversion of Laplace transform,
%    Communication of the ACM, vol. 13 no. 1 p. 47-49
%
L = 16; nn2 = L/2; v = zeros(L,1); ln2_on_t = log(2.0) / t;
persistent LapInv_V;
if(isempty(LapInv_V) || numel(LapInv_V) ~= L)
    for n = 1:L
        z = 0.0; i = floor((n+1)/2);
        for k = i:min(n,nn2)
            num = (k^(nn2+1))*nchoosek(2*k, k);
            den = factorial(nn2 - k)*factorial(n-k)*factorial(2*k - n);
            z = z + num/den;
        end
        v(n)=(-1)^(n+nn2)*z;
    end
    LapInv_V = v;
else
    v = LapInv_V;
end
ft = ln2_on_t*(arrayfun(@(n) fun(n * ln2_on_t), 1:L)*v);