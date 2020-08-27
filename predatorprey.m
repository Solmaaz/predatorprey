% matlab program for reproducing figures of the "Relaxation oscillation profile of limit cycle in predator-prey
% system" article by Sze-Bi Hsu and Junping Shi

% Solmaz G.

clc;
clear all;
clf;
% defining parameters than can change for plotting diffrent systems
%dt=0.1;
runtime=100;
initialu=1;
initialv=1;
a=0.5;
m=1;
d=0.1;
%du=0.1;
%dv=0.1;



% solving diff eqn by the help of ode 45 function
diff=@(t,U)[U(1)*(1-U(1))-(m*U(1)*U(2))/(a+U(1));U(2)*(-d +(m*U(1))/(a+U(1)))];
[t,sol]=ode45(diff,[0,runtime],[initialu,initialv]);

% definnig eqns in case needed for drawing u_isocline and v_isocline and
% vector field
udot=sol(:,1).*(sol(:,1)-1)-m*sol(:,1).*sol(:,2)/(a+sol(:,1));
vdot=-d*sol(:,2)+m*sol(:,1).*sol(:,2)/(a+sol(:,1));

figure(1) % ploting solution curves 
plot(t(:,1),sol(:,1));
hold on;
plot(t(:,1),sol(:,2));
hold off;
legend('ode 4 5');
xlabel('Time (s)');
ylabel('Population density');
title('predator-prey system');


figure(2) % plotting phase portrait
plot(sol(:,1),sol(:,2));
hold on;
%ucline=(a*d)/(m-d); %v_isoline
%vcline=((1-sol(:,1)).*(a+sol(:,1)))/m; % u_isocline
%plot(ucline);
%hold on;
%plot(vcline);
%hold on;
xlabel('U');
ylabel('V');

%needed for vector field
%[x,y] = meshgrid(sol(:,1),sol(:,2));
%[u,v] = meshgrid(udot(:,1),vdot(:,2));
%L=sqrt(udot.^2+vdot.^2);
%quiver(x,y,u./L,v./L,.5);
%hold off;

