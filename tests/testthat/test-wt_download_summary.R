test_that("Bad token fails", {
  expect_error({
    Sys.setenv("WT_TOKEN"="bad token")
    wt_download_summary()
  })
})

