%jacobi method
fprintf('The equation will be in this form a1x1+a2x2=c\n');
n=input('Enter the number of unknowns   ');
x=zeros(1,n);
x1=zeros(1,n);
a=zeros(n,n);
c=zeros(n,1);
Sum=0;

for i=1:1:n
    fprintf('Entre the initial value of variable  no. %d ',i);
    x(i)=input(':');
end
for i=1:1:n
    fprintf('Entre the coefficients as a vector for ex: if 3x+2y+z=4 then coefficients = [ 3 2 1]\n');
    fprintf('In equation no. %d \n',i);
 
    a(i,:)=input('the coefficients are ');
  
    fprintf('Entre c ');
    c(i,1)=input(': ');
end
t=input('entre number of iterations.');
for i=1:1:t
    for j=1:1:n
       if (j==1)
         for  k=j+1:1:n
            y=(a(j,k).*x(k));
            Sum=Sum+y;
         end
       elseif (j==n)
               for k=1:1:j-1
                 y=(a(j,k).*x(k));
                 Sum=Sum+y;
               end
       else
          for k=1:1:j-1
             y=(a(j,k).*x(k));
             Sum=Sum+y;
          end
          for k=j+1:1:n
            y=(a(j,k).*x(k));
            Sum=Sum+y;
          end
       end  
        x1(j) =(c(j,1)- Sum)./a(j,j);
        Sum=0;
    end
            x=x1;
 end
   
 fprintf('the result is . %f \n',x);

