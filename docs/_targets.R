library(targets)
library(targets)
source("R/functions.R")
tar_options(packages = c("keras", "tidyverse", "rsample", "recipes", 
    "yardstick"))
tar_pipeline(tar_target(churn_file, "data/customer_churn.csv", 
    format = "file"), tar_target(churn_data, split_data(churn_file)), 
    tar_target(churn_recipe, prepare_recipe(churn_data)), tar_target(run_relu, 
        test_model(act1 = "relu", churn_data, churn_recipe)), 
    tar_target(run_sigmoid, test_model(act1 = "sigmoid", churn_data, 
        churn_recipe)), tar_target(run_softmax, test_model(act1 = "softmax", 
        churn_data, churn_recipe)), tar_target(best_run, bind_rows(run_relu, 
        run_sigmoid, run_softmax) %>% top_n(1, accuracy) %>% 
        head(1)), tar_target(best_model, train_best_model(best_run, 
        churn_recipe), format = "keras"))
