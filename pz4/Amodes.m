clc; clear;
A0 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\stitcher\A0.txt");
A1 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\stitcher\A1.txt");
A2 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\stitcher\A2.txt");

% asAll = S0 + A0 + S1 + A1;
IMMIstyle();
plot(A0(:,1), A0(:,2), '.', A1(:,1), A1(:,2), '.', A2(:,1), A2(:,2), '.')
legend('A_0', 'A_1', 'A_2')
xlabel('f');
ylabel('\zeta');
% ylim([0 0.012])
IMMIstyle();