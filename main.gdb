#!/usr/bin/env -S gdb -x
source ray-tracing.gdb

# camera parameters
set $width = 200
set $height = 100
set $origin = {0., 0., -2.}
set $corner_LB = {-2., -1., -1.}
set $right = {4., 0., 0.}
set $up = {0., 2., 0.}
# scene parameters
set $center0 = {0., 0., 2.}
set $center1 = {0., -100., 2.}
sphere_set $center0 1.
set $sphere0 = $return
sphere_set $center1 99.
set $sphere1 = $return
set $transmission = 65536.
set $depth = 5
set $reflectance = {0.5, 0.5, 0.5}
set $white = {1., 1., 1.}
set $blue = {0.5, 0.5, 0.5}

set logging file output.ppm
set logging enabled on
ray_render $width $height $right $up $corner_LB $origin $transmission $depth $reflectance $sphere0 $sphere1 $white $blue
set logging enabled off
quit
# ex: filetype=gdb
