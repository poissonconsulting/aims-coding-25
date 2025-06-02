## All data structures built up from vectors
## for loops -> vectorization -> parallelization
## objects copied on modification
## <https://github.com/posit-dev/positron/issues/7864#issuecomment-2917028789>
## functions search for objects including other functions starting from where originally defined

## material from <https://r-pkgs.org/>

## Units of reproducible code and example data with documentation.

install.packages("devtools")

library(devtools) ## also loads usethis

## change to directory
usethis::create_package("~/foobar")

# then discuss files

usethis::use_git()

## create directory ~/foobar/scripts
## edit .RBuildignore with ^scripts$
## and then copy this packages.R script to ~/foobar/scripts

# consider function
strsplit1 <- function(x, split) {
  strsplit(x, split = split)[[1]]
}


usethis::use_r("strsplit1")

# to simulate loading package
devtools::load_all()

# to check package - run after any major change
devtools::check()

usethis::use_mit_license()

## document function
devtools::document()

?strsplit1

## also look at NAMESPACE file

devtools::check()

## add dependency on stringr
usethis::use_package("stringr")

str_split_one <- function(string, pattern, n = Inf) {
  stopifnot(is.character(string), length(string) <= 1)
  if (length(string) == 1) {
    stringr::str_split(string = string, pattern = pattern, n = n)[[1]]
  } else {
    character()
  }
}

usethis::rename_files("strsplit1", "str_split_one")

devtools::document()

devtools::check()

## se the following to upload to a github repository for collaboration
<https://r-pkgs.org/whole-game.html#use_github>

usethis::use_readme_rmd()

## to create README.Rmd file
use_readme_rmd()

devtools::check()

devtools::install()

usethis::use_tidy_style()

## be suspicious of anything not in a function
## <https://r-pkgs.org/code.html#sec-code-when-executed>

## don't use library() or require()
## <https://r-pkgs.org/code.html#sec-code-r-landscape>

## constant health checks
## <https://r-pkgs.org/code.html#sec-code-r-landscape>
