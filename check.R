.libPaths("libs")

if(!require("pak"))         install.packages("pak", lib = "libs")
if(!require("revdepcheck")) pak::pkg_install("r-lib/revdepcheck", lib = "libs")

revdep_check("~/git/m4solve/", num_workers = 8)
