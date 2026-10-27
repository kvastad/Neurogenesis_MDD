function q = simpsons(func,a,b)
% SIMPSONS quadrature

N =399; h = (b-a)/(N-1);
x = (a:h:b).'; % nodes
w = ones(1,N); w(2:2:N-1) = 4; w(3:2:N-2) = 2; w = w*h/3; % weights

q = w * ( func(x) );
if any(q~=q) % quickest way to check for NaN? 
    q = NaN;
end