library(targets)
library(tarchetypes) # Use tarchetypes for tar_files().
source("6-branching/functions.R")
tar_option_set(
  packages = c(
    "corrr",
    "keras",
    "recipes",
    "rsample",
    "tidyverse",
    "yardstick"
  )
)
list(
  tar_files(churn_file, list.files("data", full.names = TRUE))
)
