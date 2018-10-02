%Analytical simulation of the two vortex problem for testing purposes

function[Xa,Ya] = TwoVortexA(t,X0,G,Z)

%COMPUTE ANALYTICAL SOLUTION TO THE PROBLEM

w = ((G(1) + G(2))/(4*pi))*((X0(1)-X0(2))^2 + (X0(3)-X0(4))^2 + (Z(1)-Z(2))^2)^(-3/2);
m = length(t);

Xa = zeros(m,2);
Ya = zeros(m,2);

Xa(:,1) = (1/(G(1) + G(2)))*(G(1)*X0(1) + G(2)*X0(2) + (X0(1)-X0(2))*G(2)*cos(w*t) - (X0(3)-X0(4))*G(2)*sin(w*t));
Xa(:,2) = (1/(G(1) + G(2)))*(G(1)*X0(1) + G(2)*X0(2) - (X0(1)-X0(2))*G(1)*cos(w*t) + (X0(3)-X0(4))*G(1)*sin(w*t));
Ya(:,1) = (1/(G(1) + G(2)))*(G(1)*X0(3) + G(2)*X0(4) + (X0(1)-X0(2))*G(2)*sin(w*t) + (X0(3)-X0(4))*G(2)*cos(w*t));
Ya(:,2) = (1/(G(1) + G(2)))*(G(1)*X0(3) + G(2)*X0(4) - (X0(1)-X0(2))*G(1)*sin(w*t) - (X0(3)-X0(4))*G(1)*cos(w*t));

%PLOT ANALYTICAL SOLUTION

%figure(2);
%for i = 1:m
    %scatter3(Xa(i,:),Ya(i,:),Z(:),3*abs(G(:)),'filled','MarkerEdgeColor','k','CData',Z(:))
    %colorbar
    %xlim([0,5])
    %ylim([0,5])
    %zlim([0,7])
    %xlabel('X')
    %ylabel('Y')
    %zlabel('Z')
    %grid on
    %hold on
    %drawnow
%end


end