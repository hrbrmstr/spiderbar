#include <Rcpp.h>
using namespace Rcpp;

#include "url.h"
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


//' Path allowed
//'
//' @noRd
//'
// [[Rcpp::export]]
bool rep_path_allowed(SEXP xp, std::string path, std::string agent = "*") {
  Rcpp::XPtr<Rep::Robots> ptr(xp);
  return(ptr->allowed(path, agent));
}
