# Vectorization and Parallelization

# simple operatiors and functions are generally vectorized in R with elements recycled
x <- 1:4

sqrt(x)
x/2
x/1:2

# lapply applies a function to each element of a vector and returns a list of the results

ls <- list(a = 1:2, b = "b", c = list(), d = matrix(1:2))
ls

lapply(ls, FUN = is.atomic)

# this is an inline function
lapply(ls, FUN = function(x) paste(x, collapse = ","))


# vapply allows the user to specify the return type

vapply(ls, FUN = is.atomic, FUN.VALUE = TRUE)

## the purrr package provides lots of functions for vectorization

# this loads the purrr package
library(purrr)

map(ls, is.atomic)

# it allows the function to be specified in a more human readable form
map(ls, ~ is.atomic(.x))
map(ls, \(x) is.atomic(x))

# can specify the return type
map_lgl(ls, ~ is.atomic(.x))

# and allows progress bars
if(FALSE) { # so not automatically run
  x <- map(1:12, ~ Sys.sleep(1), .progress = TRUE)
}

# and access the name, index
imap(ls, function(x,i) x == i)

# other useful functions
# https://rstudio.github.io/cheatsheets/purrr.pdf

# parallelization

# parallelization occurs when elements of a vector are processed at the same time

# the furrr packages provides equivalents of all the functions in 
# furrr but with the ability to map in parallel with the futures package

library(furrr)
plan(multisession, workers = 4)
if(FALSE) {
  x <- purrr:::map(1:12, ~ Sys.sleep(1), .progress = TRUE)
  x <- furrr::future_map(1:12, ~ Sys.sleep(1), .progress = TRUE)
}
