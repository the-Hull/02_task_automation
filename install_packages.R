# Install pacman if it isn't already installed

if ("pacman" %in% rownames(installed.packages()) == FALSE) install.packages("pacman")


# Install analysis packages using pacman

pacman::p_load(git2r, ncdf4, rgdal, rmarkdown, dplyr, daymetr, stringr, remotes, OpenStreetMap, raster)

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
# - R CMD INSTALL --configure-args="--with-nc-config=/home/joe/bin/nc-config" ncdf4
# test
