%Given an n-vector of vortex strengths (G) and (n x n) interaction matrices (D,A,B) as
%defined in Int_Matrix.m, this function computes the right-hand sides of the 2n ODEs
%associated with this n-vortex problem.

function[XDOT,YDOT] = DEQ_Func(G,D,A,B)

n = length(G);
XDOT = zeros(n,1);
YDOT = zeros(n,1);

for i = 1:n
    XDOT(i) = (-1/(4*pi))*sum(G.*B(i,:).*D(i,:));
    YDOT(i) = (1/(4*pi))*sum(G.*A(i,:).*D(i,:));
end

end