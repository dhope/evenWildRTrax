test_that("set_token doesn't run if not-interactive", {
  if(!rlang::is_interactive()){
    expect_error(set_wt_token())
  } else{TRUE}
})
