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

  appview <- div(
    class = "d-flex",
    div(
      id = "bms-sidebar-container",
      class = "flex-shrink-1 d-md-block",
      sapply(list(...), \(item) item$title) |> 
        sidebar()
    ),
    div(
      class = "flex-grow-1 p-0 w-100",
      lapply(list(...), \(item) item$content)
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
