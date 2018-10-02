%Function that simulates the dynamics of n point vortex charges in a
%quasigeostrophic atmosphere.

function[t,Xp,Yp] = NVortex_Sim(n,t1,G,Z,X0)

tspan = [0 t1]; %Integration time

%NUMERICAL SOLUTION OF PROBLEM
options = odeset('RelTol',1e-16,'AbsTol',1e-16);
[t,X] = ode113(@(t,X) Vort_ODEs(t,X,G,Z,n),tspan,X0,options);
Xp = X(:,1:n);
Yp = X(:,(n+1):(2*n));

%PLOT NUMERICAL SOLUTION AT EACH TIME-STEP
%figure(1);
%for i = 1:length(t)
    %scatter3(Xp(i,:),Yp(i,:),Z(:),3*abs(G(:)),'filled','MarkerEdgeColor','k','CData',Z(:))
    %colorbar
    %xlim([-5,5])
    %ylim([-5,5])
    %zlim([1,7])
    %xlabel('X')
    %ylabel('Y')
    %zlabel('Z')
    %grid on
    %hold on
    %drawnow
%end

end



