clc; clear;
S0 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\S0.txt");
A0 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\A0.txt");
S1 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\S1.txt");
A1 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\A1.txt");
S2 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\S2.txt");
A2 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\A2.txt");
S3 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\S3.txt");
A3 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\DispSurfer2\A3.txt");

column = 2;
unit = '.';

IMMIstyle();

plot(S0(:,1), S0(:,column), unit, A0(:,1), A0(:,column), unit, S1(:,1), S1(:,column), unit, A1(:,1), ... 
        A1(:,column), unit, S2(:,1), S2(:,column), unit, A2(:,1), A2(:,column), unit, S3(:,1), S3(:,column), unit, A3(:,1), A3(:,column), unit, 'LineWidth',4.2);
legend('S0', 'A0', 'S1', 'A1', "S2", 'A2', 'S3', 'A3')
xlabel('f');
ylabel('\zeta');
% ylim([0 0.015]);
% xlim([1.1 1.3]);

IMMIstyle();
% grid off;