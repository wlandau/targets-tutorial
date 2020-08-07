answer_review <- function(x) {
  choices(
    x,
    a = no("That is not enough. We also need to set format = \"file\" in tar_target() to tell tar_make() to watch files identified in the return value."),
    b = no("That is not enough. Targets directly downstream need to mention the symbol churn_file in order to register the correct dependency relationships."),
    c = no("That is not enough. The target's return value must be a character vector of file paths to track."),
    d = yes(),
    invalid()
  )
}
