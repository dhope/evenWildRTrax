#' Download summary
#'
#' @return
#' @export
#'
#' @examples
wt_download_summary <- function(){

  q <- list(sensorId = "ARU",
            sort = "fullNm",
            order = "asc")
  r <-  httr2::request("https://www-api.wildtrax.ca/") |>
    httr2::req_url_path_append("/bis/get-download-summary") |>
    httr2::req_url_query(!!!q) |>
    httr2::req_auth_bearer_token(Sys.getenv("WT_TOKEN")) |>
    httr2::req_user_agent(gen_u()) |> httr2::req_perform()

  httr2::resp_body_json(r)$results |>
    dplyr::bind_rows() |>
    janitor::clean_names()

}
