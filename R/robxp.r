#' Parse a `robots.txt` file & create a `robxp` object
#'
#' This function takes in a single element character vector and parses it into
#' a `robxp` object.
#'
#' @param x either an atomic character vector containing a complete `robots.txt`` file
#'        _or_ a length >1 character vector that will concatenated into a single string _or_
#'        a `connection` object that will be passed to [readLines()], the result of which
#'        will be concatenated into a single string and parsed and the connection will be closed.
#' @export
#' @return a classed object holding an external pointer to parsed robots.txt data
#' @examples
# imdb <- paste0(readLines(system.file("extdata", "imdb-robots.txt",
#                package="spiderbar")), collapse="\n")
# rt <- robxp(imdb)
robxp <- function(x) {

  if (inherits(x, "connection")) {
    y <- readLines(x, warn = FALSE)
    close(x)
    x <- y
  }
  if (is.character(x)) if (length(x) > 1) x <- paste0(x, collapse="\n")

  robxp <- rep_parse(x)
  class(robxp) <- c("robxp")

  robxp

}


#' Custom printer for `robxp`` objects
#'
#' @md
#' @keywords internal
#' @param x object to print
#' @param ... unused
#' @export
print.robxp <- function(x, ...) {
  cat("<Robots Exclusion Protocol Object>")
  invisible(x)
}