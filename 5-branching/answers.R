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
