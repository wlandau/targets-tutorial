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
    run1,
    test_model(act1 = "relu", units1 = 16, churn_data, churn_recipe)
  ),
  tar_target(
    run2,
    test_model(act1 = "sigmoid", units1 = 32, churn_data, churn_recipe)
  ),
  tar_target(
    run3,
    test_model(act1 = "softmax", units1 = 64, churn_data, churn_recipe)
  ),
  tar_target(
    best_run,
    bind_rows(run1, run2, run3) %>%
      top_n(1, accuracy) %>%
      head(1)
  ),
  tar_target(
    best_model,
    retrain_run(best_run, churn_recipe),
    format = "keras"
  )
)
