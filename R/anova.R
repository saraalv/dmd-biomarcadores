
# ANOVA 

load("data/dmd.RData")

ck_anova<-data.frame(dmd$carrier,dmd$ck)

# Comprobamos si la variable cuantitativa se distribuye de forma normal en cada grupo

par(mfrow=c(1,2))
qqnorm(ck_anova[ck_anova$dmd.carrier==0,"dmd.ck"],main="Control")
qqline(ck_anova[ck_anova$dmd.carrier==0,"dmd.ck"])
qqnorm(ck_anova[ck_anova$dmd.carrier==1,"dmd.ck"],main="Portadoras")
qqline(ck_anova[ck_anova$dmd.carrier==1,"dmd.ck"])

#Como nuestra muestra es >50 utilizaremos el test de Kolmogorov-Smirnov para comprobar la normalidad 
require(nortest)
by(data=ck_anova,INDICES = ck_anova$dmd.carrier,FUN=function(x){lillie.test(x$dmd.ck)})

# Realizamos el test Fligner-Killen para la diagnosis de homocedasticidad
fligner.test(ck_anova$dmd.ck~ck_anova$dmd.carrier,ck_anova)

# Se detecta falta de normalidad y heterocedasticidad en las varianzas, debido a que no
# se cumplen las condiciones del anova, no proseguiremos con su estudio de este marcador. 

# Comprobamos si la hemopexina cumple las condiciones 

h_anova<-data.frame(dmd$carrier,dmd$h)
par(mfrow=c(1,2))
qqnorm(h_anova[h_anova$dmd.carrier==0,"dmd.h"],main="Control")
qqline(h_anova[h_anova$dmd.carrier==0,"dmd.h"])
qqnorm(h_anova[h_anova$dmd.carrier==1,"dmd.h"],main="Portadoras")
qqline(h_anova[h_anova$dmd.carrier==1,"dmd.h"])

by(data=h_anova,INDICES = h_anova$dmd.carrier,FUN=function(x){lillie.test(x$dmd.h)}) #normalidad 

fligner.test(h_anova$dmd.h~h_anova$dmd.carrier,h_anova) #homocedasticidad

# Realizamos el ANOVA ya que se cumplen las condiciones
anova_h<-aov(h_anova$dmd.h~h_anova$dmd.carrier,data=h_anova)
summary(anova_h)

plot(anova_h)

