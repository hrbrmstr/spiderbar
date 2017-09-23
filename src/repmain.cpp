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


//' Path allowed
//'
//' @noRd
//'
// [[Rcpp::export]]
bool rep_path_allowed(SEXP xp, std::string path, std::string agent = "*") {
  Rcpp::XPtr<Rep::Robots> ptr(xp);
  return(ptr->allowed(path, agent));
}
