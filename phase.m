fs = 100;
t = -pi:pi/fs:pi-pi/fs;
%x = cos(2*pi*15*t - pi/4) - sin(2*pi*40*t);


Omega_1 = 1; Theta_1 = log(0.5); Phi_1 = pi/2;
Omega_2 = 20; Theta_2 = log(0.5); Phi_2 = pi/2;


E1 = exp((1i*Omega_1.*t)+Theta_1);
W1 = exp(1i*Phi_1);

E2 = exp((1i*Omega_2.*t)+Theta_2);
W2 = exp(1i*Phi_2);

s1 = E1*W1;
s2 = E2*W2;
S = s1 + s2;

x = S;

y = fft(x);
z = fftshift(y);

ly = length(y);
f = (-ly/2:ly/2-1)/ly*fs;

stem(f,abs(z))
xlabel 'Frequency (Hz)'
ylabel '|y|'
grid

tol = 1e-6;
z(abs(z) < tol) = 0;

theta = angle(z);

stem(f,theta/pi)
xlabel 'Frequency (Hz)'
ylabel 'Phase / \pi'
grid

figure;
plot(f, theta/pi);

