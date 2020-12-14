[x,fs] = audioread('./mixed8000samp.wav');

Ns = length(x);
t = (1/fs) * (1:Ns);
Xk = abs(fft(x));
Xk = Xk(1:Ns/2);
f = fs*(0:Ns/2-1)/Ns;

plot(f, Xk/max(Xk))
xlim([0 1000]);
ylim([0 0.5]);

xlabel('Frequency (Hz)')
ylabel('Amplitude')