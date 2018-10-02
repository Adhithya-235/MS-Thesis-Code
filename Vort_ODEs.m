%Sets up 2n ODEs for n vortices in an infinite-domain version of the problem posed by V M Gryanik. 
%X is a vector of size 2n representing x and y positions, G is an n-vector of
%vortex strengths, Z is an n-vector of vortex heights. The quantity N/l is
%taken to be 1.

function [XDOT] = Vort_ODEs(t,X,G,Z,n)

XC = X(1:n); %X-Coordinates of Vortices
YC = X(n+1:2*n); %Y-Coordinates of Vortices

[D,A,B] = Int_Matrix(XC,YC,Z); %Set up interaction matrices for vortices

[XD,YD] = DEQ_Func(G,D,A,B); %Set up X and Y differential equations

XDOT = zeros(2*n,1);
XDOT(1:n) = XD;
XDOT((n+1):(2*n)) = YD;

end