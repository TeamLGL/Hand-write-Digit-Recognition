function [y] = layerout(w,b,x)
%output function
y = w*x + b;
n = length(y);
for i =1:n
    y(i)=1/(1+exp(-y(i)));%sigmoid
end
y;
end