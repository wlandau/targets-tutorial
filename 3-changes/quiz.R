answer_1 <- function(x) {
  choices(
    x,
    a = "Incorrect. churn_data does not run first, and churn_file does not depend on churn_data.",
    b = "Correct!",
    c = "Incorrect. churn_data does not run first, and the order you write targets in tar_pipeline() does not matter.",
    d = "Incorrect. The order you write targets in tar_pipeline() does not matter.",
    invalid()
  )
}

choices <- function(x, ...) {
  cat(switch(tolower(x), ...))
}

invalid <- function() {
  "Please supply a single letter among the choices given."
}
