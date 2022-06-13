library(ggplot2)
seed = 937
amostras = 1400
set.seed(seed)
#X distribuição uniforme em [a b]
b = 18
a = 14
#n = 3, 23 ou 81
n = 81
V_Esperado = (a + b)/2
Var = (((b-a)/sqrt(12))^2)/n
xmed = 0
for (i in 1:amostras)
  xmed[i] = mean(runif(n,a,b))
#plotting
df <- data.frame(xmed)
ggplot(data = df)+
  geom_histogram(aes(x = xmed, y = after_stat(density)), color = "darkcyan",
                 fill = "cyan1",bins = 25)+ #histograma
  #scale_y_continuous(labels = scales::percent)+
  stat_function(fun = dnorm, args = list(mean = V_Esperado, sd = sqrt(Var)),
                color = "red" )+ #curva teórica
  labs(x = "X Médio", y = "Frequência Relativa", title = paste("Histograma e Curva Pedidos, n = ",n))