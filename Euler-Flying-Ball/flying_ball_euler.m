% This m-File describes the simulation of a vertical throw of a ball. 
% We use the following variables:
% t - the simulation time (in single time steps)
% y - the ball's position at one state (in m)
% vy - the ball's velocity in y-direction at one state (in m/s) 
% F - the force acting on the ball at one state (in N)
% m - the ball's mass (in kg)
% g - the gravity constant (in m/s2)
% rho - the mass density of air (1.2042 kg/m3)
% A - the projected surface area of the ball
% cw - the ball's air drag coefficient (0.5)
% Initialization of the variables

% the simulation will run for five seconds 
simulationendtime = 5;

% the simulation time is divided into 500 steps 
timesteps = 500; 

deltat = simulationendtime/timesteps;

m=0.1;
g=9.81;
rho = 1.2042;
A=0.01;
cw = 0.5;

% defining the initial state
y  = zeros(1, timesteps+1); % preallocate the position and velocity vectors;
vy = zeros(1, timesteps+1); % we consider timesteps 0 to 500, i.e. 501 steps 
t  = zeros(1, timesteps+1); % preallocate the time vector (at first initialize all values by 0
vy(1)=15; %throwing the ball upwards with a velocity of 15 m/s

% looping over time
for position= 1:timesteps; % loop through the vector of positions
    % specify the time in each simulation step; t(0)=0, in every step t will be increased by 0.01 s
    t(position+1)=t(position)+deltat;
    % specify the force acting on the ball
    F=-m*g-0.5*rho*cw*A*vy(position)*vy(position)*sign(vy(position));
    % compute new velocity in next simulation step
    vy(position+1)=vy(position)+deltat*F/m;
    % compute new position in next simulation step
    y(position+1)= y(position)+vy(position)*deltat% *** Enter the code here to compute the new y-value ***
end

plot(t, y, t, vy)