# Install pacman if it isn't already installed

if ("pacman" %in% rownames(installed.packages()) == FALSE) install.packages("pacman")


# Install analysis packages using pacman

pacman::p_load(rgdal, rmarkdown, dplyr, daymetr, stringr, remotes, OpenStreetMap, raster)

# install remotes
if ("rayshader" %in% rownames(installed.packages()) == FALSE) {
    remotes::install_github("tylermorganwall/rayshader", upgrade = "always")
}


if ("AOI" %in% rownames(installed.packages()) == FALSE) {
    remotes::install_github("mikejohnson51/AOI", upgrade = "always")
}

if ("HydroData" %in% rownames(installed.packages()) == FALSE) {
    remotes::install_github("mikejohnson51/HydroData", upgrade = "always")
}
