
<!-- README.md is generated from README.Rmd. Please edit that file -->

# evenWildRTrax

<!-- badges: start -->
<!-- badges: end -->

The goal of evenWildRTrax is to allow users to download ARU data using
the JWT token. This is not in any way meant to replace
[wildRtrax](https://github.com/ABbiodiversity/wildRtrax) and only
contains very limited functionality to download csv files.

## Installation

You can install the development version of evenWildRTrax from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("dhope/evenWildRTrax")
```

## Example

Basic usage is to first load the package, and assign your token

``` r
library(evenWildRTrax)
set_wt_token()
```

A popup will appear that you can copy your token into. For a more
permanent solution, edit your `.Renviron` file

``` r
usethis::edit_r_environ()
```

and add

    WT_TOKEN = "Your token"

to the file. However remember, this token is then stored insecurely and
if anyone has access to your `.Renviron`, they will be able to download
your data.

Once you have `WT_TOKEN` setup, you can then get a list of your
projects:

``` r
projects <- wt_download_summary()
```

Then you can download one or multiple projects using the `id` column in
your projects table

``` r
full_download <- wt_download_report(project_id = c(6512,165),
                   output_directory = "Path/to/store/csvs/",
                   include_birdnet = FALSE )
```

The `output_directory` should now hold your `csv` files for use.
