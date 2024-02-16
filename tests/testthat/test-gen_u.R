test_that("test proper use of gen u", {
  expect_true(startsWith(gen_u(), "wildRtrax"))
  expect_true(grepl(R.version$platform, gen_u()))
  expect_true(grepl(R.version$minor, gen_u()))
})
