# The functions for the customer churn workflow are below.
# Lines starting with `#'` are `roxygen2` docstrings,
# which document the purpose, inputs, outputs, and examples
# of our custom functions. The examples are particularly helpful
# to refamiliarize yourself with how the function works.
# For more information on `roxygen2`, visit <https://roxygen2.r-lib.org/>.

#' @title Read and split the data.
#' @description Split customer churn data into training and testing datasets.
#' @export
#' @return An `rsplit` object with training and testing datasets.
#' @param churn_file Character, file path to the customer churn data file.
#' @examples
#' library(rsample)
#' library(tidyverse)
#' split_data("data/churn.csv")
split_data <- function(churn_file) {
  read_csv(churn_file, col_types = cols()) %>%
    initial_split(prop = 0.3) # from the rsample package
}

#' @title Create a preprocessing recipe.
#' @description Create a `recipe` (<https://recipes.tidymodels.org/>)
#'   and run it on the training dataset.
#' @export
#' @return A prepped `recipe` object.
#' @param churn_data An `rsample` object with training and testing datasets.
#' @examples
#' library(recipes)
#' library(rsample)
#' library(tidyverse)
#' churn_data <- split_data("data/churn.csv")
#' prepare_recipe(churn_data)
prepare_recipe <- function(churn_data) {
  churn_data %>%
    training() %>%
    recipe(Churn ~ .) %>%
    step_rm(customerID) %>%
    step_naomit(all_outcomes(), all_predictors()) %>%
    step_discretize(tenure, options = list(cuts = 6)) %>%
    step_log(TotalCharges) %>%
    step_mutate(Churn = ifelse(Churn == "Yes", 1, 0)) %>%
    step_dummy(all_nominal(), -all_outcomes()) %>%
    step_center(all_predictors(), -all_outcomes()) %>%
    step_scale(all_predictors(), -all_outcomes()) %>%
    prep()
}

#' @title Customer churn Keras model definition.
#' @description Define a Keras model for customer churn.
#' @export
#' @return An uncompiled Keras model object.
#' @param churn_recipe A prepped `recipe object` for the churn data.
#' @param units1 Positive integer, number of neurons in the
#'   first layer of the deep neural network.
#' @param units2 Positive integer, number of neurons in the
#'   second layer of the deep neural network.
#' @param act1 Character, name of the activation function in the first
#'   layer of the deep neural network.
#' @param act2 Character, name of the activation function in the second
#'   layer of the deep neural network.
#' @param act3 Character, name of the activation function in the third
#'   layer of the deep neural network.
#' @examples
#' library(keras)
#' library(recipes)
#' library(rsample)
#' library(tidyverse)
#' churn_data <- split_data("data/churn.csv")
#' churn_recipe <- prepare_recipe(churn_data)
#' define_model(churn_recipe, 16, 16, "sigmoid", "sigmoid", "relu")
define_model <- function(churn_recipe, units1, units2, act1, act2, act3) {
  input_shape <- ncol(
    juice(churn_recipe, all_predictors(), composition = "matrix")
  )
  out <- keras_model_sequential() %>%
    layer_dense(
      units = units1,
      kernel_initializer = "uniform",
      activation = act1,
      input_shape = input_shape
    ) %>%
    layer_dropout(rate = 0.1) %>%
    layer_dense(
      units = units2,
      kernel_initializer = "uniform",
      activation = act2
    ) %>%
    layer_dropout(rate = 0.1) %>%
    layer_dense(
      units = 1,
      kernel_initializer = "uniform",
      activation = act3
    )
  out
}

#' @title Train a Keras model for customer churn.
#' @description Predict customer churn on the training dataset.
#' @export
#' @return An trained Keras model object.
#' @inheritParams define_model
#' @examples
#' library(keras)
#' library(recipes)
#' library(rsample)
#' library(tidyverse)
#' churn_data <- split_data("data/churn.csv")
#' churn_recipe <- prepare_recipe(churn_data)
#' train_model(churn_recipe, 16, 16, "sigmoid", "sigmoid", "relu")
train_model <- function(
  churn_recipe,
  units1 = 16,
  units2 = 16,
  act1 = "relu",
  act2 = "relu",
  act3 = "sigmoid"
) {
  model <- define_model(churn_recipe, units1, units2, act1, act2, act3)
  compile(
    model,
    optimizer = "adam",
    loss = "binary_crossentropy",
    metrics = c("accuracy")
  )
  x_train_tbl <- juice(
    churn_recipe,
    all_predictors(),
    composition = "matrix"
  )
  y_train_vec <- juice(churn_recipe, all_outcomes()) %>%
    pull()
  fit(
    object = model,
    x = x_train_tbl,
    y = y_train_vec,
    batch_size = 32,
    epochs = 32,
    validation_split = 0.3,
    verbose = 0
  )
  model
}

#' @title Train a Keras model for customer churn.
#' @description Predict customer churn on the training dataset.
#' @export
#' @return An trained Keras model object.
#' @param churn_data An `rsplit` object of customer churn training
#'   and testing data.
#' @param churn_recipe A `recipes` object with the preprocessing steps
#'   and preprocessed testing data.
#' @param churn_model A Keras model trained on the customer churn
#'   training dataset.
#' @examples
#' library(keras)
#' library(recipes)
#' library(rsample)
#' library(tidyverse)
#' library(yardstick)
#' churn_data <- split_data("data/churn.csv")
#' churn_recipe <- prepare_recipe(churn_data)
#' churn_model <- train_model(churn_recipe, 16, 16, "sigmoid", "relu", "relu")
#' test_accuracy(churn_data, churn_recipe, churn_model)
test_accuracy <- function(churn_data, churn_recipe, churn_model) {
  testing_data <- bake(churn_recipe, testing(churn_data))
  x_test_tbl <- testing_data %>%
    select(-Churn) %>%
    as.matrix()
  y_test_vec <- testing_data %>%
    select(Churn) %>%
    pull()
  yhat_keras_class_vec <- churn_model %>%
    predict_classes(x_test_tbl) %>%
    as.factor() %>%
    fct_recode(yes = "1", no = "0")
  yhat_keras_prob_vec <-
    churn_model %>%
    predict_proba(x_test_tbl) %>%
    as.vector()
  test_truth <- y_test_vec %>%
    as.factor() %>%
    fct_recode(yes = "1", no = "0")
  estimates_keras_tbl <- tibble(
    truth = test_truth,
    estimate = yhat_keras_class_vec,
    class_prob = yhat_keras_prob_vec
  )
  estimates_keras_tbl %>%
    conf_mat(truth, estimate) %>%
    summary() %>%
    filter(.metric == "accuracy") %>%
    pull(.estimate)
}

#' @title Train and test the customer churn Keras model.
#' @description Train on the training dataset, then show the accuracy
#'   on the testing dataset.
#' @export
#' @return A one-row data frame of the testing accuracy and
#'   model hyperparameters.
#' @inheritParams define_model
#' @examples
#' library(keras)
#' library(recipes)
#' library(rsample)
#' library(tidyverse)
#' library(yardstick)
#' churn_data <- split_data("data/churn.csv")
#' churn_recipe <- prepare_recipe(churn_data)
#' test_model(churn_data, churn_recipe, 16, 16, "relu", "relu", "relu")
test_model <- function(
  churn_data,
  churn_recipe,
  units1 = 16,
  units2 = 16,
  act1 = "relu",
  act2 = "relu",
  act3 = "sigmoid"
) {
  churn_model <- train_model(churn_recipe, units1, units2, act1, act2, act3)
  accuracy <- test_accuracy(churn_data, churn_recipe, churn_model)
  tibble(
    accuracy = accuracy,
    units1 = units1,
    units2 = units2,
    act1 = act1,
    act2 = act2,
    act3 = act3
  )
}

#' @title Retrain a Keras model using the results of a previous run.
#' @description Returns the fitted model object.
#' @export
#' @return A trained Keras model object.
#' @param churn_run A one-row data frame from [test_model()] with the
#'   hyperparameters of a previous run.
#' @param churn_recipe
#' @examples
#' library(keras)
#' library(recipes)
#' library(rsample)
#' library(tidyverse)
#' library(yardstick)
#' churn_data <- split_data("data/churn.csv")
#' churn_recipe <- prepare_recipe(churn_data)
#' churn_run <- test_model(churn_data, churn_recipe, 16, 16, "relu")
#' retrain_run(churn_run, churn_recipe)
retrain_run <- function(churn_run, churn_recipe) {
  train_model(
    churn_recipe,
    churn_run$units1,
    churn_run$units2,
    churn_run$act1,
    churn_run$act2,
    churn_run$act3
  )
}
