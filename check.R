if(!dir.exists("libs")) dir.create("libs")
.libPaths("libs")

if(!require("pak", quietly = TRUE)) {
  install.packages("pak", lib = "libs")
}
if(!require("revdepcheck", quietly = TRUE)) {
  pak::pkg_install("r-lib/revdepcheck", lib = "libs")
}

library(revdepcheck)
revdep_check(
  "~/git/m4solve/", 
  num_workers = 8, 
  timeout = as.difftime(30, units = "mins")
)
