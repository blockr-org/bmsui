sidebar <- function(titles) {
  entries <- lapply(titles, \(title) {
    div(
      class = "sidebar-open",
      `data-target` = title,
      title
    )
  })

  div(
    class = "bms-sidebar",
    entries
  )
}

#' Sidebar Item
#' 
#' Create a sidebar item, similar to tab but works
#' with a sidebar. 
#' Meant to be passed to [bmsPage()].
#' 
#' @param title Title of the sidebar.
#' @param ... Content of the sidebar.
#' 
#' @export
sidebarItem <- function(
  title,
  ...
){
  assert_that(is_not_missing(title))

  list(
    title = title,
    content = div(
      `data-tab` = title,
      class = "bms-sidebar-item d-none",
      ...
    )
  ) |>
    constructSidebar()
}

constructSidebar <- function(x) {
  structure(x, class = "sidebar-item")
}

