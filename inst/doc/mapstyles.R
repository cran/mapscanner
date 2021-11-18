## ----pkg-load, echo = FALSE, message = FALSE----------------------------------
library (mapscanner)

## ----map-gen, eval = FALSE----------------------------------------------------
#  bb <- osmdata::getbb ("<name of location>")
#  shrink <- 0.3 # shrink that bounding box to 30% size
#  bb <- t (apply (bb, 1, function (i)
#                   mean (i) + c (-shrink, shrink) * diff (i) / 2))
#  
#  ms_generate_map (bbox = bb,
#                   max_tiles = 16L,
#                   mapname = "map-light",
#                   style = "light")
#  ms_generate_map (bbox = bb,
#                   max_tiles = 16L,
#                   mapname = "omaha-streets",
#                   style = "streets",
#                   bw = FALSE)
#  ms_generate_map (bbox = bb,
#                   max_tiles = 16L,
#                   mapname = "omaha-outdoors",
#                   style = "outdoors",
#                   bw = FALSE)

