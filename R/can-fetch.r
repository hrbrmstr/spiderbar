#' Test URL paths against a `robxp` `robots.txt` object
#'
#' Provide a character vector of URL paths plus optional user agent and this function will
#' return a logical vector indicating whether you have permission to fetch the content
#' at the respective path.
#'
#' @md
#' @param obj `robxp` object
#' @param path path to test
#' @param user_agent user agent to test
#' @export
#' @return logical vector indicating whether you have permission to fetch the content
#' @examples
#' gh <- paste0(readLines(system.file("extdata", "github-robots.txt",
#'              package="spiderbar")), collapse="\n")
#' gh_rt <- robxp(gh)
#'
#' can_fetch(gh_rt, "/humans.txt", "*") # TRUE
#' can_fetch(gh_rt, "/login", "*") # FALSE
#' can_fetch(gh_rt, "/oembed", "CCBot") # FALSE
#'
#' can_fetch(gh_rt, c("/humans.txt", "/login", "/oembed"))
can_fetch <- function(obj, path = "/", user_agent = "*") {

  if (inherits(obj, "robxp")) {
    vapply(path, rep_path_allowed, logical(1), xp=obj, agent=user_agent, USE.NAMES=FALSE)
  } else {
    return(NULL)
  }

}