pkg_file <- function(...) {
  system.file(..., package = "bmsui")
}

serve_public <- function() {
  shiny::addResourcePath("public", pkg_file("public"))
}
