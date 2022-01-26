library(sp)
library(raster)
library(rgdal)

#set working directory

setwd("C:/Godwin/2021/Academia/4.2/New folder/Classwork")
getwd()

long <- runif(50, min=36, max=39) #Generating random longitude
lat <- runif(50, min=-2, max=2) #Generating random latitude
var1<- runif(50, min=0, max=100) #Generating random values

plot(long,lat)
lat
var1

plot(long, lat, main="Example of a plot", xlab="longitude", ylab="latitude") #Plotting, Labelling the Axis and Title


#Changing the dots and color. PCH changes symbol type and color changes the color, and symbol sizes by cex
plot(long, lat, main="Example of a plot", xlab="longitude", ylab="latitude", pch=20, col="blue", cex=var1/50) 

#Creating a dataframe
data<-data.frame(long,lat,var1)
head(data) #Gives us a previeew of the top of the data
tail(data) #Gives us the bottom values of the data
summary(data) #Givesa a summary of the data

#install.packages("raster") install this libraries to proceed
#install.packages("rgdal")
#install.packages("sp")

#Plotting data using the SP package
library(sp)

coords <- data.frame(long,lat) #Spatial data
data <- data.frame(var1) #Non-spatial

dataSP <- SpatialPoints(coords) #Create spatial points from the spatial data(Coords)

str(dataSP) #View structure of the data

##Assigning a projection to the dataframe

dataSPDF <-SpatialPointsDataFrame(coords=coords, data=data, proj4string = CRS("+init=epsg:4326"))
str(dataSPDF)

#Calling the spatial coordinates
dataSPDF@coords

#Calling the non spatial data
dataSPDF@data

getwd()
dir() #View folders in the wdirectory
dir("data") #Read individual folder

#Reading csv file in the data folder
ptSamples <- read.csv("data/sample_points.csv")
summary(ptSamples)

ptSamples <- ptSamples[,c("id","x","y","elev")]#Here we concantenate and remove the first field of the table (X)
summary(ptSamples)

#Reading vector file
dir("data")

library(rgdal)
counties <-readOGR("data/kenya_counties.GeoJSON") #Read vector data
str(counties)

plot(counties) #Plot Counties

###Add symbols, assign color and border
plot(counties, col='grey', border="white", main="Kenya Counties" )
plot(ptSamples$x, ptSamples$y, pch=20, cex=ptSamples$elev/5000, col="blue", add=T)

ptcoords <- data.frame(ptSamples$x, ptSamples$y)
ptData <-data.frame(ptSamples$id, ptSamples$elev)

ptSamplesSPDF <- SpatialPointsDataFrame(coords=ptcoords,data=ptData, proj4string=CRS("+init=epsg:4326"))
plot(counties)
plot(ptSamplesSPDF, pch=20, col="blue", cex=ptSamplesSPDF@data$elev/5000, add=T)

