## material from <https://r-pkgs.org/> CC BY-NC-ND 4.0

## From R Packages
##
## > The first stage of your testing journey is to become convinced that testing has enough benefits to justify the work. For some of us, this is easy to accept. Others must learn the hard way.
##
## Philosophy

# - Focus on testing the external interface to your functions.
#
# - Strive to test each behaviour in one and only one test.
#
# - Avoid testing simple code that you’re confident will work.
#
# - Always write a test when you discover a bug.


use_testthat()

use_test("str_split_one")

## add to test script
```r
test_that("str_split_one() splits a string", {
  expect_equal(str_split_one("a,b,c", ","), c("a", "b", "c"))
})

test_that("str_split_one() errors if input length > 1", {
  expect_error(str_split_one(c("a,b","c,d"), ","))
})

test_that("str_split_one() exposes features of stringr::str_split()", {
  expect_equal(str_split_one("a,b,c", ",", n = 2), c("a", "b,c"))
  expect_equal(str_split_one("a.b", stringr::fixed(".")), c("a", "b"))
})
```

devtools::test()

## minimize testing internal functions to facilicate refactoring
## also more control over inputs
## I use chk to check user provided inputs and then no further checking of inputs

## The funky() function and co in R/funky and tests in tests/testthat/test-funky.R.

# use the following to create or go to files
usethis::use_r("str_split_one")
usethis::use_test("str_split_one")

devtool::load_all()
# and then iteratively

## just test active file
devtools::test_active_file()

# then tests
devtools::test()

## then as part of full check
devtools::check()

# organized by file -> test (unit) -> expectation
#
expect_equal(10, 10)
expect_equal(10, 10L)
expect_equal(10, 10 + 1e-7)
expect_equal(10, 11)
expect_identical(10, 10 + 1e-7)

expect_error(1 / "a")

## catch alls
expect_true()
expect_false()

# snapshot tests!

test_that("side-by-side diffs work", {
  withr::local_options(width = 20)
  expect_snapshot(
    waldo::compare(c("X", letters), c(letters, "X"))
  )
})

## coverage

devtools::test_coverage()
