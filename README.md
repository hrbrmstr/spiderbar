
[Travis-CI Build Status](https://travis-ci.org/hrbrmstr/rep.svg?branch=master) | [AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/hrbrmstr/rep?branch=master&svg=true) | [Coverage Status](https://img.shields.io/codecov/c/github/hrbrmstr/rep/master.svg)

rep
===

Tools to Parse and Test Robots Exclusion Protocol Files and Rules

Description
-----------

The 'Robots Exclusion Protocol' <http://www.robotstxt.org/orig.html> documents a set of standards for allowing or excluding robot/spider crawling of different areas of site content. Tools are provided which wrap The 'rep-cpp\` <https://github.com/seomoz/rep-cpp> C++ library for processing these 'robots.txt' files.

-   [`rep-cpp`](https://github.com/seomoz/rep-cpp)
-   [`url-cpp`](https://github.com/seomoz/url-cpp)

Tools
-----

The following functions are implemented:

-   `can_fetch`: Test URL path against robots.txt
-   `crawl_delays`: Get all agent crawl delay values
-   `print.robxp`: Custom printer for 'robexp' objects
-   `robxp`: Create a robots.txt object

Installation
------------

``` r
devtools::install_github("hrbrmstr/rep")
```

Usage
-----

``` r
library(rep)
library(robotstxt)

# current verison
packageVersion("rep")
```

    ## [1] '0.2.0'

``` r
rt <- robxp(get_robotstxt("https://cdc.gov"))

print(rt)
```

    ## <Robots Exclusion Protocol Object>

``` r
can_fetch(rt, "/asthma/asthma_stats/default.htm", "*")
```

    ## [1] TRUE

``` r
can_fetch(rt, "/_borders", "*")
```

    ## [1] FALSE

``` r
gh_rt <- robxp(robotstxt::get_robotstxt("github.com"))
can_fetch(gh_rt, "/humans.txt", "*") # TRUE
```

    ## [1] TRUE

``` r
can_fetch(gh_rt, "/login", "*") # FALSE
```

    ## [1] FALSE

``` r
can_fetch(gh_rt, "/oembed", "CCBot") # FALSE
```

    ## [1] FALSE

``` r
crawl_delays(gh_rt)
```

    ##                agent crawl_delay
    ## 1             yandex          -1
    ## 2         twitterbot          -1
    ## 3              ccbot          -1
    ## 4        mail.ru_bot          -1
    ## 5         telefonica          -1
    ## 6              slurp          -1
    ## 7          seznambot          -1
    ## 8         sanddollar          -1
    ## 9             coccoc          -1
    ## 10       ia_archiver          -1
    ## 11          swiftbot          -1
    ## 12 red-app-gsa-p-one          -1
    ## 13          naverbot          -1
    ## 14            msnbot          -1
    ## 15             teoma          -1
    ## 16                 *          -1
    ## 17  intuitgsacrawler          -1
    ## 18           bingbot          -1
    ## 19            daumoa          -1
    ## 20         googlebot          -1
    ## 21           httrack          -1
    ## 22       duckduckbot          -1
    ## 23        etaospider          -1
    ## 24          rogerbot          -1
    ## 25            dotbot          -1

``` r
imdb_rt <- robxp(robotstxt::get_robotstxt("imdb.com"))
crawl_delays(imdb_rt)
```

    ##      agent crawl_delay
    ## 1    slurp         0.1
    ## 2 scoutjet         3.0
    ## 3        *        -1.0

Test Results
------------

``` r
library(rep)
library(testthat)

date()
```

    ## [1] "Sat Sep 23 09:14:02 2017"

``` r
test_dir("tests/")
```

    ## testthat results ========================================================================================================
    ## OK: 5 SKIPPED: 0 FAILED: 0
    ## 
    ## DONE ===================================================================================================================

Code of Conduct
---------------

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
