clc;
clear;
target = 6;

outPoints = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\cutOffASym.txt");
Acutoff_x = outPoints(1:7,1); Acutoff_y = outPoints(1:7,2);

outPoints = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\cutOffSym.txt");
Scutoff_x = outPoints(1:7,1); Scutoff_y = outPoints(1:7,2);

data = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\u.txt");
x1 = data(:,3); y1 = data(:,target);

data = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\uRes.txt");
x2 = data(:,3); y2 = data(:,target);

% plot(x1, y1, '-b', x2, y2, 'omagenta', Scutoff_x, Scutoff_y, '*r', Acutoff_x, Acutoff_y, 'xr');
% ylim([0 0.005]);


err = (abs(y2-y1))./y2;
plot(x1, err)
ylim([0 0.1]);

xlabel('f')
% ylabel('|u(x, z)|')
ylabel('\eta')
% legend('интеграл', 'вычеты', 'отсечки симметричных мод', 'отсечки антисимметричных мод')
IMMIstyle()