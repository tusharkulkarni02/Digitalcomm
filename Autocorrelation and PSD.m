%Autocorrelation and PSD 

% Clear command window, workspace, and close all figures
clc;
clear all;
close all;

% Load statistics package for additional statistical functions
pkg load statistics;

% Generate White Gaussian Noise
0: Mean of the distribution. In this case, the mean is set to 0.
1: Standard deviation of the distribution. This parameter controls the spread or width of the 
distribution. 
1: Number of rows in the generated matrix. In this case, it's a row vector, so there's one row.
200: Number of columns in the generated matrix. In this case, it generates a sequence of 200 
random numbers.
So, in summary, the line of code generates a row vector y containing 200 random numbers sampled 
from a normal distribution with a mean of 0 and a standard deviation of 1. This is a common way to 
generate white Gaussian noise, which is a random process with a constant power spectral density 
across all frequencies.
y = normrnd(0, 1, 1, 200);


% Compute Periodogram (Power Spectral Density - PSD) . The periodogram function computes the 
power spectral density (PSD) estimate of the input sequence y. The result is stored in the variable Gy.
Gy = periodogram(y);

% Compute Autocorrelation using Inverse FFT. ifft(Gy, 256): This part performs the inverse FFT on the 
power spectral density (Gy) to obtain the autocorrelation function. The result is a complex-valued 
vector.
256 is the length of the output sequence after applying the inverse FFT
abs(...): Taking the absolute value ensures that we get a real-valued autocorrelation.
Ry: The result is stored in the variable Ry.
Ry = abs(ifft(Gy, 256));

% Rearrange Autocorrelation for Plotting
Autocorrelation symmetric hota hai , with its peak at the centre . Lekin ifft result me zero lag 
component ho sakta hai start me ya end me. To usko balance karne k liye ye code hai . 130: 256 2nd
half hai and 1:129 1st half.
ab [Ry(130:256)' Ry(1:129)'] Concatenates the two halves to arrange the autocorrelation 
symmetrically.
Ry = [Ry(130:256)' Ry(1:129)'];

% Create Time Vector for Autocorrelation Plot -127 se 128 with step size 1 
t = -127:1:128;

% Plot Power Spectral Density (PSD)
%figure ye use karte hai figure window k liye , autocorrelation aur psd ka ek hi fig window me output 
ayega. Agar autocorrelation me bhi figure likhenge to dono ka output alag alag figure window me 
output ayega 
figure
subplot(2, 1, 1);
plot(Gy);
xlabel('Frequency Samples');
title('Power Spectral Density (PSD)');

% Plot Autocorrelation
subplot(2, 1, 2);
stem(t, Ry);
xlabel('Time Shift');
title('Autocorrelation');