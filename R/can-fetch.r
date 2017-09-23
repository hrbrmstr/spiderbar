#' Test URL path against robots.txt
#'
#' @md
#' @param obj `robxp` object
#' @param path path to test
#' @param user_agent user agent to test
#' @export
#' @examples
#' gh <- paste0(readLines(system.file("extdata", "github-robots.txt", package="rep")), collapse="\n")
#' gh_rt <- robxp(gh)
#' can_fetch(gh_rt, "/humans.txt", "*") # TRUE
#' can_fetch(gh_rt, "/login", "*") # FALSE
#' can_fetch(gh_rt, "/oembed", "CCBot") # FALSE
can_fetch <- function(obj, path="/", user_agent="*") {

  if (inherits(obj, "robxp")) {
    rep_path_allowed(obj, path, user_agent)
  } else {
    return(NULL)
  }

}