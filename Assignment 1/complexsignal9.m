t = 0:0.1:10

noiseSignal1 = randn
noiseSignal2 = randn
noiseSignal3 = randn

Sig2 = sin(noiseSignal1.*t+4) + sin(noiseSignal2.*(t/2)-6)-sin((noiseSignal3.*(2/3))*t-1)
plot(t,Sig2)
fft(Sig2)
plot(t,fft(t,Sig2))

