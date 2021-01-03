library(targets)
source("2-pipelines/functions.R")
tar_option_set(packages = c("keras", "recipes", "rsample", "tidyverse", "yardstick"))
list(
  tar_target(churn_file, "data/churn.csv", format = "file"),
  tar_target(churn_data, split_data(churn_file)),
  tar_target(churn_recipe, prepare_recipe(churn_data))
)
