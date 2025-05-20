# Functions and For Loops
 
# functions

my_fun <- function(x, y = 10) {
  z <- x/2
  z^y
}

my_fun(3)
my_fun(3, y = 1)

# a list of functions

ls <- list(fun1 = my_fun, fun2 = sd)

ls$fun1(3)

# for loops

x <- c(3, 1, 5.5, 77)

x[1]/2
x[2]/2
x[3]/2

for(i in c(1,2,3)) {
  print(x[i] / 2)
}

for(i in 1:length(x)) {
  print(x[i] / 2)
}

# but what if integer has no length!
x <- integer()
x

for(i in 1:length(x)) {
  print(x[i] / 2)
}

# more robust
for(i in seq_along(x)) {
  print(x[i] / 2)
}

# what does this for loop do?
# why can't it be vectorized?

x <- 1:5
y <- rep(NA_integer_, length(x))

for(i in seq_along(x)) {
  if(i == 1) {
    y[1] <- x[1]
  } else {
    y[i] <- x[i] + y[i-1]
  }
}

# for loops are complex to write and generally slow in R
