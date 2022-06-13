library(xlsx)
library(ggplot2)

tbl <- read.xlsx("Utentes.xlsx",sheetIndex = 1)
#IMC
col1 = 3
#colestrol
col2 = 2
n_utentes = 1:76
#Scatter Plot de Colestrol em Função do IMC
grafico <- data.frame(IMC = tbl[n_utentes,col1],Colestrol = tbl[n_utentes,col2])
ggplot(data = grafico, mapping = aes(x = IMC, y = Colestrol))+
  geom_point(size = 1.8) +
  geom_smooth(method=lm)+
  labs(title = "Scatter Plot: IMC e Colestrol dos 76 Utentes")