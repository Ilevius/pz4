clc; clear;
S0 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\S0.txt");
A0 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\A0.txt");
S1 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\S1.txt");
A1 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\A1.txt");
S2 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\S2.txt");
A2 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\A2.txt");

column = 2;

IMMIstyle();
plot(S0(:,1), S0(:,column), '.', A0(:,1), A0(:,column), '.', S1(:,1), S1(:,column), '.', A1(:,1), A1(:,column), '.', S2(:,1), S2(:,column), '.', A2(:,1), A2(:,column), '.','LineWidth',3.5)
legend('S0', 'A0', 'S1', 'A1', "S2", 'A2')
xlabel('f');
ylabel('\zeta');
% ylim([0 0.015])
IMMIstyle();