function [output_args, k] = gauss_seidel(A, B, X)
%Gauss_seidel Find the solution to a system of linear equations using
%Gauss_seidel Elimination
%   Input:
%           A: Matrix of coeffecients 
%           B: Matrix of constants
%           X: Initial guesses
%   This function takes matrix of coeffecients and the matrix of constants
%   and computes the solution to the system of linear equations using
%   Gaussian-Seidel Elimination


tol = 0.001;
[na , ~ ] = size (A);
% Separation of matrix A into lower triangular and upper triangular matrices
% A = D + L + U
D = diag(diag(A));
L = tril(A)- D;
U = triu(A)- D;

% allowable error in final answer
t = tol*ones(na,1);
k= 1;

err= 1000000000*rand(na,1);                                     % initial error assumption for looping
while sum(abs(err) >= t) ~= zeros(na,1)
    X ( : ,k+ 1 ) = -inv(D+L)*(U)*X(:, k) + inv(D+L)*B;        % Gauss-Seidel formula
    err = X( :,k+1) - X( :, k);                                 % finding error
    k = k + 1;
end

output_args = X;

end

