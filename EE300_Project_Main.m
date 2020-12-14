% EE300_Project_Main

% Fs = 1000;            % Sampling frequency                    
% T = 1/Fs;             % Sampling period       
% L = 1000;             % Length of signal
% t = (0:L-1)*T;        % Time vector
% t1 = linspace(0, 999, 1000);
t2 = linspace(0, 999, 1000);
S = hz.*t2; % Signal
X = S; 

% plot(1000*t(1:50),X(1:50)) % Basic Plot w/ noise
% title('Signal Corrupted with Random Noise')
% xlabel('t (milliseconds)')
% ylabel('X(t)')

Y = fft(X);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L; % Freq spectrum plot w/ noise
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

Y = fft(S);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = max(150,f);
P1 = min(P1,1000);

plot(f,P1) % w/out noise
title('Single-Sided Amplitude Spectrum of S(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

% [val, idx] = max(P1)

maximum = max(max(P1));
[x,y] = find(P1(150:500)==maximum);
x = x + 150;
x = mean(x)