# Reproducible Examples

# A reprex is a _minimal_ {rep}roducible {ex}ample.

# Often in developing a reprex you can solve a problem yourself.
# At the very least it will allow others to help you.

# Reproducible means your code capture everything so that the same problem
# occurs on other peoples systems. 

# Minimal means it is as small as possible in order to cause the problem.
# 
# https://r4ds.hadley.nz/workflow-help.html

# The reprex function in the reprex library ensure the code is reproducible
# by running it in a clean session.
# To use simply copy the code to your clipboard and then run (you will need to 
# install the reprex package)
# 
# reprex::reprex()
# 
# and then paste your clipboard into a file or GitHub issue.

# consider the following problem code (here passed as a code block to reprex)

reprex::reprex({
  
  library(purrr)
  
  set.seed(100)
  x <- rnorm(10)
  sqrt(x)

})

# how might you make it minimal
