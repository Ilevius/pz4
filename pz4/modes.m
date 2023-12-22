clc; clear;
S0 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\MUDILA\S0.txt");
A0 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\MUDILA\A0.txt");
S1 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\MUDILA\S1.txt");
A1 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\MUDILA\A1.txt");
IMMIstyle();
plot(S0(:,1), S0(:,2), '.', A0(:,1), A0(:,2), '.', S1(:,1), S1(:,2), '.', A1(:,1), A1(:,2), '.')
legend('S0', 'A0', 'S1', 'A1')
xlabel('f');
ylabel('\zeta');
IMMIstyle();