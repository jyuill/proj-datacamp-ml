
## linear regression model and prediction with mtcars
## based on examples in DataCamp course

summary(mtcars)
head(mtcars)

lm.cars <- lm(mpg ~ disp, data=mtcars)
unseen <- data.frame(disp=250)

predict(lm.cars, unseen)

#### video: classification, regression, clustering

### classification
## qualitative output
## predefined classes
## medical diagnosis, animal recognition, etc

### regression
## input variables > predictors
## output variables > response
## estimating actual value
## quantitative output
## previous input-output examples

### clustering
## group similar objects into clusters
## make sure clusters are dissimilar
## group similar animal photos
## don't need labels
## no right or wrong
## plenty of possible clusters

#### EXAMPLES

### classification
## predict if car should be classified as v8 or not based on displacement
## check data to see min displacement for v8
plot(disp~cyl, data=mtcars)
library(dplyr)
mt468 <- mtcars %>% select(disp, cyl)
mt8 <- mtcars %>% filter(cyl==8) %>% select(disp, cyl)
min(mt8$disp)

## setup classifier to predict 4,6,8 cylinders based on disp
car_classifier <- function(x) {
  prediction <- rep(NA, length(x)) ## initialize prediction vector
  prediction[x >= 250] <- 8
  prediction[x>= 150 & x < 250] <- 6
  prediction[x <150] <- 4
  return(prediction) ## prediction is either 4,6, or 8 
}

## run prediciton against disp in mtcars
car_pred <- car_classifier(mtcars$disp)

## check if prediction matches actual cyl values in mtcars
car_pred == mtcars$cyl

## calculate accuracy
acc <- car_pred==mtcars$cyl
table(acc)
prop.table(table(acc))

### linear regression example

## linkedin views for 21 days
linkedin <- c(5,7,4,9,11,10,14,17,13,11,18,17,21,21,24,23,28,35,21,27,23)

## create sequence for 21 days to match the number of linkedin view data points 
days <- seq(1:21)
days <- 1:21 ## same as above

linkedin_lm <- lm(linkedin ~ days)

future <- data.frame(days=22:26)
linkedin_pred <- predict(linkedin_lm, future)

## plot results
plot(linkedin ~ days, xlim = c(1, 26))
points(22:26, linkedin_pred, col = "green")