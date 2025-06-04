## All data structures built up from vectors
## for loops -> vectorization -> parallelization
## objects copied on modification (exception are environments)
## <https://github.com/posit-dev/positron/issues/7864#issuecomment-2917028789>
## functions search for objects including other functions starting from where originally defined

## material from <https://r-pkgs.org/> CC BY-NC-ND 4.0

## Units of reproducible code and example data with documentation.
## Save you time!
##
## We use the library() function to load a package.

install.packages("devtools")

library(devtools) ## also loads usethis

usethis::edit_r_profile()

```r
if (interactive()) {
  suppressMessages(require(devtools))
}

options(
  usethis.description = list(
    "Authors@R" = utils::person(
      "Jane", "Doe",
      email = "jane@example.com",
      role = c("aut", "cre"),
      comment = c(ORCID = "0000-1111-2222-3333")
    )
  )
)
```

## Create package together
##
## <https://r-pkgs.org/whole-game.html>


## should be 2.4.5
packageVersion("devtools")

## change to directory
usethis::create_package("~/foobar")

# then discuss files

usethis::use_git()

## create directory ~/foobar/scripts
## edit .RBuildignore with ^scripts$
## and then copy this packages.R script to ~/foobar/scripts
##

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

## to create README.Rmd file
usethis::use_readme_rmd()

## package documentation
usethis::use_package_doc()

devtools::document()

## in github section will use

use_github("organisationname")

usethis::use_tidy_style()

## constant health checks
## <https://r-pkgs.org/code.html#sec-code-r-landscape>

## Organise in files
## <https://r-pkgs.org/code.html#sec-code-organising>

## Do not source files in R - use load_all() instead
## <https://r-pkgs.org/code.html#sec-code-load-all>

## Code in a package is run when the package is built
## be suspicious of anything not in a function
## <https://r-pkgs.org/code.html#sec-code-when-executed>

## Consider
x <- Sys.time()

## don't use library() or require()
## <https://r-pkgs.org/code.html#sec-code-r-landscape>

## Talk about dependencies

## When a package is installed, everything in inst/ is copied into the top-level directory of the installed package (see Figure 3.1).
## <https://r-pkgs.org/misc.html#sec-misc-inst>

## common use is inst/extdata/ to make actual file available
## also data-raw (raw data files so have work up)
## usethis::use_data_raw()
## and data (R objects)
## usethis::use_data().
