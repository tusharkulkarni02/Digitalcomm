% Clear command window, workspace, and close all figures
clc;
clear all;
close all;

% Load the statistics package
pkg load statistics;

% Ploting case 1: Mean = 0 and Standard Deviation = 1
m = 0; % Mean of the normal distribution
sd = 1; % Standard Deviation of the normal distribution

x = -6:0.1:6; % Range of x values matlab -6 se 6 tak values 0.1 k interval pe 
y = normpdf(x, m, sd); % Compute the probability density function values

% Create a subplot grid of 3 rows and 2 columns, and select the first subplot , last me jo 1 hai vo 
position batata hai , agar 2 code ek sath run karrhe hai to pehle code me 1 dene ka 2nd code me 2 
dene ka , jo output console hai uska position define karta hai vo .
subplot(3,2,1);

% Plot the normal distribution
plot(x, y);

% Set axis limits , -6 se 6 x axis and 0 se 1 y axis 
axis([-6 6 0 1]);

% Label the axes
xlabel("X value");
ylabel("PDF");

% Set the title for the subplot
title("Case 1: Mean = 0 and SD = 1");

% Display the grid in the subplot
grid on;
--------------------------------------------------------------------------------------------------------------------------------