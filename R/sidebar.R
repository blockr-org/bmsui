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
      if(inherits(item, "sidebar-item")) {
        return(
          div(
            class = "bms-sidebar-open mb-2",
            `data-target` = item$title,
            item$title
          )
        )
      }

      if(inherits(item, "sidebar-item-any")) {
        return(
          div(
            class = "mb-2",
            item
          )
        )
      }

      children <- lapply(item$content, \(subitem) {
        div(
          class = "bms-sidebar-open bms-sidebar-open-collapsible mb-2",
          `data-target` = subitem$title,
          subitem$title
        )
      })

      tagList(
        div(
          class = "bms-sidebar-collapsible-open mb-2",
          `data-bs-toggle` = "collapse",
          href = sprintf("#%s", item$title),
          item$title,
          icon("chevron-down", "float-right bms-sidebar-collapsible-icon")
        ),
        div(
          class = "bms-sidebar-collapsible-content collapse",
          id = item$title,
          children
        )
      )
    })

  if(is.character(title))
    title <- p(title, class = "fs-5")

  if(is.null(title))
    title <- ""

  list(
    sidebar = div(
      class = "bms-sidebar d-flex flex-column h-100",
      div(
        class = "flex-grow-1",
        title,
        entries
      ),
      div(
        class = "flex-shrink-1",
        div(
          id = "bms-sidebar-description"
        ),
        tags$img(
          id = "bms-logo",
          src = "/public/img/logo.svg"
        )
      )
    ),
    content = lapply(list(...), \(item){
      if(inherits(item, "sidebar-item")) {
        return(item$content)
      }
      lapply(item$content, \(subitem) {
        return(subitem$content)
      })
    })
  ) |>
    constructSidebar()
}

#' Sidebar Collapsible
#' 
#' Create a sidebar collapsible, similar to tab but works
#' with a sidebar. 
#' Meant to be passed to [sidebar()].
#' 
#' @inheritParams sidebarItem
#' 
#' @export
sidebarCollapsible <- function(
  title,
  ...
){
  assert_that(is_not_missing(title))

  list(
    title = title,
    content = list(...)
  ) |>
    constructSidebarCollapsible()
}

#' Sidebar Collapsible Item
#' 
#' Create a sidebar collapsible item, similar to tab but works
#' with a sidebar. 
#' Meant to be passed to [sidebarCollapsible()].
#' 
#' @inheritParams sidebarItem
#' 
#' @export
sidebarCollapsibleItem <- function(
  title,
  ...,
  description = NULL
){
  sidebarItemGeneric(title, ..., description = description) |>
    constructSidebarCollapsibleItem()
}

#' Sidebar Item
#' 
#' Create a sidebar item, similar to tab but works
#' with a sidebar. 
#' Meant to be passed to [sidebar()].
#' 
#' @param title Title of the item.
#' @param ... Content of the item.
#' @param description Description of item, shows insidebar
#' 
#' @export
sidebarItem <- function(
  title,
  ...,
  description = NULL
){
  sidebarItemGeneric(title, ..., description = description) |>
    constructSidebarItem()
}

#' Sidebar Item Any
#' 
#' Create a sidebar item with any content,
#' does not trigger the opening of a tab.
#' 
#' @param ... Content of the item.
#' 
#' @export
sidebarItemAny <- function(
  ...
){
  div(..., class = "bms-sidebar-item-any") |>
    list() |>
    constructSidebarItemAny()
}
