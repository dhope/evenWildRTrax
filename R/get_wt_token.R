#' Download token using WildTrax password
#'
#' Token set to WT_TOKEN
#'
#' @param username String. Wildtrax username
#'
#' @return NULL. Does not return anything
#' @export
get_wt_token <- function(username){

  cid <- rawToChar(
    as.raw(c(0x45, 0x67, 0x32, 0x4d, 0x50, 0x56, 0x74, 0x71, 0x6b,
             0x66, 0x33, 0x53, 0x75, 0x4b, 0x53, 0x35, 0x75, 0x58, 0x7a, 0x50,
             0x39, 0x37, 0x6e, 0x78, 0x55, 0x31, 0x33, 0x5a, 0x32, 0x4b, 0x31,
             0x69)))


  req <-  request("https://abmi.auth0.com/")

  r <-   req |>
    req_url_path("oauth/token") |>
    req_body_form(
      audience = "http://www.wildtrax.ca",
      grant_type = "password",
      client_id = cid,
      username = username,
      password = askpass::askpass()) |>
    req_perform()

  # r |> httr2::resp_content_type()




  if(httr2::resp_is_error(r)){
    rlang::abort(sprintf(
      "Authentication failed [%s]\n%s",
      httr2::resp_status(r),
      httr2::resp_body_json(r)$error_description
    ),
    call. = FALSE)
  }


  x <- httr2::resp_body_json(r)
  # Time until token expires
  t0 <- Sys.time()
  x$expiry_time <- t0 + x$expires_in

  Sys.setenv("WT_TOKEN" = x$access_token)


}



# Potential code for more secure code storage.
# httr2::request(base_url = "https://abmi.auth0.com/oauth/token") |>
#   httr2::jwt_claim(aud = "http://www.wildtrax.ca", grant_type = 'password', client_id = cid, username = 'david.hope',
#                    password = askpass::askpass())
#
#
# client <- oauth_client(
#   id = "david.hope",
#   secret = obfuscated(askpass::askpass()),
#   token_url = "https://abmi.auth0.com/oauth/token",
#   name = "WT-token"
# )
#
# token <- oauth_
# oauth_flow_auth_code(
#   client = client,
#   auth_url = "https://abmi.auth0.com/oauth/authorize"
# )
#
# tok <-
#   request("http://www.wildtrax.ca") |>
#   req_oauth_password(client = client, username = 'david.hope', cache_disk = T)
# # https://httr2.r-lib.org/reference/req_oauth_password.html
# tok |> req_perform()
