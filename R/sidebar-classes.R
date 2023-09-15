#' Sidebar Collapsible Constructor
#' 
#' Sidebar collapsible constructor
#' 
#' @param x Object to add class to.
#' 
#' @keywords internal
constructSidebarCollapsible <- function(x) {
  structure(x, class = "sidebar-collapsible")
}

#' Sidebar Collapsible Item Constructor
#' 
#' Sidebar collapsible item constructor
#' 
#' @param x Object to add class to.
#' 
#' @keywords internal
constructSidebarCollapsibleItem <- function(x) {
  structure(x, class = "sidebar-item-collapsible")
}

#' Sidebar Item Constructor
#' 
#' Sidebar item constructor
#' 
#' @param x Object to add class to.
#' 
#' @keywords internal
constructSidebarItem <- function(x) {
  structure(x, class = "sidebar-item")
}

#' Sidebar Constructor
#' 
#' Sidebar constructor
#' 
#' @param x Object to add class to.
#' 
#' @keywords internal
constructSidebar <- function(x) {
  structure(x, class = "sidebar")
}

#' Sidebar Item Generic
#' 
#' Sidebar item generic.
#' 
#' @param x Object to add class to.
#' 
#' @note It's not `generic` in the computing sense of the term.
#' 
#' @keywords internal
sidebarItemGeneric <- function(
  title,
  ...,
  description = NULL
) {
  assert_that(is_not_missing(title))

  list(
    title = title,
    content = div(
      `data-tab` = title,
      `data-description` = description,
      class = "bms-sidebar-item d-none",
      ...
    )
  )
}

