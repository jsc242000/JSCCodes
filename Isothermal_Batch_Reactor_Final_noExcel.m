%% ISOTHERMAL_BATCH_REACTOR Simulate isothermal batch reactor
%
%% Description
% Simulation of an isothermal batch reactor. There are three
% reactions,
%
% A + A ---> B
% A --> C
% C --> D
% 
% As this is an isothermal simulation there is no energy balance

clear all;
close all;
clc

%% Read all the data from MATLAB

 ReadMyReactionDataFromMATLAB;


%% We can use the stoichiometry to get number of species and number of reactions
%  These two variables are required and have not been defined (explicitly)
%  in Excel

[ChemicalSpecies.Num, Reaction.Num] = size(Stoichiometry);

%% Set the simulation time

hour = 3600;

SimulationTime = 4.444 * hour;

%% load the simulation

IsothermalBatch_v1;

%% Set the simulation parameters

set_param('IsothermalBatch_v1',...           
          'Solver','ode23s',...  
          'StopTime','SimulationTime')
      
%% Call the simulation

sim('IsothermalBatch_v1');

%% Plot the simulation results
% xconc= (Moles.Data(:, 1))/2.4e-5;

figure


plot(Conc.Time,Conc.Data(:, 1:ChemicalSpecies.Num), ...
    'LineWidth', 2)
    

title ('Reactor composition', ...
      'FontName', 'AvantGarde', ...
      'FontSize', 12, ...
      'FontWeight', 'bold');

xlabel('Time (seconds)',...
      'FontName', 'AvantGarde', ...
      'FontSize', 10);

ylabel('Concentration (molL^-1)', ...
      'FontName', 'AvantGarde', ...
      'FontSize', 10); 
  
%legend(ChemicalSpecies.Name(2:4));
  
ax = gca; % current axes

    ax.FontName = 'Helvetica';

    ax.Box = 'off';

    ax.TickDir = 'out';

    ax.TickLength = [.02 .02];

    ax.XMinorTick = 'on';
    
    ax.YMinorTick = 'on';
    
    ax.XColor = 'k';
    
    ax.YColor = 'k';
    
    ax.LineWidth = 1;

%% Plot of the volume with respect to time
%

% figure
% 
% plot(Volume.Time,Volume.Data, ...
%     'LineWidth', 2)
%     
% 
% title ('Reactor volume', ...
%       'FontName', 'AvantGarde', ...
%       'FontSize', 12, ...
%       'FontWeight', 'bold');
% 
% xlabel('Time (seconds)',...
%       'FontName', 'AvantGarde', ...
%       'FontSize', 10);
% 
% ylabel('Volume (m3)', ...
%       'FontName', 'AvantGarde', ...
%       'FontSize', 10); 
%    
% ax = gca; % current axes
% 
%     ax.FontName = 'Helvetica';
% 
%     ax.Box = 'off';
% 
%     ax.TickDir = 'out';
% 
%     ax.TickLength = [.02 .02];
% 
%     ax.XMinorTick = 'on';
%     
%     ax.YMinorTick = 'on';
%     
%     ax.XColor = 'k';
%     
%     ax.YColor = 'k';
%     
%     ax.LineWidth = 1;

% hold on
% 
% Data = load('H2O2conc30.mat');
% x=Data.H2O2conc30(:,1);
% y=Data.H2O2conc30(:,2);
% plot(x,y,'o','LineWidth',1.5,'MarkerSize',4)
