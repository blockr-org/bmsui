constructSidebarCollapsible <- function(x) {
  structure(x, class = "sidebar-collapsible")
}

constructSidebarCollapsibleItem <- function(x) {
  structure(x, class = "sidebar-item-collapsible")
}

constructSidebarItem <- function(x) {
  structure(x, class = "sidebar-item")
}

constructSidebar <- function(x) {
  structure(x, class = "sidebar")
}

sidebarItemGeneric <- function(
  title,
  ...
) {
  assert_that(is_not_missing(title))

  list(
    title = title,
    content = div(
      `data-tab` = title,
      class = "bms-sidebar-item d-none",
      ...
    )
  )
}

