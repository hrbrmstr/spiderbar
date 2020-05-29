library(spiderbar)

cdc <- paste0(readLines(system.file("extdata", "cdc-robots.txt", package="spiderbar")), collapse="\n")
rt1 <- robxp(cdc)

expect_true(inherits(rt1, "robxp"))

expect_true(can_fetch(rt1, "/asthma/asthma_stats/default.htm", "*"))
expect_false(can_fetch(rt1, "/_borders", "*"))

imdb <- paste0(readLines(system.file("extdata", "imdb-robots.txt", package="spiderbar")), collapse="\n")
rt2 <- robxp(imdb)
cd <- crawl_delays(rt2)

expect_true(inherits(cd, "data.frame"))
expect_equal(sort(cd$crawl_delay), sort(c(0.1, 3.0, -1.0)))

imdb <- readLines(system.file("extdata", "imdb-robots.txt", package="spiderbar"))
rt2 <- robxp(imdb)

gh <- paste0(readLines(system.file("extdata", "github-robots.txt", package="spiderbar")), collapse="\n")
rt3 <- robxp(gh)

rt3 <- robxp(file(system.file("extdata", "github-robots.txt", package="spiderbar")))

expect_equal(sitemaps(rt1), "http://www.cdc.gov/niosh/sitemaps/sitemapsNIOSH.xml")
expect_equal(sitemaps(rt2), "http://www.imdb.com/sitemap_US_index.xml.gz")
expect_equal(sitemaps(rt3), character(0))

