answer3_setup <- function(x) {
  choices(
    x,
    a = no("_targets.R has more than that."),
    b = no("_targets.R has more than that."),
    c = no("_targets.R has more than that."),
    d = yes(),
    invalid()
  )
}

answer3_first <- function(x) {
  choices(
    x,
    a = no("churn_data does not run first, and churn_file does not depend on churn_data."),
    b = yes(),
    c = no("churn_data does not run first, and the order you write targets in tar_pipeline() does not matter."),
    d = no("The order you write targets in tar_pipeline() does not matter."),
    invalid()
  )
}

answer3_last <- function(x) {
  choices(
    x,
    a = yes(),
    b = no("The order you write targets in tar_pipeline() does not matter."),
    c = no("There is a downstream target that depends on best_run."),
    invalid()
  )
}

answer3_inspect <- function(x) {
  choices(
    x,
    a = no(),
    b = yes(),
    c = no(),
    d = no(),
    invalid()
  )
}

answer3_rerun <- function(x) {
  choices(
    x,
    a = no("tar_make() will rerun if their dependencies changed, even if earlier results are already in storage."),
    b = no("The dependencies of best_model did not change, so that target should not have run."),
    c = no("The dependencies of the targets did not change, so they should not have rerun."),
    d = yes(),
    invalid()
  )
}

answer3_restart <- function(x) {
  choices(
    x,
    a = yes(),
    b = issue(),
    c = no("All the targets are in storage (in `_targets/objects/`) and should still be to date with their dependencies."),
    d = no("All the targets are in storage (in `_targets/objects/`) and should still be to date with their dependencies."),
    invalid()
  )
}

answer3_data <- function(x) {
  choices(
    x,
    a = no("If you do not make changes, your project should have a decent shelf life."),
    b = no("To watch a file for changes, you need a tar_target() with format = \"file\"."),
    c = yes("We will learn more about external data files in the next chapter."),
    d = no("You can tell targets to watch files too with tar_target() and format = \"file\"."),
    invalid()
  )
}

answer3_command <- function(x) {
  choices(
    x,
    a = no("tar_make() cannot predict that bind_rows() and rbind() will return the same value. It needs to run best_run to find out."),
    b = no("tar_make() cannot predict that bind_rows() and rbind() will return the same value. It needs to run best_run to find out."),
    c = no("tar_make() skips best_model. Yes, best_run did rerun, but it returned the same value. That means best_model is still up to date."),
    d = yes(),
    invalid()
  )
}

answer3_function <- function(x) {
  choices(
    x,
    a = no("Some targets do call test_model() and retrain_model(), both of which depend on define_model() through train_model(). tar_make() detects this."),
    b = no("tar_make() still takes the change in dropout rate seriously."),
    c = no("best_model calls retrain_run(), which does depend on define_model() through train_model()."),
    d = yes(),
    invalid()
  )
}

answer3_trivial <- function(x) {
  choices(
    x,
    a = no("tar_make() ignores trivial changes like comments and white space: anything that does not show up in deparse(define_model)."),
    b = yes(),
    c = no("tar_make() does detect nontrivial changes to functions."),
    d = no("Some targets do call test_model() and retrain_model(), both of which depend on define_model() through train_model(). tar_make() detects this."),
    invalid()
  )
}

