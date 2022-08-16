%the Newton-Raphson method 
%x(i+1)=x(i)-f(i)/f'(i)
f=input('please enter the function in this form (ex: @(x) sin(x)) : ' );
first_derivative = input('enter the first derivative of the funcion : ') ;
xo=input('enter initial guess: ');
disp('Choose the stopping criterion: ');
disp('1-using no of interations ');
a = input('2-using max error bound\n');
switch a
   case 1
        A= input('enter no of interations : ');
        for i=1:A
        solution = xo - (f(xo) / first_derivative(xo)) ;
        xo=solution;
        end
    solution=xo;
   case 2
       max_error_bound=input('enter max error bound : ');
       solution = xo - (f(xo) / first_derivative(xo)) ;
       error = abs(solution - xo) ;
       while error > max_error_bound 
        xo= solution ; 
        solution = xo - (f(xo) / first_derivative(xo)) ;
        error = abs(solution -xo) ; 
       end
end

disp('the solution is : '); 
disp(solution); 

