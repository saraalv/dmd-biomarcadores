
# Probabilidad

load("data/dmd.RData")

# Dado nuestro conjunto de datos, si escogemos un individuo al azar, ¿cuál
# es la probabilidad de que este individuo sea un portador?

table(dmd$carrier)
pport<-67/(length(dmd$carrier))
pport


# Supongamos que los niveles de hemopexina siguen una distribución normal,
# ¿cuál es la probabilidad de que si elegimos una portadora al azar sus
# niveles de hemopexina sean superiores a la media poblacional?

1-pnorm(mean(dmd$h),mean=mean(dmd_port$h),sd=sd(dmd_port$h)) #1-P(X<=85,976)

#¿Y en el caso del grupo control?

1-pnorm(mean(dmd$h),mean(dmd_control$h),sd(dmd_control$h)) #1-P(X<=85,976)

# Para el resto de marcadores: 
# Creatina quinasa
1-pnorm(mean(dmd$ck),mean=mean(dmd_port$ck),sd=sd(dmd_port$ck))
1-pnorm(mean(dmd$ck),mean(dmd_control$ck),sd(dmd_control$ck))
#Piruvato quinasa
1-pnorm(mean(dmd$pk),mean=mean(dmd_port$pk),sd=sd(dmd_port$pk))
1-pnorm(mean(dmd$pk),mean(dmd_control$pk),sd(dmd_control$pk))
#Lactato deshidrogenasa
1-pnorm(mean(dmd$ld),mean=mean(dmd_port$ld),sd=sd(dmd_port$ld))
1-pnorm(mean(dmd$ld),mean(dmd_control$ld),sd(dmd_control$ld))

# Sabemos que 1 de cada 3500 niños nacen con DMD, en una población del
# tamaño de Barcelona, ¿cuántas personas serían afectadas por DMD?

#Simulamos una población de 1,62M de individuos, con una probabilidad de padecer DMD de 1/3500
pdmd<-1/3500
psano<-1-pdmd
pob<-1620000
sim<-sample(c("dmd","sano"),pob,rep=T,prob=c(pdmd,psano))
table(sim)

#  Imaginemos ahora que la proporción de
# portadoras en nuestro estudio fuera representativo de la proporción de
# portadoras en la población general. ¿Cuántas mujeres portadoras habría
# en una población del tamaño de Barcelona?

psa<-1-pport
sim2<-sample(c("Portadora","Sana"),pob,rep=T,prob=c(pport,psa))
table(sim2)
