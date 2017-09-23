#' Create a robots.txt object
#'
#' @param x atomic character vector containing a complete robots.txt file
#' @export
#' @examples
#' imdb <- paste0(readLines(system.file("extdata", "imdb-robots.txt", package="rep")), collapse="\n")
#' rt <- robxp(imdb)
robxp <- function(x) {

  robxp <- rep_parse(x)
  class(robxp) <- c("robxp")

  robxp

}


#' Custom printer for 'robexp' objects
#'
#' @md
#' @param x object to print
#' @param ... unused
#' @export
print.robxp <- function(x, ...) {
  cat("<Robots Exclusion Protocol Object>")
}