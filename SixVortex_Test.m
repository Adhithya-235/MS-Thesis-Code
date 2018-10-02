%Stiffness test for ODE system with six vortices. 

clear 
close all
clc

%DEFINE PROBLEM PARAMETERS

X0 = -1 + 2*rand(1,12);
Z = 5*ones(1,6);
G = 4*ones(1,6);
t1 = 100;
n = length(G);

%NUMERICAL INTEGRATION OF SYSTEM

[t,Xp,Yp] = NVortex_Sim(n,t1,G,Z,X0);

%COMPUTE MINIMUM DISTANCES AT EACH TIMESTEP

Vd = zeros(6,6);
Hm = zeros(6,6);
MinDist = zeros(length(t),1);
H = zeros(length(t),1);
tstepsize = zeros(length(t),1);

for k = 1:length(t)
    for i = 1:6
        for j = 1:i
            
            Vd(i,j) = norm([Xp(k,i)-Xp(k,j),Yp(k,i)-Yp(k,j)]);
            Hm(i,j) = G(i)*G(j)*(Vd(i,j));
            
        end
    end
    
    MinDist(k) = min(min(Vd(Vd>0)));
    H(k) = (-1/(4*pi))*sum(sum(Hm));
    
    if k == 1
        tstepsize(k) = 0;
    else
        tstepsize(k) = t(k)-t(k-1);
    end
        
end

figure(7)
loglog(t,tstepsize,'r',t,MinDist,'b','linewidth',2)
grid on
title('Minimum Vortex Distance and Time Step Size Comparison')
xlabel('Time')
ylabel('Distance')
legend('Time Step Size','Minimum Vortex Distance')

%INTEGRALS OF MOTION

Px = sum(G.*Xp,2);
Py = sum(G.*Yp,2);
I = sum(G.*(Xp.^2 + Yp.^2),2);

figure(4)
plot(t,Px,'k',t,Py,'r',t,I,'b',t,H,'m','linewidth',2)
legend('Px','Py','I','H')
title('Integrals of Motion')
xlabel('Time')
ylabel('Magnitude')

%WRITE EVERYTHING TO FILE

%f1 = fopen('RunResults.txt','w');
%fprintf(f1,'%12s %12s %12s %12s %12s %12s %12s %12s %12s\r\n','t','Xp','Yp','MinDist','tstepsize','Px','Py','I','H');
%fprintf(f1,'%.16f %.16f %.16f %.16f %.16f %.16f %.16f %.16f %.16f\r\n',A);
%fclose(f1);






