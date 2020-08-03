answer_setup <- function(x) {
  choices(
    x,
    a = yes(),
    b = no("No targets run when you *define* your pipeline."),
    c = no("No targets run when you *define* your pipeline."),
    d = no("The code to set up and define the pipeline was written to _targets.R"),
    invalid()
  )
}

answer_first <- function(x) {
  choices(
    x,
    a = no("churn_data does not run first, and churn_file does not depend on churn_data."),
    b = yes(),
    c = no("churn_data does not run first, and the order you write targets in tar_pipeline() does not matter."),
    d = no("The order you write targets in tar_pipeline() does not matter."),
    invalid()
  )
}

answer_last <- function(x) {
  choices(
    x,
    a = yes(),
    b = no("The order you write targets in tar_pipeline() does not matter."),
    c = no("There is a downstream target that depends on best_run."),
    invalid()
  )
}

answer_inspect <- function(x) {
  choices(
    x,
    a = no(),
    b = yes(),
    c = no(),
    d = no(),
    invalid()
  )
}
