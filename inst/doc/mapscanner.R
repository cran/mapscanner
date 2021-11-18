## ----pkg-load, echo = FALSE, message = FALSE----------------------------------
library (mapscanner)
library (ggplot2)
requireNamespace ("sf")
# vwidth/height are passed via mapview::mapshot to webshot::webshot,
# and default to (992,744), which bloats package size (issue #27).
red <- 2
vwidth <- 992 / red
vheight <- 744 / red

## ----install, eval = FALSE----------------------------------------------------
#  remotes::install_github ("ropensci/mapscanner")
#  remotes::install_git("https://git.sr.ht/~mpadge/mapscanner")
#  remotes::install_bitbucket("mpadge/mapscanner")
#  remotes::install_gitlab("mpadge/mapscanner")

## ----load---------------------------------------------------------------------
library (mapscanner)

## ----generate-fakey, eval = FALSE---------------------------------------------
#  ms_generate_map ("chennai india", mapname = "chennai")

## ----generate, echo = FALSE---------------------------------------------------
message ("Successfully generated 'chennai.pdf' and 'chennai.png'")

## ----chennaiBrick-fakey, eval = FALSE-----------------------------------------
#  x <- ms_generate_map ("chennai india", mapname = "chennai")

## ---- echo = FALSE------------------------------------------------------------
message ("Successfully generated 'chennai.pdf' and 'chennai.png'")

## ----x, eval = FALSE----------------------------------------------------------
#  x

## ----chennaiBrick, echo = FALSE-----------------------------------------------
x <- paste0 ("class      : RasterBrick\n",
             "dimensions : 1147, 562, 644614, 3  (nrow, ncol, ncell, nlayers)\n",
             "resolution : 38.21851, 38.21851  (x, y)\n",
             "extent     : 8921157, 8942635, 1442787, 1486624  (xmin, xmax, ymin, ymax)\n",
             "crs        : +proj=merc +a=6378137 +b=6378137 +lat_ts=0 +lon_0=0 +x_0=0 +y_0=0 +k=1 +units=m +nadgrids=@null +wktext +no_defs\n",
             "source     : memory\n",
             "names      : index_1.1, index_1.2, index_1.3\n",
             "min values :       107,       107,       107\n",
             "max values :       254,       254,       254")
message (x)

## ----chennaiBrick2, eval = FALSE----------------------------------------------
#  ms_generate_map (raster_brick = x, mapname = "chennai")

## ----omaha-poly-png, echo = FALSE, out.width = "75%", eval = TRUE-------------
op <- system.file ("extdata", "omaha-polygons.png", package = "mapscanner")
f <- file.path (tempdir (), "omama-polygons.png")
chk <- file.copy (op, f)
knitr::include_graphics (f)

## ----rectify, message = FALSE-------------------------------------------------
f_orig <- system.file ("extdata", "omaha.png", package = "mapscanner")
f_mod <- system.file ("extdata", "omaha-polygons.png", package = "mapscanner")
xy <- ms_rectify_map (f_orig, f_mod, nitems = 2)
xy

## ----mapshot-hulls, eval = TRUE, echo = FALSE---------------------------------
xy$id <- seq (nrow (xy))
if (!file.exists ("mapshot-polys.png"))
{
    x <- mapview::mapview (xy)
    mapview::mapshot (x, file = "mapshot-hulls.png",
                      remove_controls = c ("layersControl", "zoomControl"),
                      vwidth = vwidth, vheight = vheight)
}

## ----mapview-fakey, eval = FALSE----------------------------------------------
#  xy$id <- seq (nrow (xy))
#  mapview::mapview (xy)

## ----mapshot-hulls-png, echo = FALSE, out.width = "75%"-----------------------
knitr::include_graphics ("mapshot-hulls.png")
#plot (xy)

## ----type-polys---------------------------------------------------------------
f_orig <- system.file ("extdata", "omaha.png", package = "mapscanner")
f_mod <- system.file ("extdata", "omaha-polygons.png", package = "mapscanner")
xy <- ms_rectify_map (f_orig, f_mod, type = "polygons", quiet = TRUE)

## ----mapview-polys, eval = TRUE, echo = FALSE---------------------------------
xy$id <- seq (nrow (xy))
if (!file.exists ("mapshot-polys.png"))
{
    x <- mapview::mapview (xy)
    mapview::mapshot (x, file = "mapshot-polys.png",
                      remove_controls = c ("layersControl", "zoomControl"),
                      vwidth = vwidth, vheight = vheight)
}

## ----mapview-polys-fakey, eval = FALSE----------------------------------------
#  xy$id <- seq (nrow (xy))
#  mapview::mapview (xy)

## ----mapshot-polys-png, echo = FALSE, out.width = "75%"-----------------------
knitr::include_graphics ("mapshot-polys.png")
#plot (xy)

## ----type-points--------------------------------------------------------------
f_orig <- system.file ("extdata", "omaha.png", package = "mapscanner")
f_mod <- system.file ("extdata", "omaha-polygons.png", package = "mapscanner")
xy <- ms_rectify_map (f_orig, f_mod, type = "points", quiet = TRUE)

## ----mapview-points, eval = TRUE, echo = FALSE--------------------------------
xy$id <- seq (nrow (xy))
if (!file.exists ("mapshot-points.png"))
{
    x <- mapview::mapview (xy)
    mapview::mapshot (x, file = "mapshot-points.png",
                      remove_controls = c ("layersControl", "zoomControl"),
                      vwidth = vwidth, vheight = vheight)
}

## ----mapview-points-fakey, eval = FALSE---------------------------------------
#  xy$id <- seq (nrow (xy))
#  mapview::mapview (xy)

## ----mapshot-points-png, echo = FALSE, out.width = "75%"----------------------
knitr::include_graphics ("mapshot-points.png")
#plot (xy)

## ----random-polys-fakey, eval = FALSE-----------------------------------------
#  n <- 5 # number of polygons
#  polys <- lapply (seq (n), function (i) {
#                       nxy <- 20 # number of points used to generate hull
#                       xy <- matrix (runif (2 * nxy), ncol = 2)
#                       h <- chull (xy)
#                       sf::st_polygon (list (xy [c (h, h [1]), ]))
#              })
#  polys <- sf::st_sf (n = seq (n), geometry = polys)

## ----random-polys-fakey2, eval = FALSE----------------------------------------
#  aggr <- ms_aggregate_polys (polys)
#  polys$type <- "raw polygons"
#  aggr$type <- "aggregated polygons"
#  polys <- rbind (polys, aggr)
#  # Convert type to factor to order facets:
#  polys$type <- factor (polys$type, levels = c ("raw polygons", "aggregated polygons"))
#  library (ggplot2)
#  ggplot (polys, aes (fill = n)) + geom_sf () + facet_wrap (~type)

## ----random-polys, echo = FALSE, eval = TRUE----------------------------------
set.seed (1)
n <- 5 # number of polygons
polys <- lapply (seq (n), function (i) {
                     nxy <- 20 # number of points used to generate hull
                     xy <- matrix (runif (2 * nxy), ncol = 2)
                     h <- chull (xy)
                     sf::st_polygon (list (xy [c (h, h [1]), ]))
            })
polys <- sf::st_sf (n = seq (n), geometry = polys)
aggr <- ms_aggregate_polys (polys)
polys$type <- "raw polygons"
aggr$type <- "aggregated polygons"
polys <- rbind (polys, aggr)
polys$type <- factor (polys$type, levels = c ("raw polygons", "aggregated polygons"))
theme_set (theme_minimal ())
ggplot (polys, aes (fill = n)) + geom_sf () + facet_wrap (~type)

## ----aggr13, eval = TRUE------------------------------------------------------
ggplot (aggr [aggr$n %in% c (1, 3, 5), ], aes (fill = n)) + geom_sf ()

## ----aggr-area, eval = TRUE---------------------------------------------------
aggr$area <- sf::st_area (aggr)
ggplot (aggr, aes (x = n, y = area)) + geom_line (size = 2)

## ----pdfinfo-fakey, eval = FALSE----------------------------------------------
#  pdftools::pdf_info ("chennai.pdf")$keys

## ----pdfinfo, echo = FALSE----------------------------------------------------
x <- list ("Title" = "EX8921118.44521949+1442748.9088827+8942673.68719591+1486623.76311839",
           "Producer" = "R 4.0.0",
           "Creator" = "R")
x

## ----img-comment-fakey, eval = FALSE------------------------------------------
#  img <- magick::image_read ("chennai.png")
#  magick::image_comment (img)

## ----img-comment, echo = FALSE------------------------------------------------
"EX8921118.44521949+1442748.9088827+8942673.68719591+1486623.76311839"

