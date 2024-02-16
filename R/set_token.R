#' Set the token into your environment
#'
#' @return
#' @export
#'
#' @examples
set_wt_token <- function(){
  token <- askpass::askpass("Copy your JWT token here")
  Sys.setenv("WT_TOKEN"=token)
  rlang::warn("WT_TOKEN set. This will be lost on restart.
              For a more permanent solution, use `usethis::edit_r_environ()` and
              add WT_TOKEN='your token here' to the text. However remember this
              text will be discoverable by anyone, so do not share your token.")
}
