#' targets.tutorial
#' @docType package
#' @description Data science can be slow.
#'   A single round of statistical computation can take several minutes,
#'   hours, or even days to complete. The 'targets'
#'   R package keeps results up to date and reproducible
#'   while minimizing the number of expensive tasks that actually run.
#'   'targets' learns how your pipeline fits together, skips costly
#'   runtime for steps that are already up to date, runs the rest
#'   with optional implicit parallel computing, abstracts files as
#'   R objects, and shows tangible evidence that the output matches
#'   the underlying code and data. In other words, the package saves
#'   time while increasing our ability to trust the conclusions of
#'   the research. This hands-on workshop teaches 'targets'
#'   using a realistic machine learning case study.
#'   Participants begin with the R implementation of a machine
#'   learning project, convert the workflow into a 'targets'-powered pipeline,
#'   and efficiently maintain the output as the code and data change.
#'   The case study comes from an 2018 RStudio AI Blog post by Matt Dancho:
#'     <https://blogs.rstudio.com/ai/posts/2018-01-11-keras-customer-churn>.
#' @name targets-package
#' @importFrom cli col_green col_red col_yellow symbol
#' @importFrom withr local_options
NULL

utils::globalVariables(
  c(
    ".targets_gc_5048826d",
    ".targets_target_5048826d",
    "self"
  )
)
