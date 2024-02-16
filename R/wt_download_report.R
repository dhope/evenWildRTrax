#' Download reports for ARUs from WildTrax
#'
#' Exported to csvs
#'
#' @param project_ids Vector of project ids to download
#' @param output_directory output directory to export to
#' @param include_birdnet Logical include birdnet outputs
#'
#' @return NULL
#' @export
#'
wt_download_report <- function(project_ids, output_directory = NULL, include_birdnet = FALSE) {
  secret <- Sys.getenv("WT_TOKEN")
  query_list <- list(
    projectIds = project_ids,
    sensorId = "ARU",
    mainReport = TRUE,
    projectReport = TRUE,
    recordingReport = TRUE,
    pointCountReport = FALSE,
    locationReport = TRUE,
    tagReport = TRUE,
    imageReport = FALSE,
    imageSetReport = FALSE,
    birdnetReport = include_birdnet,
    megaDetectorReport = FALSE,
    megaClassifierReport = FALSE,
    includeMetaData = TRUE,
    splitLocation = TRUE
  )


  u <- gen_u()
  # Prepare temporary file:
  tmp <- tempfile(fileext = ".zip")
  # tmp directory
  td <- tempdir()

  r <- httr2::request("https://www-api.wildtrax.ca/") |>
    httr2::req_url_path_append("bis/download-report") |>
    httr2::req_url_query(!!!query_list,
      accept = "application/zip", .multi = "explode"
    ) |>
    httr2::req_auth_bearer_token(secret) |>
    httr2::req_user_agent(u) |>
    httr2::req_progress() |>
    httr2::req_perform(path = tmp)

  if (!rlang::is_null(output_directory)) {
    unzip(tmp, exdir = output_directory)
  }
}
