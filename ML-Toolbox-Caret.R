## MACHINE LEARNING TOOLBOX

## https://www.datacamp.com/courses/machine-learning-toolbox

library(tidyverse)
library(caret)
library(ranger) ## recommended over randomforest package for
library(rattle.data) ## for wine dataset

## CH 3: Tuning Model Performance
summary(wine)
str(wine)

## example in course has a 'quality' variable
## using Type here instead

model <- train(
  Type~.,
  tuneLength=1,
  data=wine,
  method='ranger',
  trControl = trainControl(
    method='cv',
    number=5,
    verboseIter = TRUE
  )
)
print(model)