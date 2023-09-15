#' Dependencies
#' 
#' JavaScript and CSS dependencies.
#' 
#' @keywords internal
dependencies <- function(){
  list(
    mainDependencies()
  ) 
}

#' Main Dependencies
#' 
#' Main JavaScript and CSS dependencies.
#' 
#' @keywords internal
mainDependencies <- function(){
  htmltools::htmlDependency(
    name = "bms-styles",
    version = utils::packageVersion("bmsui"),
    package = "bmsui",
    src = "assets",
    script = c(file = "index.min.js"),
    stylesheet = c(file = "style.min.css")
  )
}
