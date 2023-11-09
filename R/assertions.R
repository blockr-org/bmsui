#' Is not Missing
#'
#' @param x Value to check if missing.
#'
#' @keywords internal
is_not_missing <- function(x) {
  !missing(x)
}

#' Is not Missing Assertion
#'
#' @param call Used to deparse expression.
#' @param env Environment.
#'
#' @import assertthat
#'
#' @name not_missing_failure
#'
#' @keywords internal
assertthat::on_failure(is_not_missing) <- function(call, env) {
  paste0(deparse(call$x), " is missing")
}
