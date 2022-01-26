setwd("D:/School work/Projects/Rlesson")
#first code in R
library(sp)
library(raster)
library(rgdal)
lon <- runif(50,min=36,max=39)
lat <- runif(50,min=-2,max=2)
var1<- runif(50,min=0,max=100)
plot(lon,lat)
plot(lon,lat,main="Example of a plot",xlab="longitude",ylab="latitude")
plot(lon,lat,main="Example of a plot",xlab="longitude",ylab="latitude",pch=20,col="purple")#pch changes the symobol type
plot(lon,lat,main="Example of a plot",xlab="longitude",ylab="latitude",pch=20,col="purple",cex=var1/100)#variable divided by one hundred
plot(lon,lat,main="Example of a plot",xlab="longitude",ylab="latitude",pch=20,col="purple",cex=var1/50)#variable divided by fifty hundred
data <- data.frame(lon,lat,var1)
head(data)
tail(data)
summary(data)
coords <- data.frame(lon,lat)#spatial
data <- data.frame(var1)#non-spatial
datsp











