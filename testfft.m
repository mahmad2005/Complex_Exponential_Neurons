Fs = 1000;
t = -pi:pi/Fs:pi-pi/Fs;
%x = cos(2*pi*15*t - pi/4) + cos(2*pi*40*t + pi/2);

Omega_1 = 1; Theta_1 = log(0.5); Phi_1 = pi/2;
Omega_2 = 1; Theta_2 = log(0.5); Phi_2 = pi/2;
Omega_3 = 8; Theta_3 = log(1); Phi_3 = pi/2;
Omega_4 = 12; Theta_4 = log(0.5); Phi_4 = pi/2;

%x = cos(2*pi*2*t - pi/4) + sin(2*2*pi*t + pi/2);
E1 = exp((1i*100*Omega_1.*t)+Theta_1);
E2 = exp((1i*400*Omega_2.*t)+Theta_2);

x = E1+E2;
y = fft(x);
z = fftshift(y);

ly = length(y);
f = (-ly/2:ly/2-1)/ly*Fs;
stem(f,abs(z))
title("Double-Sided Amplitude Spectrum of x(t)")
xlabel("Frequency (Hz)")
ylabel("|y|")
grid

figure;
plot(t,x);
figure;
absZ = abs(z)/100;
%plot(f(51:150),absZ(5001:5100));
plot(f,absZ);