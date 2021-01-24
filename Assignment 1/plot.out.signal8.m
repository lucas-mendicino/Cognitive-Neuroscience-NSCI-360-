for x = 0:0.1:10
      Sig1 = sin(x) + sin(2*x)
      plot(x, Sig1), grid on
end


t = 0:0.1:10
Sig1 = sin(t) + sin(2*t)

plot(t,Sig1)



t = 0:0.001:10
noiseSignal = randn
Sig1 = sin(noiseSignal.*t) + sin(2.*noiseSignal.*t)
plot(t,Sig1)
