%Script to test NVortex_Sim.m for two vortices against TwoVortexA.m

clear
close all
clc

%DEFINITION OF PROBLEM PARAMETERS

X0 = [1 2 3 4];
Z = [5 6];
G = [4 4];
t1 = 1e4;
n = length(G);

%INTEGRATION, ANALYTICALLY AND NUMERICALLY

[t,Xp,Yp] = NVortex_Sim(n,t1,G,Z,X0);
[Xa,Ya] = TwoVortexA(t,X0,G,Z);

%ERROR TESTING

m = length(t);
Err = zeros(m,4);
Err(:,1) = abs(Xa(:,1)-Xp(:,1));
Err(:,2) = abs(Xa(:,2)-Xp(:,2));
Err(:,3) = abs(Ya(:,1)-Yp(:,1));
Err(:,4) = abs(Ya(:,2)-Yp(:,2));

figure(3)
loglog(t,Err(:,1),'b',t,Err(:,2),'r',t,Err(:,3),'m',t,Err(:,4),'k','linewidth',2)
legend('X_1 Error', 'X_2 Error', 'Y_1 Error', 'Y_2 Error','Location','Northwest')
title('Absolute Error vs Time')
xlabel('Time')
ylabel('Absolute Value of Error')

%INTEGRALS OF MOTION

Px = G(1)*Xp(:,1) + G(2)*Xp(:,2);
Py = G(1)*Yp(:,1) + G(2)*Yp(:,2);
I = G(1)*(Xp(:,1).^2 + Yp(:,1).^2) + G(2)*(Xp(:,2).^2 + Yp(:,2).^2);
H = (-G(1)*G(2)/(4*pi))*(((Xp(:,1) - Xp(:,2)).^2 + (Yp(:,1) - Yp(:,2)).^2 + (Z(1)-Z(2)).^2)).^(-0.5);
figure(4)
plot(t,Px,'k',t,Py,'r',t,I,'b',t,H,'m','linewidth',2)
legend('Px','Py','I','H')
title('Integrals of Motion')
xlabel('Time')
ylabel('Magnitude')
%figure(5)
%plot(t,Xp,'k','linewidth',2)



