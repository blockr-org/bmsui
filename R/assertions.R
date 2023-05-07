#' @import assertthat
is_not_missing <- function(x) {
  !missing(x)
}

assertthat::on_failure(is_not_missing) <- function(call, env) {
  paste0(deparse(call$x), " is missing")
}

