function [ mat ] = elimination( mat, i )
%ELIMINATE A function that eliminates matrix elements to reach a diagonal
%matrix
%   Input:
%           mat: Matrix to eliminate
%           row: Row to eliminate with

[ nMat, ~ ] = size(mat); 
a = mat(i, i);
mat(i,:) = mat(i,:)/a;
for k =  1:nMat
    if k == i
        continue
    end
    mat(k,:) = mat(k,:) - mat(i,:)*mat(k, i);
end

