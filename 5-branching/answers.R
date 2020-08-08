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
