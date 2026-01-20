if(!dir.exists("libs")) dir.create("libs")
.libPaths("libs")

if(!require("pak", quietly = TRUE)) {
  install.packages("pak", lib = "libs")
}
if(!require("revdepcheck", quietly = TRUE)) {
  pak::pkg_install("r-lib/revdepcheck", lib = "libs")
}

library(revdepcheck)
packages <- c("campsis", "coveffectsplot", "tci", "PopED", "mapbayr", "vachette")
only <- "campsis"
remove <- setdiff(packages, only)

revdepcheck::revdep_add("~/git/m4solve/", packages = only)

for(package in remove) {
  revdepcheck::revdep_rm("~/git/m4solve/", packages = package)
}

revdep_check(
  "~/git/m4solve/", 
  num_workers = 8, 
  timeout = as.difftime(20, units = "mins"), 
  quiet = FALSE
)
