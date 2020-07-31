# RStudio Cloud setup
renv::restore()
lines <- c(
  "TAR_SCRIPT_ASK=false",
  paste0("WORKON_HOME=", file.path(getwd(), "virtualenvs"))
)
writeLines(lines, ".Renviron")
rstudioapi::restartSession()
reticulate::install_miniconda("miniconda")
reticulate::virtualenv_create("r-reticulate", python = "miniconda/bin/python")
keras::install_keras(
  method = "virtualenv",
  conda = "miniconda/bin/conda",
  envname = "r-reticulate",
  restart_session = FALSE
)
rstudioapi::restartSession()
