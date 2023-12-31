#' Insert Sidebar Item
#' 
#' Insert a sidebar item, similar to tab but works
#' with a sidebar. 
#' 
#' @inheritParams sidebarItem
#' @param session A valid Shiny session.
#' @param id ID of tab.
#' 
#' @export
insert_sidebar_item <- function(
  title,
  ...,
  id = title,
  session = shiny::getDefaultReactiveDomain()
){
  assert_that(is_not_missing(title))

  session$sendCustomMessage(
    "insert-sidebar-item",
    list(
      title = title |> as.character(),
      id = id |> as.character(),
      content = process_deps(
        tagList(...),
        session
      )
    )
  )
}

#' Insert Sidebar Item
#' 
#' Insert a sidebar item, similar to tab but works
#' with a sidebar. 
#' 
#' @inheritParams insert_sidebar_item
#' 
#' @export
select_sidebar_item <- function(
  title,
  session = shiny::getDefaultReactiveDomain()
){
  session$sendCustomMessage(
    "select-sidebar-item",
    list(
      title = title
    )
  )
}

#' Insert Sidebar Collapsible
#' 
#' Insert a sidebar collapsible, similar to tab but works
#' with a sidebar. 
#' 
#' @inheritParams sidebarItem
#' @param session A valid Shiny session.
#' 
#' @export
insert_sidebar_collapsible <- function(
  title,
  session = shiny::getDefaultReactiveDomain()
){
  assert_that(is_not_missing(title))

  session$sendCustomMessage(
    "insert-sidebar-collapsible",
    list(
      title = title
    )
  )
}

#' Insert Sidebar Collapsible Item
#' 
#' Insert a sidebar collapsible, similar to tab but works
#' with a sidebar. 
#' 
#' @param target Title of [sidebarCollapsible()] under which to place this entry.
#' @inheritParams sidebarItem
#' @param session A valid Shiny session.
#' 
#' @export
insert_sidebar_collapsible_item <- function( # nolint
  target,
  title,
  ...,
  session = shiny::getDefaultReactiveDomain()
){
  assert_that(is_not_missing(title))
  assert_that(is_not_missing(target))

  session$sendCustomMessage(
    "insert-sidebar-collapsible-item",
    list(
      target = target,
      title = title,
      content = as.character(...)
    )
  )
}

