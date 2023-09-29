# Launch the ShinyApp 
devtools::load_all()

library(shiny)

ui <- bmsPage(
  navbar = navbar(
    title = "Example application",
    navbar_right = navbarRight(
      navbarItem("Profile")
    )
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
      ),
      div(
        class = "card",
        div(
          class = "card-body",
          h2(class = "card-title", "Title")
        )
      )
    ),
    sidebarCollapsible(
      title = "Collapsible",
      sidebarCollapsibleItem(
        "Collapse 1",
        description = "First collapsed stuff",
        h1("Collapsed")
      ),
      sidebarCollapsibleItem(
        "Collapse 2",
        description = "Second collapsed stuff",
        h1("Collapsed 2")
      )
    ),
    sidebarItem(
      "World",
      description = "World stuff",
      div(
        class = "p-4",
        h1("World"),
        p("With padding")
      )
    ),
    sidebarItem(
      "Select",
      description = "Select stuff",
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
    ),
    sidebarItemAny(
      actionButton("add", "Add")
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

shinyApp(ui, server, options = list(port = 3030L))

