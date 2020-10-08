library(targets)
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
tar_pipeline(
  tar_target(churn_file, "data/churn.csv", format = "file"), 
  tar_target(churn_data, split_data(churn_file)),
  tar_target(churn_recipe,  prepare_recipe(churn_data)),
  tar_target(activations, c("relu", "sigmoid")),
  tar_target(
    run,
    test_model(act1 = activations, churn_data, churn_recipe),
    pattern = map(activations)
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
