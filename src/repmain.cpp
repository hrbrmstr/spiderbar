#include <Rcpp.h>
using namespace Rcpp;

#include "url.h"
#include "agent.h"
#include "directive.h"
#include "robots.h"

//' Parse robots.txt
//'
//' @noRd
//'
// [[Rcpp::export]]
SEXP rep_parse(std::string content) {
  Rcpp::XPtr<Rep::Robots> ptr(new Rep::Robots(content));
  return(ptr);
}

//' Get delays
//'
//' @noRd
//'
// [[Rcpp::export]]
DataFrame rep_crawl_delays(SEXP xp) {

  Rcpp::XPtr<Rep::Robots> ptr(xp);

  std::vector<std::string> agents;
  std::vector<float> vals;

  agents.reserve(ptr->agents_.size());
  vals.reserve(ptr->agents_.size());

  for(auto kv : ptr->agents_) {
    agents.push_back(kv.first);
    vals.push_back(kv.second.delay());
  }

  return(DataFrame::create(_["agent"] = agents, _["crawl_delay"] = vals));

}

//' Retrieve a character vector of sitemaps from a parsed robots.txt object
//'
//' @md
//' @param xp A `robxp` object
//' @return charcter vector of all sitemaps found in the parsed `robots.txt` file
//' @export
//' @examples
//' imdb <- paste0(readLines(system.file("extdata", "imdb-robots.txt",
//'                package="rep")), collapse="\n")
//' rt <- robxp(imdb)
//' sitemaps(rt)
// [[Rcpp::export]]
std::vector<std::string> sitemaps(SEXP xp) {

  Rcpp::XPtr<Rep::Robots> ptr(xp);
  return(ptr->sitemaps());

}

//' Retrieve a character vector of sitemaps from a parsed robots.txt object
//'
//' @noRd
//'
// [[Rcpp::export]]
std::string rep_as_string(SEXP xp) {

  Rcpp::XPtr<Rep::Robots> ptr(xp);
  return(ptr->str());

}

//' Path allowed
//'
//' @noRd
//'
// [[Rcpp::export]]
bool rep_path_allowed(SEXP xp, std::string path, std::string agent = "*") {
  Rcpp::XPtr<Rep::Robots> ptr(xp);
  return(ptr->allowed(path, agent));
}
