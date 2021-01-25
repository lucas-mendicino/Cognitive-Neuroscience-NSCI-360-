% Time Solutions to Dynamic Systems Model


% NN_ode.m

% V' = -V + f(I)                                    % (dv/dt)
% f(I) = 1./(1+exp(-4*( I - 0.5)))                  % sinusoidal function

% Initialize timespan, I_t (input), I_vals (signal), xinit

Tspan = [0 100];                                    % window, 0 to 100
I_t = linspace(Tspan(1),Tspan(2),25);               % 25 time steps, equal length
I_vals = sin(pi * I_t);                             % I is a sine wave
xinit = 0;                                          % initialize  x

% Call ode45 and solve equation

[t,v] = ode45(@(t,v) ode(t,v,I_t,I_vals), Tspan, xinit); % solve ODE using nonstiff ODE method

% Plot Solutions

figure;
hold on;
plot(t,v, 'blue');                                   % Plot V(t) solution
plot(I_t,I_vals, 'red');                            % Plot sine wave input
legend('V(t)','I(t)' )

% Function to call

function NN_ODE = ode(t,v,I_t,I_vals)               % Solve the equation dv/dt = -v + f(I) at time t
I_vals = interp1(I_t,I_vals,t);                     % get the value of I_vals at time t
NN_ODE = -v + 1./(1+exp(-4*( I_vals - 0.5)));       % Evaluate ODE at time t
end




