clc; clear;
S0 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\stitcher\S0.txt");
S1 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\stitcher\S1.txt");
S2 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\stitcher\S2.txt");

% asAll = S0 + A0 + S1 + A1;
IMMIstyle();
plot(S0(:,1), S0(:,4), '.', S1(:,1), S1(:,4), '.', S2(:,1), S2(:,4), '.')
legend('|s_0|', '|s_1|', '|s_2|')
xlabel('f');
% ylabel('\zeta');
ylim([0 0.012])
IMMIstyle();