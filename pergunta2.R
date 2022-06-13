library(xlsx)
library(ggplot2)

tbl <- read.xlsx("EsperancaVida.xlsx",
                 sheetIndex = 1, startRow = 9, endRow = 70)

#ordem: H1,M1,H2,M2,H3,M3
dados_nomes = c("BG","IT","FR")
#colunas com os dados de interesse
dados_idx = c(42,76,55,89,51,85)
#intervalo de tempo
years = c(2002:2019)
#Esperanças Médias de Vida dos dados de interesse
EspVida = c(tbl[years-1959,dados_idx[1]],tbl[years-1959,dados_idx[2]],tbl[years-1959,dados_idx[3]],
            tbl[years-1959,dados_idx[4]],tbl[years-1959,dados_idx[5]],tbl[years-1959,dados_idx[6]])
grafico <- data.frame(years,EspVida,
        Pais = rep(dados_nomes,times=c(36,36,36)),Sexo = rep(rep(c("Homem","Mulher"),times=c(18,18)),3))

#agrupados em sexo e pais, cor de cada gráfico definida por cada grupo
p <-ggplot(data = grafico, aes(x = years,y = EspVida, color = Pais, linetype = Sexo)) +
  geom_path(size = 1.2)+ theme_bw()+
  labs(x = "Tempo (Anos)", y = "Esperança Média de Vida",
       title = "Esperança Média de Vida de Homens e Mulheres dos Paises - BG, IT e FR")
