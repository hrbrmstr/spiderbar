context("basic functionality")
test_that("parsing and testing works", {

  cdc <- paste0(readLines(system.file("extdata", "cdc-robots.txt", package="rep")), collapse="\n")
  rt <- robxp(cdc)

  expect_that(rt, is_a("robxp"))

  expect_that(can_fetch(rt, "/asthma/asthma_stats/default.htm", "*"), equals(TRUE))
  expect_that(can_fetch(rt, "/_borders", "*"), equals(FALSE))

  imdb <- paste0(readLines(system.file("extdata", "imdb-robots.txt", package="rep")), collapse="\n")
  rt <- robxp(imdb)
  cd <- crawl_delays(rt)

  expect_that(cd, is_a("data.frame"))
  expect_equal(cd$crawl_delay, c(0.1, 3.0, -1.0))

})
