#' Retrive all agent crawl delay values in a `robxp` `robots.txt` object
#'
#' @md
#' @param obj `robxp` object
#' @return data frame of agents and their crawl delays
#' @note `-1` will be returned for any listed agent _without_ a crawl delay setting
#' @export
#' @examples
#' gh <- paste0(readLines(system.file("extdata", "github-robots.txt",
#'              package="spiderbar")), collapse="\n")
#' gh_rt <- robxp(gh)
#' crawl_delays(gh_rt)
#'
#' imdb <- paste0(readLines(system.file("extdata", "imdb-robots.txt",
#'                package="spiderbar")), collapse="\n")
#' imdb_rt <- robxp(imdb)
#' crawl_delays(imdb_rt)
crawl_delays <- function(obj) {

  if (inherits(obj, "robxp")) {
    rep_crawl_delays(obj)
  } else {
    return(NULL)
  }

}