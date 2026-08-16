
# Análisis exploratorio 

load("data/dmd.RData")

# observar la estructura de los datos

head(dmd) 
dim(dmd)
names(dmd)

# información más relevante

summary(dmd)
table(dmd$age)
table(dmd$carrier)

# Distribucion de edad por grupos

table(dmd_control$age)
table(dmd_port$age)

## Representacion gráfica 

library(ggplot2)
boxplot(dmd_control$age,dmd_port$age,dmd$age,names=c("Grupo control","Portadores","Total"),
        col=c("pink2","lightblue","palegreen3"),ylab="Edad",main="Distribución de la edad")

# Summary por grupos

summary(dmd_control)
summary(dmd_port)

# -------------------------------------------------
# niveles medidos en cada tipo de marcador
# -------------------------------------------------

## Creatin kinasa

par(mfrow=c(1,2))
plot(density(dmd$ck),main="Niveles de creatina quinasa",xlab="CK",ylab="densidad",col="palegreen3")
boxplot(dmd_control$ck,dmd_port$ck, names=c("Control","Portadoras"),ylab="CK",main="Niveles de creatina quinasa por grupo",col=c("pink2","lightblue"))

## Hemopexina

plot(density(dmd$h),main="Niveles de hemopexina",xlab="H",ylab="densidad",col="palegreen3")
boxplot(dmd_control$h,dmd_port$h, names=c("Control","Portadoras"),ylab="H",main="Niveles de  hemopexina 
por grupo",col=c("pink2","lightblue"))

par(mfrow=c(1,1))
plot(density(dmd_control$h),xlim=c(20,120),ylim=c(0,0.04),main="",xlab="H",col="pink2")
par(new=TRUE)
plot(density(dmd_port$h),xlim=c(20,120),ylim=c(0,0.04),main="Niveles de hemopexina",xlab="",col="lightblue")
legend(x="topright",legend = c("Control","Portadoras"),fill=c("pink2","lightblue"))


## Piruvato kinasa

par(mfrow=c(1,2))
plot(density(dmd$pk),main="Niveles de piruvato quinasa",xlab="PK",ylab="densidad",col="palegreen3")
boxplot(dmd_control$pk,dmd_port$pk, names=c("Control","Portadoras"),ylab="PK",main="Niveles de  piruvato quinasa 
por grupo",col=c("pink2","lightblue"))


## Lactato deshidrogenasa

plot(density(dmd$ld),main="Niveles de lactato
deshidrogenasa",xlab="LD",ylab="densidad",col="palegreen3")
boxplot(dmd_control$ld,dmd_port$ld, names=c("Control","Portadoras"),ylab="LD",main="Niveles de  lactato
deshidrogenasa por grupo",col=c("pink2","lightblue"))

