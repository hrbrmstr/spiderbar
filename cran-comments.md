## Test environments
* local OS X install, R 3.4.1
* ubuntu 14.04 (on travis-ci), R oldrel, release & devel
* appveyor (windows)
* win-builder (devel and release)
* rhub (Windows)

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.

## Reverse dependencies

This is a new release, so there are no reverse dependencies.

---

* Package name, Title & Description were changed/fided 
  as requested by CRAN (Swetlana Herbrandt)
* Code coverage is provided via codecov.io: https://codecov.io/gh/hrbrmstr/spiderbar
* Travis-CI build/test results are at https://travis-ci.org/hrbrmstr/spiderbar
* Appveyor build/test results are at https://ci.appveyor.com/project/hrbrmstr/spiderbar
* No external network calls are made for the robots.txt tests or examples as there
  are four files in the inst/extdata folder which are used instead.
* The README.md generation does exercise the external URL tests.
