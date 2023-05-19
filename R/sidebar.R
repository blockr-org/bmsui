makeSidebar <- function(titles) {
  entries <- lapply(titles, \(title) {
    div(
      class = "bms-sidebar-open",
      `data-target` = title,
      title
    )
  })

  div(
    class = "bms-sidebar",
    entries
  )
}

#' Sidebar 
#' 
#' Create a sidebar.
#' Meant to be passed to [bmsPage()].
#' 
#' @param title Title of the sidebar.
#' @param ... Content of the sidebar.
#' 
#' @export
sidebar <- function(
  ..., 
  title = NULL
) {
  entries <- list(...) |>
    lapply(\(item) {
      div(
        class = "bms-sidebar-open mb-2",
        `data-target` = item$title,
        item$title
      )
    })

  if(is.character(title))
    title <- p(title, class = "fs-5")

  if(is.null(title))
    title <- ""

  list(
    sidebar = div(
      class = "bms-sidebar",
      title,
      entries
    ),
    content = lapply(list(...), \(item) item$content)
  ) |>
    constructSidebar()
}

constructSidebar <- function(x) {
  structure(x, class = "sidebar")
}

#' Sidebar Item
#' 
#' Create a sidebar item, similar to tab but works
#' with a sidebar. 
#' Meant to be passed to [sidebar()].
#' 
#' @param title Title of the item.
#' @param ... Content of the item.
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
    constructSidebarItem()
}

constructSidebarItem <- function(x) {
  structure(x, class = "sidebar-item")
}

#' Sidebar Item
#' 
#' Create a sidebar item, similar to tab but works
#' with a sidebar. 
#' Meant to be passed to [sidebar()].
#' 
#' @inheritParams sidebarItem
#' @param session A valid Shiny session.
#' 
#' @export
insertSidebarItem <- function(
  title,
  ...,
  session = shiny::getDefaultReactiveDomain()
){
  assert_that(is_not_missing(title))

  session$sendCustomMessage(
    "insert-sidebar-item",
    list(
      title = title,
      content = as.character(...)
    )
  )
}
