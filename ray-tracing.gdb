# vector {{{ #
document vector_print
  arg0: str
end
define vector_print
  set $vector_print_arg0 = $arg0
  eval "printf \"%s: (%%f, %%f, %%f)\n\", %s[0], %s[1], %s[2]", $vector_print_arg0, $vector_print_arg0, $vector_print_arg0, $vector_print_arg0
end

document vector_add
  arg0: float[3]
  arg1: float[3]
  return: float[3]
end
define vector_add
  set $return = {$arg0[0] + $arg1[0], $arg0[1] + $arg1[1], $arg0[2] + $arg1[2]}
end

document vector_minus
  arg0: float[3]
  arg1: float[3]
  return: float[3]
end
define vector_minus
  set $return = {$arg0[0] - $arg1[0], $arg0[1] - $arg1[1], $arg0[2] - $arg1[2]}
end

document vector_multiply
  arg0: float[3]
  arg1: float[3]
  return: float[3]
end
define vector_multiply
  set $return = {$arg0[0] * $arg1[0], $arg0[1] * $arg1[1], $arg0[2] * $arg1[2]}
end

document vector_divide
  arg0: float[3]
  arg1: float[3]
  return: float[3]
end
define vector_divide
  set $return = {$arg0[0] / $arg1[0], $arg0[1] / $arg1[1], $arg0[2] / $arg1[2]}
end

document vector_scalar_multiply
  arg0: float[3]
  arg1: float
  return: float[3]
end
define vector_scalar_multiply
  set $return = {$arg0[0] * $arg1, $arg0[1] * $arg1, $arg0[2] * $arg1}
end

document vector_scalar_divide
  arg0: float[3]
  arg1: float
  return: float[3]
end
define vector_scalar_divide
  set $return = {$arg0[0] / $arg1, $arg0[1] / $arg1, $arg0[2] / $arg1}
end

document vector_dot
  arg0: float[3]
  arg1: float[3]
  return: float
end
define vector_dot
  set $return = $arg0[0] * $arg1[0] + $arg0[1] * $arg1[1] + $arg0[2] * $arg1[2]
end

document vector_square
  arg0: float[3]
  return: float
end
define vector_square
  vector_dot $arg0 $arg0
end

document vector_is_equal_0
  arg0: float[3]
  return: int
end
define vector_is_equal_0
  vector_square $arg0
  set $return = !$return
end

document vector_is_equal
  arg0: float[3]
  arg1: float[3]
  return: int
end
define vector_is_equal
  vector_minus $arg0 $arg1
  vector_square $return
  set $return = !$return
end

document vector_is_not_equal
  arg0: float[3]
  arg1: float[3]
  return: int
end
define vector_is_not_equal
  vector_is_equal $arg0 $arg1
  set $return = !$return
end

document vector_norm
  arg0: float[3]
  return: float
end
define vector_norm
  vector_square $arg0
  float_sqrt $return
end

document vector_normalize
  arg0: float[3]
  return: float[3]
end
define vector_normalize
  set $vector_normalize_vector = $arg0
  vector_norm $vector_normalize_vector
  vector_scalar_divide $vector_normalize_vector $return
end

document vector_scale
  arg0: float[3]
  arg1: float: distance
  return: float[3]
end
define vector_scale
  set $ray_at_length = $arg1
  vector_normalize $arg0
  vector_scalar_multiply $return $ray_at_length
end

document vector_reflect
  arg0: float[3]: input vector
  arg1: float[3]: normal vector
  return: float[3]: reflected vector
end
define vector_reflect
  set $vector_reflect_input = $arg0
  set $vector_reflect_normal = $arg1
  vector_dot $arg0 $arg1
  set $return = 2 * $return
  vector_scalar_multiply $vector_reflect_normal $return
  vector_minus $vector_reflect_input $return
end
# }}} vector #

# float {{{ #
document float_print
  arg0: str
end
define float_print
  set $float_print_arg0 = $arg0
  eval "printf \"%s: %%f\n\", %s", $float_print_arg0, $float_print_arg0
end

document float_abs
  arg0: float
  return: float
end
define float_abs
  set $return = $arg0
  if $return < 0
    set $return = -$return
  end
end

document float_sqrt
  arg0: float
  arg1: float: bias max, default 0.01
  return: float

  x = sqrt(a)
  f(x) = x^2 - a = 0
  x_n = x_{n - 1} - f(x_{n - 1}) / f'(x_{n - 1})
  x_n = (x_{n - 1} + a / x_{n - 1}) / 2
end
define float_sqrt
  set $float_sqrt_a = $arg0
  if $argc < 2
    set $float_sqrt_bias_max = 0.01
  else
    set $float_sqrt_bias_max = $arg1
  end
  set $float_sqrt_root = 16.
  set $return = $float_sqrt_bias_max
  while($return >= $float_sqrt_bias_max)
    set $float_sqrt_root = ($float_sqrt_root + $float_sqrt_a / $float_sqrt_root) / 2
    set $return = $float_sqrt_root * $float_sqrt_root - $float_sqrt_a
    float_abs $return
  end
  set $return = $float_sqrt_root
end

document float_is_equal_0
  arg0: float
  return: float
end
define float_is_equal_0
  set $return = $arg0 == 0
end

document float_is_equal
  arg0: float
  arg1: float
  return: float
end
define float_is_equal
  set $return = $arg0 == $arg1
end

document float_is_less
  arg0: float
  arg1: float
  return: float
end
define float_is_less
  set $return = $arg0 < $arg1
end

document float_is_less_equal
  arg0: float
  arg1: float
  return: float
end
define float_is_less_equal
  set $return = $arg0 <= $arg1
end

document float_is_greater
  arg0: float
  arg1: float
  return: float
end
define float_is_greater
  set $return = $arg0 > $arg1
end

document float_is_greater_equal
  arg0: float
  arg1: float
  return: float
end
define float_is_greater_equal
  set $return = $arg0 >= $arg1
end

document float_is_close
  arg0: float
  arg1: float
  arg2: float: eps
  return: float
end
define float_is_close
  if $argc < 3
    set $float_is_close_eps = 0.01
  else
    set $float_is_close_eps = $arg2
  end
  set $return = $arg0 - $arg1
  float_abs $return
  set $return = $return < $float_is_close_eps
end

document float_is_not_equal
  arg0: float
  arg1: float
  return: float
end
define float_is_not_equal
  set $return = $arg0 != $arg1
end
# }}} float #

# ray {{{ #
document ray_print
  arg0: str
end
define ray_print
  set $ray_print_arg0 = $arg0
  eval "printf \"%s: (%%f, %%f, %%f) -> (%%f, %%f, %%f)\n\", %s[0], %s[1], %s[2], %s[3], %s[4], %s[5]", $ray_print_arg0, $ray_print_arg0, $ray_print_arg0, $ray_print_arg0, $ray_print_arg0, $ray_print_arg0, $ray_print_arg0
end

document ray_set
  arg0: float[3]: origin
  arg1: float[3]: direction vector, the length is transmission
  return: ray
end
define ray_set
  set $return = {$arg0[0], $arg0[1], $arg0[2], $arg1[0], $arg1[1], $arg1[2]}
end

document ray_get_origin
  arg0: ray
  return: float[3]: origin
end
define ray_get_origin
  set $return = {$arg0[0], $arg0[1], $arg0[2]}
end

document ray_get_direction
  arg0: ray
  return: float[3]: direction vector
end
define ray_get_direction
  set $return = {$arg0[3], $arg0[4], $arg0[5]}
end

document ray_enviroment
  arg0: ray
  arg1: rgb: default: white
  arg2: rgb: default: blue
  return: rgb
end
define ray_enviroment
  set $ray_enviroment_white = {1., 1., 1.}
  set $ray_enviroment_blue = {.5, .8, 1.}
  if $argc > 2
    set $ray_enviroment_white = $arg1
  end
  if $argc > 3
    set $ray_enviroment_blue = $arg2
  end
  ray_get_direction $arg0
  vector_normalize $return
  # sky is oriented to y axis
  set $ray_enviroment_t = ($return[1] + 1) / 2
  vector_scalar_multiply $ray_enviroment_white $ray_enviroment_t
  set $ray_enviroment_white = $return
  set $ray_enviroment_t = 1 - $ray_enviroment_t
  vector_scalar_multiply $ray_enviroment_blue $ray_enviroment_t
  set $ray_enviroment_blue = $return
  vector_add $ray_enviroment_white $ray_enviroment_blue
end

document ray_at
  arg0: ray
  arg1: float: distance
  return: float[3]: arrival position
end
define ray_at
  ray_get_origin $arg0
  set $ray_at_origin = $return
  ray_get_direction $arg0
  vector_scale $return $arg1
  vector_add $return $ray_at_origin
end

document ray_generate
  arg0: int: i
  arg1: int: j
  arg2: int: width
  arg3: int: height
  arg4: float[3]: right
  arg5: float[3]: up
  arg6: float[3]: LB corner
  arg7: float[3]: origin
  arg8: float: transmission
  return: ray
end
define ray_generate
  set $ray_generate_u = (double) $arg0 / $arg2
  set $ray_generate_v = 1. - (double) $arg1 / $arg3
  set $ray_generate_point = $arg6
  vector_scalar_multiply $arg4 $ray_generate_u
  vector_add $ray_generate_point $return
  set $ray_generate_point = $return
  vector_scalar_multiply $arg5 $ray_generate_v
  vector_add $ray_generate_point $return
  vector_minus $return $arg7
  vector_scale $return $arg8
  ray_set $arg7 $return
end

document ray_trace
  arg0: ray
  arg1: int: depth
  arg2: float[3]: reflectance
  arg3: sphere
  arg4: sphere
  arg5: rgb: default: white
  arg6: rgb: default: blue
  return: rgb
end
define ray_trace
  set $ray_trace_ray = $arg0
  set $ray_trace_depth = $arg1
  set $ray_trace_reflectance = $arg2
  set $ray_trace_sphere0 = $arg3
  set $ray_trace_sphere1 = $arg4
  set $ray_enviroment_white = $arg5
  set $ray_enviroment_blue = $arg6

  set $ray_trace_continue = 1
  set $ray_trace_hit_sum = 0
  while $ray_trace_depth > 0 && $ray_trace_continue == 1
    set $ray_trace_hit = 0
    sphere_ray_intersection $ray_trace_sphere0 $ray_trace_ray
    if $return > 0
      set $ray_trace_hit += 1
      sphere_ray_reflect $ray_trace_sphere0 $ray_trace_ray $return
      set $ray_trace_ray = $return
    end
    sphere_ray_intersection $ray_trace_sphere1 $ray_trace_ray
    if $return > 0
      set $ray_trace_hit += 1
      sphere_ray_reflect $ray_trace_sphere1 $ray_trace_ray $return
      set $ray_trace_ray = $return
    end
    set $ray_trace_depth -= 1
    set $ray_trace_hit_sum += $ray_trace_hit
    if $ray_trace_hit == 0
      set $ray_trace_continue = 0
    end
  end
  ray_enviroment $ray_trace_ray $ray_enviroment_white $ray_enviroment_blue
  set $ray_trace_color = $return
  while $ray_trace_hit_sum > 0
    vector_multiply $ray_trace_color $ray_trace_reflectance
    set $ray_trace_color = $return
    set $ray_trace_hit_sum -= 1
  end
  set $return = $ray_trace_color
end

document ray_render
  arg0: int: width
  arg1: int: height
  arg2: float[3]: right
  arg3: float[3]: up
  arg4: float[3]: LB corner
  arg5: float[3]: origin
  arg6: float: transmission
  arg7: int: depth
  arg8: float[3]: reflectance
  arg9: sphere
  arg10: sphere
  arg11: rgb: default: white
  arg12: rgb: default: blue
end
define ray_render
  set $ray_render_width = $arg0
  set $ray_render_height = $arg1
  set $ray_render_right = $arg2
  set $ray_render_up = $arg3
  set $ray_render_lb_corner = $arg4
  set $ray_render_origin = $arg5
  set $ray_render_transmission = $arg6
  set $ray_render_depth = $arg7
  set $ray_render_reflectance = $arg8
  set $ray_render_sphere0 = $arg9
  set $ray_render_sphere1 = $arg10
  set $ray_render_white = $arg11
  set $ray_render_blue = $arg12
  printf "P3\n%d %d\n255\n", $ray_render_width, $ray_render_height
  set $ray_render_j = 1
  while $ray_render_j <= $ray_render_height
    set $ray_render_i = 1
    while $ray_render_i <= $ray_render_width
      ray_generate $ray_render_i $ray_render_j $ray_render_width $ray_render_height $ray_render_right $ray_render_up $ray_render_lb_corner $ray_render_origin $ray_render_transmission
      ray_trace $return $ray_render_depth $ray_render_reflectance $ray_render_sphere0 $ray_render_sphere1 $ray_render_white $ray_render_blue
      vector_scalar_multiply $return 255
      printf "%d %d %d\n", $return[0], $return[1], $return[2]
      set $ray_render_i += 1
    end
    set $ray_render_j += 1
  end
end
# }}} ray #

# sphere {{{ #
document sphere_set
  arg0: float[3]: center
  arg1: float: radius
  return: sphere
end
define sphere_set
  set $return = {$arg0[0], $arg0[1], $arg0[2], $arg1}
end

document sphere_get_center
  arg0: sphere
  return: float[3]: center
end
define sphere_get_center
  set $return = {$arg0[0], $arg0[1], $arg0[2]}
end

document sphere_get_radius
  arg0: sphere
  return: float[3]: radius
end
define sphere_get_radius
  set $return = $arg0[3]
end

document sphere_ray_intersection
  arg0: sphere
  arg1: ray
  return: float[3]: nearer intersection, if return -1, no physical solution

  |p - c|^2 = r^2
  p - o // d => p = kd + o
  =>
  |kd + o - c|^2 = r^2
  |d|^2 k^2 + 2d . (o - c) k + |o - c|^2 - r^2 = 0
  |d|^2 / 2 k^2 + d . (o - c) k + (|o - c|^2 - r^2) / 2 = 0
  delta = (d . (c - o))^2 - |d|^2 (|c - o|^2 - r^2)
  k = (d . (c - o) - sqrt(delta)) / |d|^2
end
define sphere_ray_intersection
  set $sphere_ray_intersection_ray = $arg1
  sphere_get_center $arg0
  set $sphere_ray_intersection_center = $return
  sphere_get_radius $arg0
  set $sphere_ray_intersection_radius = $return
  ray_get_origin $sphere_ray_intersection_ray
  set $sphere_ray_intersection_origin = $return
  ray_get_direction $sphere_ray_intersection_ray
  set $sphere_ray_intersection_direction = $return
  vector_square $sphere_ray_intersection_direction
  set $sphere_ray_intersection_transmission2 = $return
  vector_normalize $sphere_ray_intersection_direction
  set $sphere_ray_intersection_direction = $return
  vector_minus $sphere_ray_intersection_center $sphere_ray_intersection_origin
  set $sphere_ray_intersection_co = $return
  vector_square $sphere_ray_intersection_co
  set $sphere_ray_intersection_co2 = $return
  vector_square $sphere_ray_intersection_direction
  set $sphere_ray_intersection_d2 = $return
  vector_dot $sphere_ray_intersection_direction $sphere_ray_intersection_co
  set $sphere_ray_intersection_d_dot_co = $return
  set $sphere_ray_intersection_delta = $sphere_ray_intersection_d_dot_co * $sphere_ray_intersection_d_dot_co - $sphere_ray_intersection_d2 * ($sphere_ray_intersection_co2 - $sphere_ray_intersection_radius * $sphere_ray_intersection_radius)
  # no any solution
  if $sphere_ray_intersection_delta < 0
    set $return = -1.
  else
    float_sqrt $sphere_ray_intersection_delta
    set $return = ($sphere_ray_intersection_d_dot_co - $return) / $sphere_ray_intersection_d2
    # $return < 0 means it is reverse direction
    # $return ** 2 > $sphere_ray_intersection_transmission2 means it is too far
    if $return < 0.01 ||  $return * $return > $sphere_ray_intersection_transmission2
      set $return = -1.
    end
  end
end

document sphere_ray_reflect
  arg0: sphere
  arg1: ray
  arg2: float: distance
  return: ray
end
define sphere_ray_reflect
  set $sphere_ray_reflect_sphere = $arg0
  set $sphere_ray_reflect_ray = $arg1
  set $sphere_ray_reflect_distance = $arg2
  sphere_get_center $sphere_ray_reflect_sphere
  set $sphere_ray_reflect_center = $return
  ray_get_direction $sphere_ray_reflect_ray
  set $sphere_ray_reflect_direction = $return
  ray_at $ray_trace_ray $sphere_ray_reflect_distance
  set $sphere_ray_reflect_origin = $return
  vector_minus $return $sphere_ray_reflect_center
  vector_normalize $return
  vector_reflect $sphere_ray_reflect_direction $return
  ray_set $sphere_ray_reflect_origin $return
end
# }}} sphere #

# ex: filetype=gdb foldmethod=marker
