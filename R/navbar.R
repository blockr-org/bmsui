#' Navbar
#' 
#' Create a navbar.
#' Meant to be passed to [bmsPage()].
#' 
#' @param ... Any number of [navbarItem()].
#' @param title Title of navbar.
#' @param navbar_left,navbar_right Navbar left and right.
#' 
#' @name navbar
#' 
#' @export
navbar <- function(navbar_left = navbarLeft(), navbar_right = navbarRight(), title = NULL){
  if(is.null(title))
    title <- "BMS"

  if(is.character(title))
    title <- tags$a(
      class = "navbar-brand",
      title
    )

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
        class = "collapse navbar-collapse d-flex",
        id = "bmsNavbarContent",
        navbar_left,
        navbar_right
      )
    )
  )
}

navbarLR <- function(..., class = ""){
  tags$ul(
    class = sprintf("navbar-nav %s", class) |> trimws(),
    ...
  )
}

#' @rdname navbar
#' @export
navbarLeft <- function(...){
  navbarLR(..., class = "flex-grow-1")
}

#' @rdname navbar
#' @export
navbarRight <- function(...){
  navbarLR(..., class = "flex-shrink-1 ml-auto")
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
