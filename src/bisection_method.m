%the bisection method
f = input('please enter the function in this form (ex: @(x) sin(x)) : ' );
a = input('please enter the start value of the interval : ');
b = input('please enter the end value of the interval : ');
n = input('please enter the number of iterations or the maximum error bound : ');
% n can be calcaulated if the user enter the  maximum error bound which is less than 1
if (n < 1)
    n = ceil (log2((b-a)/n));
end
for i = 1:n
    x_i = (a+b)/2;
    if (f(a)*f(x_i) < 0)
        b = x_i;
    elseif (f(b)*f(x_i) < 0)
        a = x_i;
    end
end
x = x_i ; 
disp("the solution is : ");
disp(x);

