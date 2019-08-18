#' Parse and Test Robots Exclusion Protocol Files and Rules
#'
#' The 'Robots Exclusion Protocol' (<https://www.robotstxt.org/orig.html>) documents a set
#' of standards for allowing or excluding robot/spider crawling of different areas of
#' site content. Tools are provided which wrap The `rep-cpp` <https://github.com/seomoz/rep-cpp>
#' C++ library for processing these `robots.txt`` files.
#'
#' @md
#' @name spiderbar
#' @docType package
#' @author Bob Rudis (bob@@rud.is)
#' @useDynLib spiderbar, .registration=TRUE
#' @importFrom Rcpp sourceCpp
NULL