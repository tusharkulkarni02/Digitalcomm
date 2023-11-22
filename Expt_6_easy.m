clc;
clear all;
close all;
pkg load communications

N= 1000; #total bits
mlevel= 4;
k= log2(mlevel);
x= randi([0,1] , N , 1);
msym= bi2de(reshape(x, k ,length(x)/k ).' , 'left-msb');

xmod= qammod(msym, mlevel);
snr_val = 0:50;
ber_val= zeros(size(snr_val));

for i = 1:length(snr_val);
  SNR= snr_val(i);

  tx_awgn= awgn(xmod, SNR , 'measured');

  rx= tx_awgn;

  rxdemod= qamdemod(rx, mlevel);

  z= de2bi(rxdemod , 'left-msb');

  rx_bitstream=reshape( z.' , prod(size(z)) , 1);

  [num_of_errors , BER]= biterr(x, rx_bitstream );
  ber_val(i)=BER;

end

figure;
semilogy(snr_val , ber_val, 'bo-');
grid on;
xlabel('SNR');
ylabel('bit error rate');
title('QAM')


