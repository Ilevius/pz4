clc; clear;
S0 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\S0.txt");
A0 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\A0.txt");
S1 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\S1.txt");
A1 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\A1.txt");
S2 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\S2.txt");
A2 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\A2.txt");


IMMIstyle();
plot(S0(:,1), S0(:,4), '.', A0(:,1), A0(:,4), '.', S1(:,1), S1(:,4), '.', A1(:,1), A1(:,4), '.', S2(:,1), S2(:,4), '.', A2(:,1), A2(:,4), '.','LineWidth',3.5)
legend('S0', 'A0', 'S1', 'A1', "S2", 'A2')
xlabel('f');
ylabel('\zeta');
ylim([0 0.015])
IMMIstyle();