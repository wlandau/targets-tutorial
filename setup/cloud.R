install.packages(c(
  "bs4Dash",
  "corrr",
  "fst",
  "keras",
  "lobstr",
  "pingr",
  "pryr",
  "qs",
  "recipes",
  "remotes",
  "rmarkdown",
  "rprojroot",
  "rsample",
  "shiny",
  "shinycssloaders",
  "tidyverse",
  "usethis",
  "visNetwork",
  "yardstick"
))
remotes::install_github("ropensci/targets")
remotes::install_github("ropensci/tarchetypes")
root <- rprojroot::find_rstudio_root_file()
reticulate::virtualenv_create("r-reticulate")
line <- "reticulate::use_virtualenv(\"r-reticulate\")"
write(line, file.path(root, ".Rprofile"), append = TRUE)
rstudioapi::restartSession()
keras::install_keras(method = "virtualenv", envname = "r-reticulate")
rstudioapi::restartSession()
tensorflow::tf_config()
