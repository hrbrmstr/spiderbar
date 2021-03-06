
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Signed
by](https://img.shields.io/badge/Keybase-Verified-brightgreen.svg)](https://keybase.io/hrbrmstr)
![Signed commit
%](https://img.shields.io/badge/Signed_Commits-89%25-lightgrey.svg)
[![Linux build
Status](https://travis-ci.org/hrbrmstr/spiderbar.svg?branch=master)](https://travis-ci.org/hrbrmstr/spiderbar)
[![Windows build
status](https://ci.appveyor.com/api/projects/status/github/hrbrmstr/spiderbar?svg=true)](https://ci.appveyor.com/project/hrbrmstr/spiderbar)
[![Coverage
Status](https://codecov.io/gh/hrbrmstr/spiderbar/branch/master/graph/badge.svg)](https://codecov.io/gh/hrbrmstr/spiderbar)
[![cran
checks](https://cranchecks.info/badges/worst/spiderbar)](https://cranchecks.info/pkgs/spiderbar)
[![CRAN
status](https://www.r-pkg.org/badges/version/spiderbar)](https://www.r-pkg.org/pkg/spiderbar)
![Minimal R
Version](https://img.shields.io/badge/R%3E%3D-3.2.0-blue.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

# spiderbar

Parse and Test Robots Exclusion Protocol Files and Rules

## Description

The ‘Robots Exclusion Protocol’ <https://www.robotstxt.org/orig.html>
documents a set of standards for allowing or excluding robot/spider
crawling of different areas of site content. Tools are provided which
wrap The ‘rep-cpp’ <https://github.com/seomoz/rep-cpp> C++ library for
processing these ‘robots.txt’ files.

  - [`rep-cpp`](https://github.com/seomoz/rep-cpp)
  - [`url-cpp`](https://github.com/seomoz/url-cpp)

## What’s Inside the Tin

The following functions are implemented:

  - `can_fetch`: Test URL paths against a robxp robots.txt object
  - `crawl_delays`: Retrieve all agent crawl delay values in a robxp
    robots.txt object
  - `print.robxp`: Custom printer for ’robxp“ objects
  - `robxp`: Parse a ‘robots.txt’ file & create a ‘robxp’ object
  - `sitemaps`: Retrieve a character vector of sitemaps from a parsed
    robots.txt object

## Installation

``` r
install.packages("spiderbar", repos = c("https://cinc.rud.is", "https://cloud.r-project.org/"))
# or
remotes::install_git("https://git.rud.is/hrbrmstr/spiderbar.git")
# or
remotes::install_git("https://git.sr.ht/~hrbrmstr/spiderbar")
# or
remotes::install_gitlab("hrbrmstr/spiderbar")
# or
remotes::install_bitbucket("hrbrmstr/spiderbar")
# or
remotes::install_github("hrbrmstr/spiderbar")
```

NOTE: To use the ‘remotes’ install options you will need to have the
[{remotes} package](https://github.com/r-lib/remotes) installed.

## Usage

``` r
library(spiderbar)
library(robotstxt)

# current verison
packageVersion("spiderbar")
## [1] '0.2.3'

# use helpers from the robotstxt package

rt <- robxp(get_robotstxt("https://cdc.gov"))

print(rt)
## <Robots Exclusion Protocol Object>

# or 

rt <- robxp(url("https://cdc.gov/robots.txt"))

can_fetch(rt, "/asthma/asthma_stats/default.htm", "*")
## [1] TRUE

can_fetch(rt, "/_borders", "*")
## [1] FALSE

gh_rt <- robxp(robotstxt::get_robotstxt("github.com"))

can_fetch(gh_rt, "/humans.txt", "*") # TRUE
## [1] TRUE

can_fetch(gh_rt, "/login", "*") # FALSE
## [1] TRUE

can_fetch(gh_rt, "/oembed", "CCBot") # FALSE
## [1] TRUE

can_fetch(gh_rt, c("/humans.txt", "/login", "/oembed"))
## [1] TRUE TRUE TRUE

crawl_delays(gh_rt)
```

<div class="kable-table">

| agent | crawl\_delay |
| :---- | -----------: |
| baidu |            1 |
| \*    |          \-1 |

</div>

``` r

imdb_rt <- robxp(robotstxt::get_robotstxt("imdb.com"))

crawl_delays(imdb_rt)
```

<div class="kable-table">

| agent | crawl\_delay |
| :---- | -----------: |
| \*    |          \-1 |

</div>

``` r

sitemaps(imdb_rt)
## character(0)
```

## spiderbar Metrics

| Lang         | \# Files |  (%) |  LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
| :----------- | -------: | ---: | ---: | ---: | ----------: | ---: | -------: | ---: |
| C++          |        9 | 0.39 | 1763 | 0.79 |         257 | 0.56 |      258 | 0.38 |
| C/C++ Header |        7 | 0.30 |  395 | 0.18 |         152 | 0.33 |      280 | 0.42 |
| R            |        6 | 0.26 |   47 | 0.02 |          18 | 0.04 |      101 | 0.15 |
| Rmd          |        1 | 0.04 |   23 | 0.01 |          31 | 0.07 |       33 | 0.05 |

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
