library(targets)
source("5-debugging/functions.R")
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
  tar_target(units, c(16, 32, 64)),
  tar_target(activations, c("relu", "sigmoid", "softmax")),
  tar_target(
    run,
    test_model(act1 = activations, units1 = units, churn_data, churn_recipe),
    pattern = cross(activations, units)
  ),
  tar_target(
    best_run,
    run %>%
      top_n(1, accuracy) %>%
      head(1)
  ),
  tar_target(
    best_model,
    retrain_run(best_run, churn_recipe),
    format = "keras"
  )
)
