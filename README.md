<!-- badges: start -->
<!-- badges: end -->

# bmsui

An R package to create BMS-themed user interfaces for shiny application.

## Installation

You can install the development version of bmsui from [GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
devtools::install_github("blockr-org/bmsui")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(shiny)
library(bmsui)

ui <- bmsPage(
  navbar = navbar(
    title = "Example application",
    navbarItem("Profile")
  ),
  sidebar = sidebar(
    title = h3("Menu", class = "mt-0 pt-0"),
    sidebarItem(
      "Hello",
      h1("Hello"),
      p("No padding"),
      div(
        class = "p-4",
        h2("Buttons"),
        tags$a(class = "btn btn-primary", "Primary"),
        tags$a(class = "btn btn-secondary", "Secondary"),
        tags$a(class = "btn btn-info", "Info"),
        tags$a(class = "btn btn-warning", "Warning"),
        tags$a(class = "btn btn-danger", "Danger"),
        tags$a(class = "btn btn-success", "Success")
      )
    ),
    sidebarCollapsible(
      title = "Collapsible",
      sidebarCollapsibleItem(
        "Collapse 1",
        h1("Collapsed")
      ),
      sidebarCollapsibleItem(
        "Collapse 2",
        h1("Collapsed 2")
      )
    ),
    sidebarItem(
      "World",
      div(
        class = "p-4",
        h1("World"),
        p("With padding")
      )
    ),
    sidebarItem(
      "Select",
      div(
        class = "p-4",
        h1("Select"),
        p("Selects a tab from the server"),
        selectInput(
          "selectTab",
          "tab",
          choices = c(
            "Hello",
            "World",
            "Insert"
          )
        )
      )
    ),
    sidebarItem(
      "Insert",
      div(
        class = "p-4",
        h1("Insert"),
        p("Inserts a new tab"),
        textInput(
          "insertTitle",
          "Title"
        ),
        actionButton(
          "insert",
          "Insert",
          class = "bg-primary"
        ),
        hr(),
        p("Inserts a collapsible sidebar entry"),
        textInput(
          "insertCollapsibleTitle",
          "Collapsible entry title"
        ),
        actionButton(
          "insertCollapsible",
          "Insert",
          class = "bg-info"
        ),
        hr(),
        p("Inserts an item under an existing collapsible sidebar entry"),
        textInput(
          "insertCollapsibleTarget",
          "Collapsible entry target"
        ),
        textInput(
          "insertCollapsibleItemTitle",
          "Sidebar entry title"
        ),
        actionButton(
          "insertCollapsibleItem",
          "Insert",
          class = "bg-info"
        )
      )
    )
  )
)

server <- function(input, output, session) {
  observeEvent(input$insert, {
    req(input$insertTitle)

    insert_sidebar_item(
      input$insertTitle,
      div(
        h1(input$insertTitle)
      ) 
    ) 
  })

  observeEvent(input$selectTab, {
    select_sidebar_item(input$selectTab)
  }, ignoreInit = TRUE)

  observeEvent(input$insertCollapsible, {
    req(input$insertCollapsibleTitle)

    insert_sidebar_collapsible(
      input$insertCollapsibleTitle
    ) 
  })

  observeEvent(input$insertCollapsibleItem, {
    insert_sidebar_collapsible_item(
      input$insertCollapsibleTarget,
      input$insertCollapsibleItemTitle,
      div(
        h1(input$insertCollapsibleItemTitle)
      )
    ) 
  })
}

shinyApp(ui, server, options = list(port = 8080L))

```

