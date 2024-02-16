test_that("Bad token fails", {
  expect_error({
    Sys.setenv("WT_TOKEN"="bad token")
    wt_download_report(project_ids = 561,
                       output_directory = tempdir(),
                       include_birdnet = FALSE)
  })
})
