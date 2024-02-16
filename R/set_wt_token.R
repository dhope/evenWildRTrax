#' Set the token into your environment
#'
#' Will allow you to set your token to the environment
#' using `askpass`
#'
#' @return NULL
#' @export
set_wt_token <- function() {
  if(!rlang::is_interactive()){
    rlang::abort("set_wt_token is only for use interactively.
                 Set WT_TOKEN in your .Renviron file.")
  }
  if(rlang::is_interactive()){
  token <- askpass::askpass("Copy your JWT token here")
  Sys.setenv("WT_TOKEN" = token)
  rlang::warn("WT_TOKEN set. This will be lost on restart.
              For a more permanent solution, use `usethis::edit_r_environ()` and
              add WT_TOKEN='your token here' to the text. However remember this
              text will be discoverable by anyone, so do not share your token.")
  }
}
