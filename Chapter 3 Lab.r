library(MASS)
library(ISLR2)

#### Simple Linear Regression ####
head(Boston)
View(Boston$medv)
View(Boston$lstat)
attach(Boston)

medv~lstat

lm.fit <- lm(medv~lstat, data = Boston)
lm.fit

summary(lm.fit)
names(lm.fit)
coef(lm.fit)

#confdence interval for the coeffcient estimates
confint(lm.fit)

predict(lm.fit, data.frame(lstat = (c(5, 10, 15))),
        interval = "confidence")
predict(lm.fit, data.frame(lstat = (c(5, 10, 15))),
        interval = "prediction")

plot(lstat, medv)
abline(lm.fit)
abline(lm.fit, lwd = 3)
abline(lm.fit, lwd = 3, col = "red")

plot(lstat, medv, col = "red")
plot(lstat, medv, pch = 20)
plot(lstat, medv, pch = "+")
plot(1:20, 1:20, pch = 1:20)

# view all four plots together
par(mfrow = c(2, 2))
plot(lm.fit)

plot(predict(lm.fit), residuals(lm.fit))
plot(predict(lm.fit), rstudent(lm.fit))

plot(hatvalues(lm.fit))
which.max(hatvalues(lm.fit))

#### Multiple Linear Regression ####
lm.fit <- lm(medv~lstat + age, data = Boston)
summary(lm.fit)

lm.fit <- lm(medv~., data = Boston)
summary(lm.fit)

install.packages("car")
library(car)
vif(lm.fit)

lm.fit1 <- lm(medv~. - age, data = Boston)
summary(lm.fit1)
lm.fit1 <- update(lm.fit, ~ . - age)

#### Interaction Terms ####
summary(lm(medv ~ lstat * age, data = Boston))

#### Non-linear Transformations of the Predictors ####
lm.fit2 <- lm(medv ~ lstat + I(lstat^2))
summary(lm.fit2)

# quantify the extent which quadratic ft is superior to linear
lm.fit <- lm(medv ~ lstat)
anova(lm.fit, lm.fit2)

par(mfrow = c(1, 1))
plot(lm.fit2)

lm.fit5 <- lm(medv ~ poly(lstat, 5))
summary(lm.fit5)
summary(lm(medv ~ log(rm), data = Boston))

#### Qualitative Predictors ####
head(Carseats)
lm.fit <- lm(Sales ~ . + Income:Advertising + Price:Age,
             data = Carseats)
summary(lm.fit)

attach(Carseats)
contrasts(ShelveLoc)

#### Writing Functions ####
LoadLibraries
function() {
  library(ISLR2)
  library(MASS)
  print("The libraries have been loaded.")
}

LoadLibraries()