# Second submission

* This is an update for an existing CRAN package.
* This is a update release to patch the C++11 dependency note highlighted by Dr Ripley

## Test environments
- R-hub windows-x86_64-devel (r-devel)
- R-hub ubuntu-gcc-release (r-release)
- R-hub fedora-clang-devel (r-devel)

## R CMD check results

0 errors | 0 warnings | 0 notes

## revdepcheck results

We checked 1 reverse dependencies (1 from CRAN), comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 0 new problems

# First submission

## Test environments
* local R installation, R 4.0.1
* ubuntu 16.04 (on travis-ci), R 4.0.1
* win-builder (devel)

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a update release to fix a parsing edge case
* Ensured all functions have a @return block
* Fixed spelling mistakes
