data = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\dCurves.txt");
plot(data(:,1), data(:,2), '.')
xlabel('f')
ylabel('s_n')
xticks([1 2 3 4 5])

IMMIstyle()
% ylim([0 0.3])