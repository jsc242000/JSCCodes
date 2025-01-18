% %% Set initial values
% k1 = 0.4526
% k2 = 0.3958
% k3 = 0.3523
% 
cMeOH = 3
cTG = 1
cBD = 0
cDG = 0
cMG = 0
cGL = 0
% %% Set expressions
% % Constant Values
% r1 = k1*cMeOH*cTG 
% r2 = k2*cMeOH*cDG
% r3 = k3*cMeOH*cMG
% 
% dcMeOH_dt = -r1-r2-r3
% dcTG_dt = -r1
% dcBD_dt = r1+r2+r3
% dcDG_dt = r1-r2
% dcMG_dt = r2-r3
% dcGL_dt = r3

%% Set integration time span 
TSpan = [0 100];

%% Solve the ODE (s)
yO =[cMeOH, cTG,  cBD, cDG, cMG, cGL]
[tout, y] = ode45(@myode, TSpan ,yO);

%% Plotting results from ode45
plot(tout,y,'k', 'Linewidth', 2)
grid;
xlabel('Time (Days)')
ylabel('Concentration (kmolm^-3)')
legend('cMeOH','cTG','cDG','cGL','cBD','cMG')
title('Plot of Concentration vs Time')

















