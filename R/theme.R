#' Theme
#' 
#' `bslib` theme
#' 
#' @param ... Passed to [bslib::bs_theme()].
#' 
#' @export
bms_theme <- function(...){
  bslib::bs_theme(
    version = 5L,
    primary = "#be2bbb",
    info = "#33D6F1",
    success = "#2bbe78",
    warning = "#FDA97D",
    danger = "#CB7C78",
    secondary = "#eee7e7",
    "border-radius" = 0,
    base_font = bslib::font_face(
      family = "Trebuchet",
      style = "normal",
      src = "url(/public/fonts/trebuc.ttf)",
    ),
    ...
  )
}
