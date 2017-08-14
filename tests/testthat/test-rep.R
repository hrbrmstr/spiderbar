context("basic functionality")
test_that("we can do something", {

  rt <- robxp(robotstxt::get_robotstxt("https://cdc.gov"))

  expect_that(rt, is_a("robxp"))

  expect_that(can_fetch(rt, "/asthma/asthma_stats/default.htm", "*"), equals(TRUE))
  expect_that(can_fetch(rt, "/_borders", "*"), equals(FALSE))

})
