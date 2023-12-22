clc; clear;
dzetas = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\dCurves.txt");
residue_min = 1e-4;
big_residue_rows = dzetas(:,5) > residue_min;
dzetas = dzetas(big_residue_rows, :);

outPoints = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\cutOffASym.txt");
Acutoff_x = outPoints(1:4,1); Acutoff_y = outPoints(1:4,2);

outPoints = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\cutOffSym.txt");
Scutoff_x = outPoints(1:4,1); Scutoff_y = outPoints(1:4,2);




IMMIstyle()
plot(dzetas(:,1), dzetas(:,3), '.', Scutoff_x, Scutoff_y, '*r', Acutoff_x, Acutoff_y, 'xr')
xlabel('f')
ylabel('\zeta')
% xticks([1 2 3 4 5])

IMMIstyle()
% ylim([0 3])