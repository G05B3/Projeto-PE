library(ggplot2)
seed = 155
m = 1150
n = seq(from = 100, to = 2500, by = 100)
lambda = 3.09
E = 0.15
Lc = 0.02
gama = 0.96
b = qnorm((1+gama)/2)
set.seed(seed)
x = 0 #variavel aleatoria
xc = 0
amplitude_nc = 0
amplitude_c = 0
for (i in 1:length(n))
{
  aux = 0
  for (j in 1:m)
  {
    aux = rexp(n[i],lambda)
    x[j] = mean(aux)
    xc[j] = mean(c(rexp(E*n[i],Lc),aux[E*(n[i]):n[i]]))
  }
  amplitude_nc[i] = mean((2*b)/(x*sqrt(n[i])))
  amplitude_c[i] = mean((2*b)/(xc*sqrt(n[i])))
}

Contaminação = c(rep("Não Contaminado",length(n)),rep("Contaminado",length(n)))

df <- data.frame(n, amplitude = c(amplitude_nc, amplitude_c), Contaminação)

ggplot(data = df, aes(x = n, y = amplitude,color = Contaminação))+
  geom_path(size = 1.2)+
  labs(title = "Média das Amplitudes em função do valor de n utilizado",
       x = "n", y = "Média das Amplitudes")