library(targets)
library(targets)
source("R/functions.R")
tar_options(packages = c("keras", "tidyverse", "rsample", "recipes", 
    "yardstick"))
tar_pipeline(tar_target(churn_file, "data/customer_churn.csv", 
    format = "file"), tar_target(churn_data, split_data(churn_file)), 
    tar_target(churn_recipe, prepare_recipe(churn_data)))
