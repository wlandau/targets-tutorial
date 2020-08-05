install.packages(c(
  "fst",
  "keras",
  "recipes",
  "remotes",
  "rmarkdown",
  "rprojroot",
  "rsample",
  "tidyverse",
  "visNetwork",
  "yardstick"
))
remotes::install_github("wlandau/targets")
remotes::install_github("wlandau/tarchetypes")
root <- rprojroot::find_rstudio_root_file()
reticulate::install_miniconda(file.path(root, "miniconda"))
lines <- c(
  "TAR_SCRIPT_ASK=false",
  paste0("CONDA=", file.path(root, "miniconda", "bin", "conda")),
  paste0("WORKON_HOME=", file.path(root, "virtualenvs")),
  paste0("RETICULATE_PYTHON=", file.path(root, "miniconda", "bin", "python"))
)
writeLines(lines, file.path(root, ".Renviron"))
rstudioapi::restartSession()
reticulate::virtualenv_create(
  "r-reticulate",
  python = file.path(root, Sys.getenv("RETICULATE_PYTHON"))
)
keras::install_keras(
  method = "virtualenv",
  conda = Sys.getenv("CONDA"),
  envname = "r-reticulate"
)
