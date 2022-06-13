setwd('E:/Documentos/Master/Semestre 2/Visualización de datos/9. PRA2')
library(ggplot2)
install.packages("reshape")
library(reshape)

# Lectura del fichero

datos <- read.csv("players_stats_by_season_full_details.csv",sep=',')

nba_extranjeros <- datos[which(datos$League=='NBA' & datos$nationality != 'United States' & datos$Stage=='Regular_Season'),]
PER = (nba_extranjeros['FGM'] * 85.910+ nba_extranjeros['STL'] * 53.897+ nba_extranjeros['X3PM'] * 51.757+ nba_extranjeros['BLK'] * 39.190+ nba_extranjeros['ORB'] * 39.190+ nba_extranjeros['AST'] * 34.677+ nba_extranjeros['DRB'] * 14.707- nba_extranjeros['PF'] * 17.174- (nba_extranjeros['FTA'] - nba_extranjeros['FTM']) * 20.091- (nba_extranjeros['FGA'] - nba_extranjeros['FGM']) * 39.190- nba_extranjeros['TOV'] * 53.897)* (1 / nba_extranjeros['MIN'])
names(PER) <- c('PER')
nba_extranjeros <- cbind(nba_extranjeros,round(PER,2))

paises <- c('Argentina / Italy','Austria','Belgium / France','Bosnia and Herzegovina','Bosnia and Herzegovina / Croatia','Croatia','Czech Republic','England / Nigeria','England / South Sudan','England / United States',
            'Finland','France','France / United States','Georgia','Germany','Germany / United States','Greece / Nigeria','Israel','Italy','Italy / United States','Latvia','Lithuania','Montenegro','Montenegro / Spain',
            'Netherlands','Netherlands / South Sudan','Netherlands / United States','Nigeria / England','Nigeria / United States','North Macedonia','North Macedonia / Turkey','Poland','Russia','Serbia','Serbia / Greece',
            'Slovenia','Spain','Sweden','Switzerland','Switzerland / Montenegro','Switzerland / Turkey','Turkey','Ukraine','United States / Croatia','United States / Germany','United States / Greece','United States / Israel',
            'United States / Lithuania','United States / Norway','United States / Turkey')

df_extrajeros <- cbind(nba_extranjeros['Season'],nba_extranjeros['nationality'],nba_extranjeros['Player'],nba_extranjeros['PER'])

df_extrajeros$nationality %in% paises
df_extrajeros <- df_extrajeros[which(df_extrajeros$nationality %in% paises),]
df_extrajeros <- df_extrajeros[order(df_extrajeros$nationality,decreasing = TRUE),]
write.csv(df_extrajeros,'df_extrajeros.csv')
