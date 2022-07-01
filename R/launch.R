#' Create settings for Rmarkdown page
#'
#' Set options for the styling of the Rmarkdown theme to use on the page
#' @param theme theme to use for the page
#' @param color primary color for the theme
#' @param header.sticky make header sticky, TRUE or FALSE
#' @param header.image include image such as logo in the header
#' @param header.color color for the title of the page
#' @param list.group.icon set a list group icon
#' @param font.family set the font family
#' @param font.color set the global text color
#'
#' @section Demos for sciRmdTheme:
#' More examples and demo pages for are located at this link -
#' \url{https://github.com/oobianom/sciRmdTheme}.
#'
#' @return styles for themeing the page
#'
#' @examples
#' set.theme("wide")
#' set.theme(
#' theme = "default",
#' color = "purple",
#' header.sticky=TRUE,
#' header.image="logo.png",
#' list.group.icon = "arrow",
#' font.family = "Arial",
#' font.color = "#333333",
#' header.color = "darkblue"
#' )
#'
#' @export

set.theme <- function(
  theme = c("default", "wide"),
  color = NULL,
  header.sticky = TRUE,
  header.image = NULL,
  header.color = NULL,
  list.group.icon = c("circle", "square", "star", "arrow", "quote","heart"),
  font.family = NULL,
  font.color = NULL
  ) {
  # set content
  con <- ""

  # set list symbol
  list.group.icon <- match.arg(list.group.icon)
  list.group.html <- switch(list.group.icon,
    "circle" = "&#9864;",
    "square" = "&#9744;",
    "star" = "&#10029;",
    "arrow" = "&#10097;",
    "quote" = "&#10077;",
    "heart" = "&#10084;"
  )

  # extract template
  theme <- match.arg(theme)
  theme.01 <- theme
  if(theme.01 == "wide") theme.01 <- "default"
  # fetch css
  theme.02.css <- paste0(template.loc(), "/", theme.01, ".css")
  if (file.exists(theme.02.css)) {
    con <- c(con, "<style>", readLines(theme.02.css), "</style>")
    if (!is.null(color)) {
      con <- gsub("gray", color, con)
    }
    if (!header.sticky) {
      con <- gsub("#header \\{", "#headerx {", con)
    }
    if (!is.null(header.image)) {
      con <- gsub("#headerx:before \\{", "#header:before {", con)
      con <- gsub("headerximgurl", header.image, con)
    }
    if(!is.null(font.family))
      con <- gsub("fontfamilyplaceholder", font.family, con)
    if(!is.null(font.color))
      con <- gsub("fontcolorplaceholder", font.color, con)
    if(!is.null(header.color))
      con <- gsub("headercolorplaceholder", header.color, con)
    if(theme == "wide"){
      unsetthis <- "unset!important"
      con <- gsub("1140px", unsetthis, con)
      con <- gsub("960px", unsetthis, con)
      con <- gsub("720px", unsetthis, con)
      con <- gsub("540px", unsetthis, con)
      con <- gsub("1200px!important", unsetthis, con)
      con <- gsub("div.tocifyx", "div.tocify", con)
    }

  }

  # fetch js
  theme.02.js <- paste0(template.loc(), "/", theme.01, ".js")
  if (file.exists(theme.02.js)) {
    con <- c(con, "<script>", readLines(theme.02.js), "</script>")
    con <- gsub("listgroupixon", list.group.html, con)
  }

  # combine and collapse content
  con <- paste(con, collapse = "")

  # set to html
  attr(con, "html") <- TRUE
  class(con) <- c("html", "character")

  # return content
  con
}

template.loc <- function(template = "themes") {
  file.path(find.package(package = "sciRmdTheme"), template)
}







#' @import utils

.onLoad <- function(libname, pkgname) {
  # on load statements

}


.onAttach <- function(libname, pkgname) {
}
