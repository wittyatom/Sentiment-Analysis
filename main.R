
library(plyr)
library(stringr)
library(e1071)
source('sentiment.R')
data <- total.results

prediction <- predict(NaiveBayesClassifier, data)

conf.matrix <- table(prediction, data[,4], dnn=list('predicted','actual'))

conf.matrix

