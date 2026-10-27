function y = cellLoss(a)
% Y = CELLLOSS fraction cell loss 

% kill all cell over 10 years old
y = a./(10+a); 
