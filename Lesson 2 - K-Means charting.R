#Lesson 2: Tasks on K-Means charting
setwd ("D:/School work/Assignments n Cats/Programming/R lessons/Lesson 2")
getwd()
dir()
#adding data
data <- read.csv("random.csv")
str(data)
summary(data)
data <- data[,c("x","y")] #Subset of data with column x and y
#rewriting no data values/rows
data <- na.omit(data)
#plotting
plot(data)
plot(data, col= "blue", pch=20)
#plotting
plot(data)
plot(data, col= "red", pch=20)
#running K-Means Clustering Algorithm
km <- kmeans(data, centers=3,iter.max=30,nstart=25)
print(km)
#plotting characters
plot(data,pch=20,col=km$character)
points(km$centers,col=c(1:4),pch=8,cex=2)
km <- kmeans(data, centers=4,iter.max=30,nstart=25)
print(km)
#dataVariance
dataVariance <- apply (data,2,var)
withinclustersumofsquares <- (nrow(data)-1)*sum(dataVariance)
for(i in 1:20){print(i)}
for(i in 1:20){print(i*i)}
for(i in 1:20){print(i*i-0.5)}
for(i in 2:20){
  km=kmeans(data,centers=i)
  withinclusterSumofSquares[i]=sum(km$within)
}
plot(1:20,withinclustersumofsquares)
plot(1:20,withinclustersumofsquares,col="red",pch=20,type="0",main="optimal number of clusters",ylab="within cluster sum of squares",xlab="number of clusters")

