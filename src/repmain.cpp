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
std::vector<float> rep_crawl_delays(SEXP xp) {

  Rcpp::XPtr<Rep::Robots> ptr(xp);

  std::vector<float> vals;
  vals.reserve(ptr->agents_.size());

  for(auto kv : ptr->agents_) {
    vals.push_back(kv.second.delay());
  }

  return(vals);

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
