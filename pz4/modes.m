clc; clear;
S0 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\stitcher\S0.txt");
A0 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\stitcher\A0.txt");
S1 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\stitcher\S1.txt");
A1 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\stitcher\A1.txt");
S2 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\stitcher\S2.txt");
A2 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\stitcher\A2.txt");
ds = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\dispSurfer.txt");
sum = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\ResModSum.txt");

% asAll = S0 + A0 + S1 + A1;
IMMIstyle();
plot(S0(:,1), S0(:,2), '.', A0(:,1), A0(:,2), '.', S1(:,1), S1(:,2), '.', A1(:,1), A1(:,2), '.', S2(:,1), S2(:,2), '.', A2(:,1), A2(:,2), '.', sum(:,1), sum(:,2), '-', ds(:,1), ds(:,2), '.')
legend('S0', 'A0', 'S1', 'A1', "S2", 'A2')
xlabel('f');
ylabel('\zeta');
% ylim([0 0.012])
IMMIstyle();