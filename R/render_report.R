
#' Render Location and Climate report
#'
#' @param location Character, location passed to AOI::getAOI()
#' @param year Character, Year in YYYY
#'
#' @return Returns nothing, but writes a file to the reports directory
#' @export
#'
#' @examples
render_report = function(location, year) {
    # house keeping on names
    location_dir <- stringr::str_replace_all(location, pattern = "[.]", "-")
    location_dir <- stringr::str_replace_all(location_dir, pattern = "[ ]", "_")

    rmarkdown::render(
        "./templates/report_template.Rmd", params = list(
            location = location,
            year = year
        ),
       output_dir = "./reports",
        output_file = paste0("Report-", location_dir, "-", year, ".html")
    )
}
