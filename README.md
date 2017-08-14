
`rep` : Tools to Parse and Test Robots Exclusion Protocol Files and Rules

The 'Robots Exclusion Protocol' <http://www.robotstxt.org/orig.html> documents a set of standards for allowing or excluding robot/spider crawling of different areas of site content. Tools are provided which wrap The 'rep-cpp\` <https://github.com/seomoz/rep-cpp> C++ library for processing these 'robots.txt' files.

-   [`rep-cpp`](https://github.com/seomoz/rep-cpp)
-   [`url-cpp`](https://github.com/seomoz/url-cpp)

The following functions are implemented:

-   `robxp`: Create a robots.txt object
-   `can_fetch`: Test URL path against robots.txt

### Installation

``` r
devtools::install_github("hrbrmstr/rep")
```

### Usage

``` r
library(rep)
library(robotstxt)

# current verison
packageVersion("rep")
```

    ## [1] '0.1.0'

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

### Test Results

``` r
library(rep)
library(testthat)

date()
```

    ## [1] "Mon Aug 14 15:00:16 2017"

``` r
test_dir("tests/")
```

    ## testthat results ========================================================================================================
    ## OK: 3 SKIPPED: 0 FAILED: 0
    ## 
    ## DONE ===================================================================================================================

### Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
