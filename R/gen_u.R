gen_u <- function(){
  u <- getOption("HTTPUserAgent")
if (is.null(u)) {
  u <- sprintf("R/%s; R (%s)",
               getRversion(),
               paste(getRversion(), R.version$platform, R.version$arch, R.version$os))
}
# Add wildRtrax version information:
u <- paste0("wildRtrax ", as.character(packageVersion("wildRtrax")), "; ", u)
return(u)}
