#' Create RGB overlay for rayshader in correct dimensions
#'
#' @param raster_overlay RasterLayer object to be used as overlay
#' @param raster_extent  RasterLayer object used as base in rayshader
#' @param ncol Numeric, number of colors to use
#'
#' @return an RBG array with nrow and ncol of raster_extent [nrow,ncol,3]
#' @export
#'
#' @examples
create_overlay <- function(raster_overlay, raster_extent, ncol = 100){
    require(raster)

    raster_overlay <- raster::resample(x = raster_overlay,
                                       y = raster_extent,
                                       method = "ngb")

    values <- raster::getValues(raster_overlay)

    # from
    # https://stackoverflow.com/questions/22255465/assign-colors-to-a-range-of-values
    ## Use n equally spaced breaks to assign each value to n-1 equal sized bins
    ii <- cut(values, breaks = seq(min(values,na.rm = TRUE),
                                   max(values, na.rm = TRUE),
                                   len = ncol),
              include.lowest = TRUE)


    ## Use bin indices, ii, to select color from vector of n-1 equally spaced colors
    colors <- colorRampPalette(c("lightgrey", "darkblue"))(ncol - 1)[ii]

    # as rgb, 0 to 1
    rgbcols <- col2rgb(colors)/255

    # extract values into matrices and then bind into array
    col_matrix_red <- matrix(rgbcols[1,],
                             byrow = TRUE,
                             ncol = ncol(raster_overlay),
                             nrow = nrow(raster_overlay))
    col_matrix_green <- matrix(rgbcols[2,],
                               byrow = TRUE,
                               ncol = ncol(raster_overlay),
                               nrow = nrow(raster_overlay))

    col_matrix_blue <- matrix(rgbcols[3,],
                              byrow = TRUE,
                              ncol = ncol(raster_overlay),
                              nrow = nrow(raster_overlay))

    col_array <- array(dim = c(nrow(raster_overlay),
                               ncol(raster_overlay),
                               3))

    col_array[,,1] <- col_matrix_red
    col_array[,,2] <- col_matrix_green
    col_array[,,3] <- col_matrix_blue



    return(col_array)

}
