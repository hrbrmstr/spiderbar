#' Create a robots.txt object
#'
#' @param x atomic character vector containing a complete robots.txt file
#' @export
#' @examples
#' library(robotstxt)
#' can_fetch(rt, "/asthma/asthma_stats/default.htm", "*") # TRUE
#' can_fetch(rt, "/_borders", "*") # FALSE
robxp <- function(x) {

  robxp <- rep_parse(x)
  class(robxp) <- c("robxp")

  robxp

}

#' Test URL path against robots.txt
#'
#' @md
#' @param obj `robxp` object
#' @param path path to test
#' @param user_agent user agent to test
#' @export
#' @examples
#' library(robotstxt)
#' can_fetch(rt, "/asthma/asthma_stats/default.htm", "*") # TRUE
#' can_fetch(rt, "/_borders", "*") # FALSE
can_fetch <- function(obj, path="/", user_agent="*") {

  if (inherits(obj, "robxp")) {
    rep_path_allowed(obj, path, user_agent)
  } else {
    return(NULL)
  }

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