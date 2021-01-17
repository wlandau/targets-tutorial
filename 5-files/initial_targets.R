library(targets)
source("5-files/functions.R")
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
  tar_target(run_relu, test_model(act1 = "relu", churn_data, churn_recipe)),
  tar_target(run_sigmoid, test_model(act1 = "sigmoid", churn_data, churn_recipe)),
  tar_target(run_softmax, test_model(act1 = "softmax", churn_data, churn_recipe)),
  tar_target(
    best_run,
    bind_rows(run_relu, run_sigmoid, run_softmax) %>%
      top_n(1, accuracy) %>%
      head(1)
  ),
  tar_target(
    best_model,
    retrain_run(best_run, churn_recipe),
    format = "keras"
  )
)
