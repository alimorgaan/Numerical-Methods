%the simpson 1/3 method
f = input('enter equation in the form of( @(x) sin(x) ): ' );
a = input('please enter the lower limit : ');
b = input('please enter the upper limit : ');
disp('choose the number of the available given');
disp('1- step size');
v = input('2- no of segments ');
x = a;
y = [];
switch v
    case 2
        n = input('enter the number of segments (even number) : ');
        h = (b-a)/n;
    case 1
        h = input('enter the step size : ');
        n = (b-a)/h;
end
for i = 1:n+1
    y = [y f(x)];
    x = x + h;
end
I = (h/3)*(y(1) + y(n+1) + sum(2*y(3:2:n)) + sum(4*y(2:2:n))) ; 
fprintf('the result is . %f \n',I);
