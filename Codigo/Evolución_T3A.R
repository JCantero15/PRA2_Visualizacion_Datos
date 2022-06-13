setwd('E:/Documentos/Master/Semestre 2/Visualización de datos/9. PRA2')
library(ggplot2)
install.packages("reshape")
library(reshape)

# Lectura del fichero

datos <- read.csv("players_stats_by_season_full_details.csv",sep=',')

evolucion_t3 <- cbind(datos['League'],datos['Season'],datos['X3PM'],datos['X3PA'])

agrupado <- aggregate(cbind(evolucion_t3$X3PM,evolucion_t3$X3PA), by=list(evolucion_t3$League,evolucion_t3$Season), FUN=sum)

nba <- agrupado[which(agrupado$Group.1=='NBA' & agrupado$Group.2 >= '2004 - 2005'),]
euroleague <- agrupado[which(agrupado$Group.1=='Euroleague' & agrupado$Group.2 >= '2004 - 2005'),]
eurocup <- agrupado[which(agrupado$Group.1=='Eurocup' & agrupado$Group.2 >= '2004 - 2005'),]
acb <- agrupado[which(agrupado$Group.1=='Spanish-ACB' & agrupado$Group.2 >= '2004 - 2005'),]
lega <- agrupado[which(agrupado$Group.1=='Italian-Lega-Basket-Serie-A' & agrupado$Group.2 >= '2004 - 2005'),]
bbl <- agrupado[which(agrupado$Group.1=='German-BBL' & agrupado$Group.2 >= '2004 - 2005'),]
fje <- agrupado[which(agrupado$Group.1=='French-Jeep-Elite' & agrupado$Group.2 >= '2004 - 2005'),]
nbl <- agrupado[which(agrupado$Group.1=='Australian-NBL' & agrupado$Group.2 >= '2004 - 2005'),]

df_final <- rbind(nba,euroleague,eurocup,acb,lega,bbl,fje,nbl)

###############################Funciones auxiliares#################################################

t3a_function <- function  (df){
  df_final <- data.frame()
  for (i in 1:nrow(df)){
    if (i==1){
      df_final <- cbind(data.frame(df$Group.1[1]),data.frame(df$V1[i]))
    }else{
      df_final <- cbind(df_final,data.frame(df$V1[i]))
    }
  }
  return(df_final)
}

t3p_function <- function  (df){
  df_final <- data.frame()
  for (i in 1:nrow(df)){
    if (i==1){
      df_final <- cbind(data.frame(df$Group.1[1]),data.frame(df$V2[i]))
    }else{
      df_final <- cbind(df_final,data.frame(df$V2[i]))
    }
  }
  return(df_final)
}

################################################################################

t3a_nba <- t3a_function(nba)
t3p_nba <- t3p_function(nba)
t3a_euroleague <- t3a_function(euroleague)
t3p_euroleague <- t3p_function(euroleague)
t3a_eurocup <- t3a_function(eurocup)
t3p_eurocup <- t3p_function(eurocup)
t3a_acb <- t3a_function(acb)
t3p_acb <- t3p_function(acb)
t3a_lega <- t3a_function(lega)
t3p_lega <- t3p_function(lega)
t3a_fje <- t3a_function(fje)
t3p_fje <- t3p_function(fje)
t3a_nbl <- t3a_function(nbl)
t3p_nbl <- t3p_function(nbl)

df_t3a <- rbind(t3a_nba,t3a_euroleague,t3a_eurocup,t3a_acb,t3a_lega,t3a_fje,t3a_nbl)
df_t3p <- rbind(t3p_nba,t3p_euroleague,t3p_eurocup,t3p_acb,t3p_lega,t3p_fje,t3p_nbl)



names(df_t3p) <- c('Liga', '2004 - 2005', '2005 - 2006', '2006 - 2007', '2007 - 2008', '2008 - 2009', '2009 - 2010',
                   '2010 - 2011', '2011 - 2012', '2012 - 2013', '2013 - 2014', '2014 - 2015', '2015 - 2016', '2016 - 2017', 
                   '2017 - 2018', '2018 - 2019', '2019 - 2020')


nba <- agrupado[which(agrupado$Group.1=='NBA' & agrupado$Group.2 >= '2004 - 2005'),]
euroleague <- agrupado[which(agrupado$Group.1=='Euroleague' & agrupado$Group.2 >= '2004 - 2005'),]
eurocup <- agrupado[which(agrupado$Group.1=='Eurocup' & agrupado$Group.2 >= '2004 - 2005'),]
acb <- agrupado[which(agrupado$Group.1=='Spanish-ACB' & agrupado$Group.2 >= '2004 - 2005'),]
lega <- agrupado[which(agrupado$Group.1=='Italian-Lega-Basket-Serie-A' & agrupado$Group.2 >= '2004 - 2005'),]
bbl <- agrupado[which(agrupado$Group.1=='German-BBL' & agrupado$Group.2 >= '2004 - 2005'),]
fje <- agrupado[which(agrupado$Group.1=='French-Jeep-Elite' & agrupado$Group.2 >= '2004 - 2005'),]
nbl <- agrupado[which(agrupado$Group.1=='Australian-NBL' & agrupado$Group.2 >= '2004 - 2005'),]

t3p_evolution <- cbind(nba[2],nba[4],euroleague[4],eurocup[4],acb[4],lega[4],bbl[4],fje[4],nbl[4])
names(t3p_evolution) <- c('Year', 'NBA', 'EUROLEAGUE', 'EUROCUP', 'ACB', 'LEGA', 'BBL', 'FJE', 'NBL')

write.csv(t3p_evolution,'t3p_evolution.csv')
