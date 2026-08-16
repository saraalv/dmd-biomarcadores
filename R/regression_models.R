
# REGRESIÓN LINEAL 

load("data/dmd.RData")

## nos interesa conocer si existen factores, como puede ser la edad, que también 
# afecte los niveles de estos marcadores.

cor(dmd,method="pearson")

# relación entre la edad y los niveles de hemopexina

library(ggplot2)
ggplot(dmd,aes(x=age, y=h))+geom_point()+geom_smooth(color="slategray2",
                 fill="gainsboro")+theme_light()+labs(x="Edad",y="Nivel de hemopexina",
                                          title="Niveles de hemopexinas según la edad")

modelo<-lm(dmd$h~dmd$age,data=dmd)
summary(modelo)

plot(dmd$age,dmd$h,xlab="Edad",ylab="Nivel de hemopexina")
abline(modelo)


# modelo de regresión múltiple utilizando todas las variables
mrm_h<-lm(dmd$h~dmd$age+dmd$ck+dmd$pk+dmd$ld+dmd$carrier+dmd$sdate+dmd$obsno,data=dmd)
summary(mrm_h)

step(object = mrm_h,direction = "both",trace=1) # De entre todos estos predictores, seleccionamos los mejores

# ejecutamos el modelo mejorado

pred<-lm(formula = dmd$h ~ dmd$age + dmd$ck + dmd$ld + dmd$carrier, data = dmd)
summary(pred)
