## All data structures built up from vectors
## for loops -> vectorization -> parallelization
## objects copied on modification
## <https://github.com/posit-dev/positron/issues/7864#issuecomment-2917028789>
## functions search for objects including other functions starting from where originally defined 

## material from <https://r-pkgs.org/>

## Units of reproducible code and example data with documentation.

if(FALSE) {
  install.packages("devtools")
}

library(devtools) ## also loads usethis

if(FALSE) { ## change to directory
  usethis::create_package("~/foobar")
}
# then discuss files