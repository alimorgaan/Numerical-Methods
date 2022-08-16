%euler method.
h=input('entre the step size : ');
F=input('enter the differential equation as function of x ,y in this form \n ex : @(x,y) x+y \n' );
x=[];
y=[];
fprintf('entre the coordinates of the first point\n');
x(1)=input('x= ');
y(1)=input('y= ');
endpoint=input('entre the x_coordinates of the point you want to solve  ');
n=(endpoint-x(1))/h;

for i=1:1:n
    s=i+1;
    x(s)=x(i)+h;
    s=0;
end

for i=1:1:n
    s=i+1;
    y(s)=y(i)+(h*F(x(i),y(i)));
end
    
   fprintf('the result is . %f \n',y(n+1)); 
    