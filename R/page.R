#' Create a BMS-themed Page
#' 
#'  Create a BMS-theme shiny page.
#' 
#' @param ... Content of the page, [sidebarItem()]
#' @param title Title of the page.
#' @param theme [bslib::bs_theme()]
#' 
#' @import shiny
#' @export
bmsPage <- function(
  ...,
  title = NULL,
  theme = bms_theme()
){
  if(is.null(title))
    title <- "BMS"

  content <- list(...)
  sidebar <- content[[1]]

  appview <- div(
    class = "d-flex",
    div(
      id = "bms-sidebar-container",
      class = "flex-shrink-1 d-md-block p-4",
      sidebar$sidebar
    ),
    div(
      class = "flex-grow-1 p-0 w-100",
      sidebar$content
    )
  )

  bootstrapPage(
    title = title,
    theme = theme,
    css(),
    div(
      class = "container-fluid",
      id = "app",
      appview
    )
  )
}
