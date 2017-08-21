#' Get all crawl_delay
#'
#' @md
#' @param obj `robxp` object
#' @export
#' @examples
crawl_delays <- function(obj) {

  if (inherits(obj, "robxp")) {
    rep_crawl_delays(obj)
  } else {
    return(NULL)
  }

}