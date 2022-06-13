setwd('E:/Documentos/Master/Semestre 2/Visualización de datos/9. PRA2')
library(ggplot2)
install.packages("reshape")
library(reshape)

# Lectura del fichero

datos <- read.csv("players_stats_by_season_full_details.csv",sep=',')

datos_per <- datos[1:22]
datos_per <- datos_per[which(datos_per$Stage=='Regular_Season'),]

PER = (datos_per['FGM'] * 85.910+ datos_per['STL'] * 53.897+ datos_per['X3PM'] * 51.757+ datos_per['BLK'] * 39.190+ datos_per['ORB'] * 39.190+ datos_per['AST'] * 34.677+ datos_per['DRB'] * 14.707- datos_per['PF'] * 17.174- (datos_per['FTA'] - datos_per['FTM']) * 20.091- (datos_per['FGA'] - datos_per['FGM']) * 39.190- datos_per['TOV'] * 53.897)* (1 / datos_per['MIN'])
names(PER) <- c('PER')
df_per <- cbind(datos_per,round(PER,2))
df_per <- df_per[which(df_per$Season >= '2004 - 2005'),]
df_per <- df_per[order(df_per$PER,decreasing = TRUE),]
write.csv(df_per,'df_per.csv')

top_5_per_season <- rbind(
  head(df_per[which(df_per$Season == '2004 - 2005'),]), 
  head(df_per[which(df_per$Season == '2005 - 2006'),]), 
  head(df_per[which(df_per$Season == '2006 - 2007'),]), 
  head(df_per[which(df_per$Season == '2007 - 2008'),]), 
  head(df_per[which(df_per$Season == '2008 - 2009'),]), 
  head(df_per[which(df_per$Season == '2009 - 2010'),]), 
  head(df_per[which(df_per$Season == '2010 - 2011'),]), 
  head(df_per[which(df_per$Season == '2011 - 2012'),]), 
  head(df_per[which(df_per$Season == '2012 - 2013'),]), 
  head(df_per[which(df_per$Season == '2013 - 2014'),]), 
  head(df_per[which(df_per$Season == '2014 - 2015'),]), 
  head(df_per[which(df_per$Season == '2015 - 2016'),]), 
  head(df_per[which(df_per$Season == '2016 - 2017'),]), 
  head(df_per[which(df_per$Season == '2017 - 2018'),]), 
  head(df_per[which(df_per$Season == '2018 - 2019'),]), 
  head(df_per[which(df_per$Season == '2019 - 2020'),]))

top_5_per_season <- cbind(top_5_per_season['Player'],top_5_per_season['League'],top_5_per_season['Season'],top_5_per_season['Team'],top_5_per_season['PER'])
write.csv(top_5_per_season,'top_5_per_season.csv')