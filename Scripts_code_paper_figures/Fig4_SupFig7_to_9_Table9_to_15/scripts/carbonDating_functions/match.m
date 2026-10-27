function idx = match(X,Y)
% MATCH index that maps X onto Y: X(IX) = Y
%  X,Y must be cell array of strings with unique entries

n=length(X);
[~,IX,IY] = intersect(X,Y);
idx = zeros(1,n);
idx(IX)=IY;

