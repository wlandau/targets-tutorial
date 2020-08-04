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

answer_rerun <- function(x) {
  choices(
    x,
    a = no("tar_make() will rerun if their dependencies changed, even if earlier results are already in storage."),
    b = no("The dependencies of best_model did not change, so that target should not have run."),
    c = no("The dependencies of the targets did not change, so they should not have rerun."),
    d = yes(),
    invalid()
  )
}

answer_restart <- function(x) {
  choices(
    x,
    a = yes(),
    b = issue(),
    c = no("All the targets are in storage (in `_targets/objects/`) and should still be to date with their dependencies."),
    d = no("All the targets are in storage (in `_targets/objects/`) and should still be to date with their dependencies."),
    invalid()
  )
}

answer_data <- function(x) {
  choices(
    x,
    a = no("If you do not make changes, your project should have a decent shelf life."),
    b = no("To watch a file for changes, you need a tar_target() with format = \"file\"."),
    c = yes("We will learn more about external data files in the next chapter."),
    d = no("You can tell targets to watch files too with tar_target() and format = \"file\"."),
    invalid()
  )
}
