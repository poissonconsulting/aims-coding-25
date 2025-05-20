# R Basics

# values are assigned to objects using the <- operation
x <- 1

# typing an object at the console causes it to be printed
print(x)
x

# returns the objects in the workspace
ls()

# the following code removes all objects from the workspace
rm(list = ls())
ls()

# there are 4 main data types you need to be aware of

typeof(TRUE)
typeof(1.1)
typeof(1L)
typeof("one")

# atomic vectors are vectors of length 0, 1 or 2+ of a single type

vec <- c(1,2,3,4)
vec
typeof(vec)
str(vec)
class(vec)
is.atomic(vec)

# the : operator creates a sequenc of integers

1:10

# arrays are structures of a single type with 2 or more dimensions

arr <- array(1:24, dim = c(2,3,4))
arr
typeof(arr)
class(arr)
is.atomic(arr)

# matrices are arrays with 2 dimensions

mat <- array(1:10, dim = c(2,5))
mat
typeof(mat)
class(mat)

# ultimately arrays are just atomic vectors with a dimensions attribute
attributes(mat)
attributes(mat) <- NULL
mat
class(mat)

# lists are vectors that can include elements of different types
list <- list(x = 1, z = "one", 1:10, list(x = 10))
typeof(list)
is.atomic(list)

# data frames are lists with vectors of the same length
data <- data.frame(x = 1:3, y = c(0,4.5,7))
data
as.list(data)
