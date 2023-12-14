data = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\u.txt");
x1 = data(:,1);
y1 = data(:,5);

data = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\uRes.txt");
x2 = data(:,1);
y2 = data(:,5);
plot(x1, y1, x2, y2, 'o')
xlabel('x, z = 0')
ylabel('Im(u(x, z))')
legend('интеграл', 'вычеты')

IMMIstyle()