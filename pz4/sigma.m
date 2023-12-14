clc
data = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\sigma.txt");
alfa = data(:,1);
dz1r = data(:,3);
dz1i = data(:,4);
alfa1 = data(1:4:end,1);
dz2r = data(1:4:end,5);
dz2i = data(1:4:end,6);
plot(alfa, dz1r, 'r', alfa, dz1i, '--r', alfa1, dz2r, 'xb', alfa1, dz2i, 'ob');
legend('Re(\sigma_1)','Im(\sigma_1)', 'Re(\sigma_2)','Im(\sigma_2)')
IMMIstyle();