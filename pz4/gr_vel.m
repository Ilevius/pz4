clear; clc; close all;

% selfTest
x = 0.1:0.1:10;
y = x.^2;
df = naive_diff(transpose(x), transpose(y));
selfTest = figure('Name','Self test','NumberTitle','off');;
plot(df(:,1), df(:,2), '--g');
% end selfTest


S0 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\S3.txt");


df = naive_diff(S0(:,1), S0(:,2));

main = figure('Name','Main Data','NumberTitle','off');;
IMMIstyle();
plot(df(:,1), df(:,2), '--');
IMMIstyle();