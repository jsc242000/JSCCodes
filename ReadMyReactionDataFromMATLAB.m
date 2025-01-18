%% Specify the reactor dimensions and initial conditions
%

% Initial volume of the reacting mass(m3)

Reactor.InitialVolume = 1.0;

% Initial Temperature (K)

Reactor.InitialTemperature = 60 + 273.15;



%% Set up chemical species and physical property information
%

% Number of chemical species

ChemicalSpecies.Num = 5;

% Molecular weight of the chemical species (kg/kmol)

ChemicalSpecies.MolecularWeight = [18; 100; 200; 100; 100];

% Density of the chemical species(kg/m3)

ChemicalSpecies.Density = [1000; 800; 900; 1000; 1000];

% Initial volume fraction(v/v%)

ChemicalSpecies.InitialVolumeFraction = [0.5; 0.5; 0; 0; 0];

% Initial moles of the reacting mass(kmol)

ChemicalSpecies.InitialMoles = zeros(ChemicalSpecies.Num,1);

for i = 1:ChemicalSpecies.Num
    
    ChemicalSpecies.InitialMoles(i) = Reactor.InitialVolume ...,
        * ChemicalSpecies.InitialVolumeFraction(i)...,
        * ChemicalSpecies.Density(i)...,
        / ChemicalSpecies.MolecularWeight(i);
    
end

ChemicalSpecies.Concentration=ChemicalSpecies.InitialMoles./Reactor.InitialVolume

%% Set up Van de Vusse reactions
%

% Number of chemical reactions

Reaction.Num = 3;


% Arrhenius pre-exponential (1/s)

Reaction.FrequencyFactor = [8088; 4.7e8; 8.73e5];

% Arrhenius activation energy (kJ/kmol)

Reaction.ActivationEnergy = [50434; 74650; 60889];

% Pre-allocate the size of the vector k and Rate which are associated with
% the Reaction

Reaction.k = zeros(Reaction.Num,1);
Reaction.Rate = zeros(Reaction.Num,1);

%%

% Define the reaction stoichiometry

Stoichiometry = [0 0 0; ...,
                 -2 -1 0;...,
                 1 0 0;...,
                 0 1 -1;...,
                 0 0 1];

%%


MyData.GasConstant = 8.314;

