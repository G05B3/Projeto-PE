library(xlsx)
library(ggplot2)
tbl <- read.xlsx("ResiduosPerCapita.xlsx",
sheetIndex = 1, startRow = 12, endRow = 43)

#Eslováquia
pais1 = 9
#Luxemburgo
pais2 = 21
#Países Baixos
pais3 = 23

grafico <- data.frame(paises = rep(c(tbl[pais1,1],tbl[pais2,1],tbl[pais3,1]),2),
  res_ca = c(tbl[pais1,2],tabela[pais2,2],tbl[pais3,2],tbl[pais1,3],tbl[pais2,3],tbl[pais3,3]),
  Anos = rep(c("2004","2018"),times=c(3,3)))

#desenhar gráfico
p <- ggplot(data = grafico, mapping = aes(x = paises, y = res_ca, fill = Anos)) +
  geom_bar(stat = "identity", position = "dodge")+
  theme_minimal()+
  labs(x = "Países", y = "Resíduos per Capita",
     title = "Resíduos per Capita de LU, NL e SK em 2004 e 2018")

p + scale_fill_brewer(palette="Blues")

  