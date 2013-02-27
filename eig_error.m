% error Error measurement of eigenvalues and eigenvectors
%
% Syntax
% e = eig_error(a,v,d)
%
% Description
% The error is defined by:
% e(i) = norm(a*v(:,i) - d(i)*v(:,i))
%
% Example
% a = rand(4);
% [v,d] = eig(a);
% e = eig_error(a,v,d);

function EigError = eig_error(a,v,d)

    function EigErrorArrayfun = eig_error_arrayfun(idx,a,v,d)
        EigErrorArrayfun = norm(a*v(:,idx) - d(idx,idx)*v(:,idx));
    end        

EigError = arrayfun(@(idx)eig_error_arrayfun(idx,a,v,d),1:size(a,1));

end