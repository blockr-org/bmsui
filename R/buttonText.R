#' Button Text
#' 
#' A button that "transforms" into a text input.
#' 
#' @param inputId Id of input.
#' @param value Initial value.
#' @param placeholder Placeholder for revealed text input.
#' @param validate_content Content of revealed button.
#' @param btn_content Content of initial button.
#' 
#' @examples 
#' library(shiny)
#' 
#' ui <- fluidPage(
#'  buttonTextInput("theId", 0)
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
buttonTextInput <- function(
  inputId, 
  btn_content = "Create", 
  placeholder = "Title", 
  validate_content = shiny::icon("paper-plane"),
  value = ""
){

  stopifnot(!missing(inputId))

  dep <- htmltools::htmlDependency(
    name = "buttonTextBinding",
    version = utils::packageVersion("bmsui"),
    src = "assets",
    script = c(file = "buttonText.min.js"),
    package = "bmsui"
  )

  div(
    class = "buttonTextBinding",
    id = inputId,
    dep,
    tags$button(
      class = "btn btn-default btn-trigger-text w-100",
      type = "button",
      as.character(btn_content)
    ),
    div(
      class = "d-flex d-none",
      div(
        class = "flex-grow-1",
        tags$input(
          type = "text",
          class = "form-control btn-text-input",
          placeholder = placeholder,
          value = value
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
