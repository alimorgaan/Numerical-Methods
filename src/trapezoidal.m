y=input('enter equation in the form of( @(x) sin(x) ): ');
a=input('enter lower limit:');
b=input('enter upper limit:');
disp('choose the number of the available given');
disp('1- step size');
A = input('2- no of segments ');
y1=[];     x=a;
switch A
   case 1
        h= input('enter step:');
        n=(b-a)/h;
        for i=1:n+1
        y2=y(x);
        y1(i)=y2;
        x=x+h;
        end
    case 2
        n=input('enter no of segments:');
        h=(b-a)/n;
        for i=1:n+1
        y2=y(x);
        y1(i)=y2;
        x=x+h;
        end
end
z=y1(2:end-1);
I=(h/2)*(y1(1)+y1(end)+2*sum(z));
fprintf('the result is . %f \n',I); 
