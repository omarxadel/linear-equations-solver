function [ output_args ] = jordan_el( A, B )
%JORDAN_EL Find the solution to a system of linear equations using
%Gaussian-Jordan Elimination
%   Input:
%           A: Matrix of coeffecients 
%           B: Matrix of constants
%   This function takes matrix of coeffecients and the matrix of constants
%   and computes the solution to the system of linear equations using
%   Gaussian-Jordan Elimination

    i = 1;
    X = [ A B ]; 
    [ nX, mX ] = size(X); 
    while i <= nX 
        if X(i,i) == 0
            output_args = 'No solution!';
            return
        end
        X = eliminate(X, i);
        i = i+1;
    end
    
    C = X(:,mX);
    C = double(C);
    output_args = ['X', num2str(1), ' = ',num2str(double(C(1))), '     '];
    for i=2:nX
        output_args = [output_args, 'X', num2str(i), ' = ',num2str(C(i)), '     '];
    end
end

