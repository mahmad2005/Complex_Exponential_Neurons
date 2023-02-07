t = -2*pi:0.001:2*pi;

Omega_1 = 3; Theta_1 = log(0.5); Phi_1 = pi/4;
Omega_2 = 2.3; Theta_2 = log(0.5); Phi_2 = pi/4;


E1 = exp((1i*Omega_1.*t)+Theta_1);
W1 = exp(1i*Phi_1);

E2 = exp((1i*Omega_2.*t)+Theta_2);
W2 = exp(1i*Phi_2);

s1 = E1*W1;
s2 = E2*W2;
S = s1 + s2;

E = E1+E2;
figure;
plot(t,E1);
figure;
plot(t,E2);
figure;
polarplot(E);

figure;
fftE = fft(S);
fftE = abs(fftE);
plot(t(1:20),fftE(1:20));