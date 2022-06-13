library(ggplot2)
seed = 59
lambda = 1.56
m = 1200
n = seq(from = 100, to = 5000, by = 100)
gama = 0.96 # 1 - alpha
b = qnorm((1+gama)/2)

set.seed(seed)
x = 0 #variavel aleatoria
amplitude = 0
for (i in 1:length(n))
{
  for (j in 1:m)
  {
    x[j] = mean(rexp(n[i],lambda))
  }
  aux = (2*b)/(x*sqrt(n[i]))
  amplitude[i] = mean(aux)
}

df <- data.frame(n,amplitude)

ggplot(data = df, aes(x = n, y = amplitude))+
  geom_bar(stat = "identity", color = "cyan", fill = "blue")+
  labs(title = "Média das Amplitudes em função do valor de n utilizado",
       x = "n", y = "Média das Amplitudes")