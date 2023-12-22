clc;
clear;
c1 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\curve1.txt");
c2 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\curve2.txt");
c3 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\curve3.txt");
c4 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\curve4.txt");
c5 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\curve5.txt");
c6 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\curve6.txt");
c7 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\curve7.txt");
c8 = load("C:\Users\tiama\OneDrive\Рабочий стол\IMMI\Nedospasov\pz4\pz4\curve8.txt");

plot(c1(:,1),c1(:,4), '.', c2(:,1),c2(:,2), '.', c3(:,1),c3(:,2), '.', c4(:,1),c4(:,2), '.')