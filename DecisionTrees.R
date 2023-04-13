install.packages("party")
library(party)
library(plyr)
library(readr)
#first read in the dataset from the URL link - more info found in references section 
iris <- read_csv("https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data", col_names = FALSE)

#next, rename columns to represent the correct flower attribute 
iris<-rename(iris, c("X1"="sepal.length", "X2"="sepal.width", "X3"="petal.length", "X4"="petal.width", "X5"="class"))

#change iris class into a factor 
iris$class<-as.factor(iris$class) 

#overall descriptions of the dataset 
summary(iris)

tree1<-ctree(class~sepal.length, data=iris) #set the model for the tree, predicting class by sepal length , data set being used is iris 
plot(tree1) #view the decision tree

tree2<-ctree(class~sepal.width, data=iris)
plot(tree2)

tree3<-ctree(class~petal.length, data=iris)
plot(tree3)

tree4<-ctree(class~petal.width, data=iris)
plot(tree4)

tree5<-ctree(class~sepal.length+sepal.width, data=iris)
plot(tree5)

tree6<-ctree(class~petal.length+petal.width, data=iris)
plot(tree6)

tree7<-ctree(class~sepal.length + sepal.width + petal.length + petal.width, data=iris)
plot(tree7)
