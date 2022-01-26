# In this exercise we will use default R tools to perform k-means clustering
#set working directory
setwd("D:/projects/R/RLessons/Lesson2")

# read the data into a data table
data <- read.csv("random.csv", row.names=NULL)

#explore the data
summary(data[, c("x", "y")])


data <- data[, c("x", "y")]
summary(data)

#Now you data only has two variables, x and y

# Prepare Data
data = na.omit(data) # delete null entries

# normal plotting ofthe data
plot(data, col="blue",pch =20)


#Run a k-mean cluster analysis of the data

# K-Means Cluster Analysis
km <- kmeans(data, centers =3, iter.max= 20, nstart = 25)
plot(data, col = km$cluster, pch =20)
points(km$centers, col = c(1:4), pch = 8, cex = 2)

#Print the clustering results
# Print the results
print(km)

#Reading the some interesting components of the km results
km$cluster # shows the cluster where each entry has been assigned
km$centers # shows the center/centroid of each cluster
km$size # Shows the size of each cluster
km$withinss # within cluster sum of squares

# You can also split the data to the actual clusters
kmClusters=split(data,km$cluster)
kmClusters

#...............................................................................
#Visualizing Using a package (factorextra)
# install.packages("factoextra")  # only necessary if you have not previously installed the package
library(factoextra)
fviz_cluster(km, data, ellipse.type = "norm") #Using ellipses
fviz_cluster(km, data, ggtheme =  theme_minimal()) #Using minimal polygons
fviz_nbclust(data, kmeans, method = 'wss')  # Identifying optimal number of k means clusters using within cluster sum of squares
#-------------------------------------------------------------------------------

#Finding optimal number of clusters (From resident tools in R, without any package)
# find variance in the data
dataVariance=apply(data, 2, var)


# find the sum of squares for 1 cluster
WithinClusterSumOfSquares = (nrow(data)-1)*sum(dataVariance)

# find the sum of squares for 2 to 15 clusters
for (i in 2:15) {
  km=kmeans(data, centers=i)
  WithinClusterSumOfSquares[i] = sum(km$withinss)
}
# plut the result
plot(1:15, WithinClusterSumOfSquares, type="o", pch=20, col="blue", main="Optimal number of clusters",xlab="Number of Clusters",ylab="Within groups sum of squares")


