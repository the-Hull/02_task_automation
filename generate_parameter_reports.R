## Script executes report generation for all locations listed in sites.txt
source("R/render_report.R")


sites <- read.csv("sites.csv", header = TRUE, stringsAsFactors = FALSE)


for(site in sites$sites){

    render_report(site, year = 2010)
}


git2r::libgit2_features()
