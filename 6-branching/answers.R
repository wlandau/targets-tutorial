answer5_different <- function(x) {
  choices(
    x,
    a = no("We also combined all the run_* targets into a single `run` target with branching."),
    b = no("There is also a new upstream target called `activations`."),
    c = yes(),
    d = no("There is also a new upstream target called `activations`."),
    invalid()
  )
}

answer5_map_runs <- function(x) {
  choices(
    x,
    a = no("Adding a model run to this pipeline has downstream consequences."),
    b = no("We already had a sigmoid model run, so it should still be up to date."),
    c = yes(),
    d = no("The pipeline dynamically branches over activations, so only some of the models should have rerun."),
    invalid()
  )
}

answer5_map2 <- function(x) {
  choices(
    x,
    a = no("The models have different values of units1"),
    b = yes(),
    c = no("We only have 3 model runs."),
    d = no("We only have 3 model runs."),
    invalid()
  )
}

answer5_cross_reruns <- function(x) {
  choices(
    x,
    a = no("Some old targets from map() still carry over."),
    b = no("cross() created new and thus outdated targets."),
    c = yes(),
    d = no(),
    invalid()
  )
}

answer5_cross <- function(x) {
  choices(
    x,
    a = no("We have 9 models now."),
    b = no("We have 9 models now."),
    c = no("The models have varying values of units1."),
    d = yes(),
    invalid()
  )
}

answer5_alt_iteration <- function(x) {
  choices(
    x,
    a = no("Please set iteration = \"list\" in tar_target() for `run` and rerun the pipeline."),
    b = yes(),
    c = no("Please set iteration = \"list\" in tar_target() for `run` and rerun the pipeline."),
    d = no("Please set iteration = \"list\" in tar_target() for `run` and rerun the pipeline."),
    invalid()
  )
}

answer5_fickle <- function(x) {
  choices(
    x,
    a = no("Yes, this choice saves time because it skips models when the iteration method of the summaries changes. However, it is not the only correct answer."),
    b = no("In this situation, combining targets together would make your pipeline even more brittle (the monolithic target would invalidate often and rerun everything inside.)."),
    c = no("It is a good answer, but not the only one."),
    d = yes(),
    invalid()
  )
}

answer5_grouped <- function(x) {
  choices(
    x,
    a = no(),
    b = yes(),
    c = no(),
    d = no(),
    invalid()
  )
}

answer5_nrows <- function(x) {
  choices(
    x,
    a = no("Because of tar_group() and group iteration, we branched over 3 groups."),
    b = no("Because of tar_group() and group iteration, we branched over 3 groups."),
    c = yes(),
    d = no("We called nrow() on each group."),
    invalid()
  )
}

answer5_files_branch <- function(x) {
  choices(
    x,
    a = yes(),
    b = no("churn_file_files already checked the data and churn_file branched over the file names."),
    c = no("We can branch over any pattern (branching target) as well as any well-behaved singleton (stem)."),
    d = no("churn_data and churn_recipe both use branching here."),
    invalid()
  )
}

answer5_error <- function(x) {
  choices(
    x,
    a = no(),
    b = no(),
    c = no(),
    d = yes(),
    invalid()
  )
}

answer5_churn_data <- function(x) {
  choices(
    x,
    a = no(),
    b = no(),
    c = yes(),
    d = no(),
    invalid()
  )
}
