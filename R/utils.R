#' Package File
#' 
#' Retrieve path to a file in the package.
#' 
#' @param ... passed to [system.file()].
#' 
#' @export
pkg_file <- function(...) {
  system.file(..., package = "bmsui")
}

#' Serve Public Files
#' 
#' Serve public files.
#' 
#' @export
serve_public <- function() {
  shiny::addResourcePath("public", pkg_file("public"))
}

process_deps <- function(...) {
  utils::getFromNamespace("processDeps", "shiny")(...)
}
