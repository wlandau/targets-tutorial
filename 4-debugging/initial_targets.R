library(targets)
source("4-debugging/functions.R")
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
  tar_target(churn_file, "data/churn.csv", format = "file"), 
  tar_target(churn_data, split_data(churn_file)),
  tar_target(churn_recipe,  prepare_recipe(churn_data)),
  tar_target(
    run,
    test_model(act1 = "sigmoid", units1 = 32, churn_data, churn_recipe)
  )
)
