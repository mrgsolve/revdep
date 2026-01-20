if(!dir.exists("libs")) dir.create("libs")
.libPaths("libs")

if(!require("pak", quietly = TRUE)) {
  install.packages("pak", lib = "libs")
}
if(!require("revdepcheck", quietly = TRUE)) {
  pak::pkg_install("r-lib/revdepcheck", lib = "libs")
}

loc <- "~/git/m4solve"

library(revdepcheck)
packages <- c("campsis", "coveffectsplot", "tci", "PopED", "mapbayr", "vachette")
only <- "campsis"
remove <- setdiff(packages, only)

revdepcheck::revdep_add(loc, packages = only)

for(package in remove) {
  revdepcheck::revdep_rm(loc, packages = package)
}

revdep_check(
  loc, 
  num_workers = 8, 
  timeout = as.difftime(20, units = "mins"), 
  quiet = FALSE
)
