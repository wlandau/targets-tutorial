# An example solution for _targets.R file is a hundred lines down in this file.
# Please make an honest effort to complete this exercise yourself
# before looking at the solution. Ask the instructor and other students for
# assistance early and often. This is a challenging problem and designed
# to make you get stuck. Please rely on your colleagues for hints.





























































































# The following code is a solution to the exercise in this chapter.
# It goes in the _targets.R file in your working directory.
library(targets)
library(tarchetypes)
source("7-challenge/functions.R")
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
  tar_files(churn_file, list.files("data", full.names = TRUE)),
  tar_target(
    churn_data,
    split_data(churn_file),
    pattern = map(churn_file),
    iteration = "list"
  ),
  tar_target(
    churn_recipe,
    prepare_recipe(churn_data),
    pattern = map(churn_data),
    iteration = "list"
  ),
  tar_target(
    run_relu,
    test_model(act1 = "relu", churn_data, churn_recipe),
    pattern = map(churn_data, churn_recipe)
  ),
  tar_target(
    run_softmax,
    test_model(act1 = "softmax", churn_data, churn_recipe),
    pattern = map(churn_data, churn_recipe)
  ),
  tar_target(
    run_sigmoid,
    test_model(act1 = "sigmoid", churn_data, churn_recipe),
    pattern = map(churn_data, churn_recipe)
  ),
  tar_target(
    best_run,
    bind_rows(run_relu, run_softmax, run_sigmoid) %>%
      top_n(1, accuracy) %>%
      head(1)
  )
)

# Here is an equivalent solution using static branching functions
# tar_map() and tar_combine() from the tarchetypes package.
library(targets)
library(tarchetypes)
source("7-challenge/functions.R")
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
runs <- tar_map(
  values = list(act1 = c("relu", "softmax", "sigmoid")),
  tar_target(
    run,
    test_model(act1 = act1, churn_data, churn_recipe),
    pattern = map(churn_data, churn_recipe)
  )
)
list(
  tar_files(churn_file, list.files("data", full.names = TRUE)),
  tar_target(
    churn_data,
    split_data(churn_file),
    pattern = map(churn_file),
    iteration = "list"
  ),
  tar_target(
    churn_recipe,
    prepare_recipe(churn_data),
    pattern = map(churn_data),
    iteration = "list"
  ),
  runs,
  tar_combine(
    best_run,
    runs,
    command = bind_rows(!!!.x) %>%
      top_n(1, accuracy) %>%
      head(1)
  )
)
