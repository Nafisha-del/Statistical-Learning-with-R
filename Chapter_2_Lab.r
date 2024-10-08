# 2.3.1 Basic Commands ####
x <- c(1, 3, 2, 5)
x

x= c(1, 6, 2)
x

y= c(1, 4, 3)

length(x)
length(y)
x+y

# ls() and rm() function
ls()
rm(x, y)
ls()

rm(list = ls())

# help command
?matrix

# 2x2 matrix
x <- matrix(data = c(1, 2, 3, 4), nrow = 2, ncol = 2)
x

x <- matrix(c(1, 2, 3, 4), 2, 2)
x

# Populate matrix by order of rows
matrix(c(1, 2, 3, 4), 2, 2, byrow = TRUE)

# Square root of each element
sqrt(x)

# Square of each element
x^2

# Generate vector of random normal variables
x <- rnorm(50)
x
y <- x + rnorm(50, mean = 50, sd = .1)
y
cor(x, y)

set.seed(1303)
rnorm(50)

# Calculating Mean, Variance, and Standard Deviation
set.seed(3)
y <- rnorm(100)
mean(y)
var(y)
sqrt(var(y))
sd(y)

# 2.3.2 Graphics ####
x <- rnorm(100)
y <- rnorm(100)
plot(x, y)
plot(x, y, xlab = "this is the x-axis",
     ylab = "this is the y-axis",
     main = "Plot of X vs Y")

# Save the Figure
pdf("Figure.pdf")
plot(x, y, col = "green")
dev.off()

# Create sequence of numbers
x <- seq(1, 10)
x
x <- 1:10
x
x <- seq(-pi, pi, length = 50)
x

# Three dimensional plot
y <- x
f <- outer(x, y, function(x, y) cos(y) / (1 + x^2))
contour(x, y, f)
contour(x, y, f, nlevels = 45, add = T)
fa <- (f - t(f)) / 2
contour(x, y, fa, nlevels = 15)

image(x, y, fa)
persp(x, y, fa)
persp(x, y, fa, theta = 30)
persp(x, y, fa, theta = 30, phi = 20)
persp(x, y, fa, theta = 30, phi = 70)
persp(x, y, fa, theta = 30, phi = 40)

# 2.3.3 Indexing Data ####
A <- matrix(1:16, 4, 4)
A

A[2, 3]

# Select multiple rows at a time
A[c(1, 3), c(2, 4)]
A[1:3, 2:4]
A[1:2, ]
A[, 1:2]

A[1, ]

# Print all rows and columns except the ones indicated in index
A[-c(1, 3), ]
A[-c(1, 3), -c(1, 3, 4)]

# Number of rows and columns
dim(A)

# 2.3.4 Loading Data ####
Auto <- read.table("Auto.data")
View(Auto)
head(Auto)

Auto <- read.table("Auto.data", header = T, na.strings = "?",
                   stringsAsFactors = T)
View(Auto)

Auto <- read.csv("Auto.csv", na.strings = "?",stringsAsFactors = T)
View(Auto)
dim(Auto)
Auto[1:4, ]

Auto <- na.omit(Auto)
dim(Auto)

names(Auto)

# 2.3.5 Additional Graphical and Numerical Summaries ####
plot(cylinders, mpg)

# attach() - make the variables in data frame available by name
plot(Auto$cylinders, Auto$mpg)
attach(Auto)
plot(cylinders, mpg)

cylinders <- as.factor(cylinders)

plot(cylinders, mpg)
plot(cylinders , mpg, col = "red")
plot(cylinders , mpg, col = "red", varwidth = T)
plot(cylinders , mpg, col = "red", varwidth = T, horizontal = T)
plot(cylinders , mpg, col = "red", varwidth = T, xlab = "cylinders", ylab = "MPG")

# Plot a histogram
hist(mpg)
hist(mpg, col = 2)
hist(mpg, col = 2, breaks = 15)

# Scatterplot matrix
pairs(Auto)
pairs(
  ~mpg + displacement + horsepower + weight + acceleration,
  data = Auto
)

# identify() - corresponds to rows for selected points
plot(horsepower, mpg)
identify(horsepower , mpg, name)

# Numerical summary of each variable
summary(Auto)

# Summary of a single variable
summary(mpg)

# Save record of all commands
savehistory()
