
# Data cleaning 

dmd<-read.csv("data/dmd.csv")

table(is.na(dmd))
table(is.null(dmd))

dmd=na.omit(dmd)

dmd_control<-subset(dmd,dmd$carrier==0)
dmd_port<-subset(dmd,dmd$carrier==1)

save(dmd,dmd_control,dmd_port, file = "data/dmd.RData")
