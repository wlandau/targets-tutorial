choices <- function(x, ...) {
  switch(tolower(x), ...)
}

yes <- function(x = "") {
  message(cli::col_green(cli::symbol$tick), " Correct! ", x)
}

no <- function(x = "") {
  message(cli::col_red(cli::symbol$cross), " Incorrect. ", x)
}

issue <- function() {
  message(
    cli::col_yellow(cli::symbol$warning),
    " Please file an issue at https://github.com/wlandau/targets-tutorial"
  )
}

invalid <- function() {
  x <- "Please supply a single letter among the choices given."
  message(cli::col_yellow(cli::symbol$warning), " ", x)
}
