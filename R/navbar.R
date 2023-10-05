#' Navbar
#' 
#' Create a navbar.
#' Meant to be passed to [bmsPage()].
#' 
#' @param ... Any number of [navbarItem()].
#' @param title Title of navbar.
#' @param alignment Navbar alignment
#' 
#' @name navbar
#' 
#' @export
navbar <- function(..., title = NULL, alignment = c("left", "right")){
  if(is.null(title))
    title <- "BMS"

  alignment <- match.arg(alignment)

  if(is.character(title))
    title <- tags$a(
      class = "navbar-brand",
      title
    )

  div_class <- "collapse navbar-collapse"
  if(alignment == "right")
    div_class <- sprintf("%s justify-content-end", div_class)

  tags$nav(
    class = "navbar navbar-expand-lg mb-0",
    div(
      class = "container-fluid",
      title,
      tags$button(
        class = "navbar-toggler",
        type = "button",
        `data-bs-toggle` = "collapse",
        `data-bs-target` = "#bmsNavbarContent",
        `aria-controls` = "bmsNavbarContent",
        `aria-expanded` = "false",
        `aria-label` = "Toggle navigation",
        span(
          class = "navbar-toggler-icon"
        )
      ),
      div(
        class = div_class,
        id = "bmsNavbarContent",
        tags$ul(
          class = "navbar-nav",
          ...
        )
      )
    )
  )
}

#' Navbar Item
#' 
#' Create a navbar item.
#' Meant to be passed to [navbar()].
#' 
#' @param title Title of navbar item.
#' @param ... Any of attributes.
#' 
#' @export
navbarItem <- function(title, ...){
  if(missing(title))
    stop("Missing title")

  tags$li(
    class = "nav-item",
    tags$a(
      class = "nav-link",
      title,
      ...
    )
  )
}
