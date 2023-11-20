# Shannon Fannon
clc;
clear;
close all;

pkg load communications;
list_symb = [1 2 3 4 ];
list_proba = [0.5 0.25 0.15 0.1];
dict = shannonfanodict(list_symb,list_proba);
disp(" ");
disp("Shannon Fano dict:");
disp(dict);
avg_codelength = 0; %declaring variable to store value of avg_codelength
entropy = 0; %declaring variable to store value of entropy
%the following loop calculates the valus of avg_codelength and entropy
for i = 1:length(list_symb)
avg_codelength = avg_codelength +(list_proba(i)*length(dict{i}));
%formula to calculate avg_codelength
entropy = entropy + (-(list_proba(i)*log2(list_proba(i))));
%formula to calculate entropy
end
%displaying avg_codelength and entropy
disp("Average Code Length :");
disp(avg_codelength);
disp('');
disp("Entropy :");
disp(entropy);
disp('');
%calculation to find the code efficiency in %
disp("Coding Effeciency(in Percentage) :");
%below is the formula of coding efficiency in %
disp((entropy/avg_codelength)*100);
disp('');
input=[4 1 2 3 2 4 3 1 2 3]
% this data will be encoded for the transmission
encode=shannonfanoenco(input,dict); % function to perform shannonfano encoding
decode=shannonfanodeco(encode,dict); % function to perform shannonfano decode
%displaying the shannon fano encoded and decoded data
disp("Input Signal:");
disp(input);
disp("Encoded signal:");
disp(encode);
disp("Decoded signal:");
disp(decode);


# Huffman
clc;
clear;
close all;
pkg load communications;
list_symb = [1 2 3 4 ];
list_proba = [0.5 0.25 0.15 0.1];
dict = huffmandict(list_symb,list_proba);
disp(" ");
disp("Huffman dict:");
disp(dict)
avg_codelength = 0; %declaring variable to store value of avg_codelength
entropy = 0; %declaring variable to store value of entropy
%the following loop calculates the valus of avg_codelength and entropy
for i = 1:length(list_symb)
avg_codelength = avg_codelength +(list_proba(i)*length(dict{i}));
%formula to calculate avg_codelength
entropy = entropy + (-(list_proba(i)*log2(list_proba(i))));
%formula to calculate entropy
end
%displaying avg_codelength and entropy
disp("Average Code Length :");
disp(avg_codelength);
disp('');
disp("Entropy :");
disp(entropy);
disp('');
%calculation to find the code efficiency in %
disp("Coding Effeciency(in Percentage) :");
%below is the formula of coding efficiency in %
disp((entropy/avg_codelength)*100);
disp('');
input=[4 1 2 3 2 4 3 1 2 3] % this data will be encoded for the transmission
encode=shannonfanoenco(input,dict); % function to perform shannonfano encoding
decode=shannonfanodeco(encode,dict); % function to perform shannonfano decode
%displaying the shannon fano encoded and decoded data
disp("Input Signal:");
disp(input);
disp("Encoded signal:");
disp(encode);
disp("Decoded signal:");
disp(decode);