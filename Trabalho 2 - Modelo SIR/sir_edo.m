clear;
clc;

alpha = double(input(""));  % 0.4
gamma = double(input(""));  % 0.05
h = double(input(""));  % 0.5

S0 = 1;
I0 = 1e-6;
R0 = 0;

H = 100;

[Seuler, Ieuler, Reuler] = sir_edo_euler (S0, I0, R0, alpha, gamma, h, H);
printf("Maximo de infectados pelo Euler %.6f\n", max(Ieuler));

[Srk2, Irk2, Rrk2] = sir_edo_rk2 (S0, I0, R0, alpha, gamma, h, H);
printf("Maximo de infectados pelo RK2 %.6f\n", max(Irk2));

[Srk4, Irk4, Rrk4] = sir_edo_rk4 (S0, I0, R0, alpha, gamma, h, H);
printf("Maximo de infectados pelo RK4 %.6f\n", max(Irk4));

%plot(0:h:H, Ieuler);
%hold on;

%plot(0:h:H, Irk2);
%hold on;

%plot(0:h:H, Irk4);
%set(gca, "linewidth", 4, "fontsize", 14)
%legend("I-Euler", "I-RK2", "I-RK4");
%xlabel("Time period");
%ylabel("Number of people")
