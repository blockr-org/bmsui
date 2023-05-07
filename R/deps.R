dependencies <- function(){
  list(
    css()
  ) 
}

css <- function(){
  htmltools::htmlDependency(
    name = "bms-styles",
    version = utils::packageVersion("bmsui"),
    package = "bmsui",
    src = "assets",
    stylesheet = c(file = "style.min.css")
  )
}
