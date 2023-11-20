% Clear command window, workspace, and close all figures
clc;
clear all;
close all;

% Load communications package
pkg load communications;

% Parameters
N = 1000;               % Number of data points
mlevel = 4;             % Size of signal constellation
k = log2(mlevel);       % Number of bits per symbol

% Generate random binary bit stream and convert to symbol stream
x = randi([0 1], N, 1);  % Generate random binary bit stream
xsym = bi2de(reshape(x, k, N/k).', 'left-msb');  % Convert to symbol stream

% Modulation: QAM modulation
xmod = qammod(xsym, mlevel);

% SNR values for simulation
snr_values = 0:50;
ber_values = zeros(size(snr_values));

% Simulation loop for different SNR values
for idx = 1:length(snr_values)
    % Add AWGN to the modulated signal
    Rx_x = awgn(xmod, snr_values(idx), 'measured');

    % Demodulation: QAM demodulation
    Rx_x_BitStream = reshape(de2bi(qamdemod(Rx_x, mlevel), 'left-msb').', [], 1);

    % Calculate Bit Error Rate (BER)
    [~, ber_values(idx)] = biterr(x, Rx_x_BitStream);
end

% Plot BER vs. SNR
figure;
semilogy(snr_values, ber_values, 'bo-');  % Logarithmic scale for BER
grid on;
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
title('BER vs. SNR for QAM');