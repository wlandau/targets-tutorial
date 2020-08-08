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

answer_return <- function(x) {
  choices(
    x,
    a = yes(),
    b = no("targets with format = \"file\" must return paths to files or directories."),
    c = no("targets with format = \"file\" must return paths to files or directories."),
    d = no("targets with format = \"file\" must return paths to files or directories."),
    invalid()
  )
}

answer_delete <- function(x) {
  choices(
    x,
    a = no("Not all files are reproducibly tracked."),
    b = no("tar_make() reproducibly tracks cor.png because it came from a correctly configured file target."),
    c = yes(),
    d = no("tar_make() does not assume character strings are file names."),
    invalid()
  )
}

answer_rmd_deps <- function(x) {
  choices(
    x,
    a = no("R Markdown reports can have target dependencies too."),
    b = no("The report depends on multiple targets"),
    c = no("The report depends on multiple targets"),
    d = yes(),
    invalid()
  )
}
