#' Toggler Text Input
#' 
#' An element that "transforms" into a text input.
#' 
#' @param inputId Id of input.
#' @param value Initial value.
#' @param placeholder Placeholder for revealed text input.
#' @param validate_content Content of revealed button.
#' @param content Content of initial element.
#' @param restore If `TRUE` it restores the text content to the 
#'  value set in the text input, if `FALSE` it restores the 
#'  to the `content`.
#' 
#' @examples 
#' library(shiny)
#' 
#' ui <- fluidPage(
#'  togglerTextInput("theId", "Button")
#' )
#' 
#' server <- function(input, output){
#' 
#'  observeEvent(input$theId, {
#'    print(input$theId)
#'  })
#' 
#' }
#' 
#' if(interactive())
#'  shinyApp(ui, server)
#' 
#' @importFrom shiny tags tagList
#' 
#' @export 
togglerTextInput <- function(
  inputId, 
  content = "Create", 
  placeholder = "Title", 
  validate_content = shiny::icon("paper-plane"),
  value = "",
  restore = FALSE
){

  stopifnot(!missing(inputId))

  dep <- htmltools::htmlDependency(
    name = "togglerTextBinding",
    version = utils::packageVersion("bmsui"),
    src = "assets",
    script = c(file = "buttonText.min.js"),
    package = "bmsui"
  )

  if(is.character(content))
    content <- tags$button(
      class = "btn btn-default btn-trigger-text w-100",
      type = "button",
      as.character(content)
    )

  content <- content |>
    htmltools::tagAppendAttributes(class = "btn-trigger-text")


  div(
    class = "buttonTextBinding",
    `data-restore` = tolower(restore),
    id = inputId,
    dep,
    content,
    div(
      class = "d-flex d-none",
      div(
        class = "flex-grow-1 position-relative",
        tags$input(
          type = "text",
          class = "form-control btn-text-input",
          placeholder = placeholder,
          value = value
        ),
        span(
          class = "cursor-pointer position-absolute top-0 start-0 translate-middle badge rounded-pill bg-danger btn-text-cancel",
          shiny::icon("times")
        )
      ),
      div(
        class = "flex-shrink-1",
        tags$button(
          class = "btn btn-primary btn-validate",
          validate_content
        )
      )
    )
  )
}
