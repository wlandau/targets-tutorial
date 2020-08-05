renv::restore()
lines <- c(
  "TAR_SCRIPT_ASK=false",
  paste0("RETICULATE_CONDA=", file.path(getwd(), "miniconda", "bin", "conda")),
  paste0("RETICULATE_PYTHON=", file.path(getwd(), "miniconda", "bin", "python")),
  paste0("WORKON_HOME=", file.path(getwd(), "virtualenvs"))
)
writeLines(lines, ".Renviron")
rstudioapi::restartSession()
reticulate::install_miniconda("miniconda")
reticulate::virtualenv_create(
  envname = "r-tensorflow",
  python = Sys.getenv("RETICULATE_PYTHON")
)
keras::install_keras(
  method = "virtualenv",
  conda = Sys.getenv("RETICULATE_CONDA"),
  envname = "r-tensorflow"
)
