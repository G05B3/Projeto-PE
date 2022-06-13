library(xlsx)
library(ggplot2)
max_line = 8784
tbl <- read.xlsx("QualidadeARO3.xlsx",
                 sheetIndex = 1, startRow = 1, endRow = max_line+1)
lines = c(1:max_line)
#Restelo
est1 = 8
#Laranjeiro-Almada
est2 = 5
est1 = as.numeric(c(tbl[lines,est1]))
est2 = as.numeric(c(tbl[lines,est2]))

Estação = rep(c("Restelo","Laranjeiro-Almada"),times=c(max_line,max_line))
grafico <- data.frame(est = c(est1,est2),Estação)
ggplot()+
  geom_histogram(position="identity",grafico, mapping = aes(x = est, colour = Estação, fill = Estação),
                 binwidth = 1, alpha = 0.25)+
  labs(x = "Níveis de Ozono (µg/m^3)",y = "Ocorrências",title="Níveis de Ozono no Restelo e em Laranjeiro-Almada durante 2020")
