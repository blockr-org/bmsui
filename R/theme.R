bms_theme <- function(..., primary = "#333333"){
  bslib::bs_theme(
    version = 5L,
    bootswatch = "litera", 
    primary = "#be2bbb",
    base_font = bslib::font_face(
      family = "Trebuchet",
      style = "normal",
      src = "url(/public/fonts/trebuc.ttf)",
    ),
    ...
  )
}
