answer4_review <- function(x) {
  choices(
    x,
    a = no("That is not enough. We also need to set format = \"file\" in tar_target() to tell tar_make() to watch files identified in the return value."),
    b = no("That is not enough. Targets directly downstream need to mention the symbol churn_file in order to register the correct dependency relationships."),
    c = no("That is not enough. The target's return value must be a character vector of file paths to track."),
    d = yes(),
    invalid()
  )
}

answer4_return <- function(x) {
  choices(
    x,
    a = yes(),
    b = no("targets with format = \"file\" must return paths to files or directories."),
    c = no("targets with format = \"file\" must return paths to files or directories."),
    d = no("targets with format = \"file\" must return paths to files or directories."),
    invalid()
  )
}

answer4_delete <- function(x) {
  choices(
    x,
    a = no("Not all files are reproducibly tracked."),
    b = no("tar_make() reproducibly tracks cor.png because it came from a correctly configured file target."),
    c = yes(),
    d = no("tar_make() does not assume character strings are file names."),
    invalid()
  )
}

answer4_deps1 <- function(x) {
  choices(
    x,
    a = no("R Markdown reports can have target dependencies too."),
    b = no("The report depends on multiple targets"),
    c = no("The report depends on multiple targets"),
    d = yes(),
    invalid()
  )
}

answer4_deps2 <- function(x) {
  choices(
    x,
    a = no("The report still has dependencies."),
    b = no("tar_render() can detect the dependencies of an R Markdown report without needing to render it."),
    c = yes(),
    d = no("The report should still depend on run_relu and run_sigmoid."),
    invalid()
  )
}

answer4_html <- function(x) {
  choices(
    x,
    a = no("tar_make() does not necessarily respond to changes in every single project file."),
    b = yes(),
    c = no("report.Rmd should not have changed."),
    d = no("tar_render() defines a target that reproducibly tracks the R Markdown source, the rendered output files, and the target dependencies."),
    invalid()
  )
}

answer4_rmd <- function(x) {
  choices(
    x,
    a = yes(),
    b = no("Targets with R Markdown reports only rerun when the right dependencies change."),
    c = no("Not everything in the pipeline depends on report.Rmd."),
    d = no("tar_render() defines a target that reproducibly tracks the R Markdown source, the rendered output files, and the target dependencies."),
    invalid()
  )
}

answer4_rmd_data <- function(x) {
  choices(
    x,
    a = no("report_step depends on data/churn.csv indirectly through upstream targets that changed."),
    b = no("report_step depends on data/churn.csv indirectly through upstream targets that changed."),
    c = yes(),
    d = no("Changes to data files do not necessarily invalidate everything. It all depends on what the dependency graph ends up looking like."),
    invalid()
  )
}
