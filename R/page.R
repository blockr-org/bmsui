#' Create a BMS-themed Page
#' 
#'  Create a BMS-theme shiny page.
#' 
#' @param ... Content of the page, [sidebarItem()]
#' @param title Title of the page.
#' @param theme [bslib::bs_theme()]
#' @param sidebar Sidebar as returned by [sidebar()].
#' @param navbar Navbar as returned by [navbar()].
#' 
#' @import shiny
#' @export
bmsPage <- function(
  ...,
  sidebar,
  navbar = NULL,
  title = NULL,
  theme = bms_theme()
){
  if(missing(sidebar))
    stop("Missing sidebar")

  if(is.null(title))
    title <- "BMS"

  if(is.null(navbar))
    navbar <- ""

  serve_public()

  appview <- div(
    class = "d-flex",
    div(
      id = "bms-sidebar-container",
      class = "flex-shrink-1 d-md-block p-2",
      sidebar$sidebar
    ),
    div(
      id = "bms-tabs",
      class = "flex-grow-1 p-0 w-100",
      sidebar$content
    )
  )

  bootstrapPage(
    title = title,
    theme = theme,
    mainDependencies(),
    ...,
    div(
      class = "container-fluid",
      id = "app",
      navbar,
      appview
    )
  )
}
