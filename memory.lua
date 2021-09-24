require 'cairo'
require './_main'

function conky_main ()
	if conky_window == nil then
			return
	end

	local surface = cairo_xlib_surface_create(
		conky_window.display,
		conky_window.drawable,
		conky_window.visual,
		conky_window.width,
		conky_window.height)

	draw_bg_square(conky_window, surface)

	radius = 30
	radius_inner = radius * 0.6
	offset = 72
	offset_x = 8

	half = (conky_window.width) / 2

	center_mem_x =  (half) - ((half - radius) / 2) - radius / 2
	center_swap_x = (2 * half) - ((half - radius) / 2) - radius / 2

	start_angle = -math.pi
	end_angle =  math.pi / 2

	local canvas = cairo_create(surface)

	cairo_set_source_rgba(canvas, el_red, el_green, el_blue, el_alpha)
	cairo_set_line_width(canvas, 1)
	cairo_arc(canvas, center_mem_x, offset + radius / 2, radius, start_angle, end_angle)
	cairo_stroke(canvas)


	end_angle_mem = map_range(0, 100, start_angle, end_angle - start_angle, conky_parse('$memperc'))

	cairo_move_to(canvas, center_mem_x, offset + radius / 2)
	cairo_arc(canvas, center_mem_x, offset + radius / 2, radius - 1, start_angle, end_angle_mem)
	cairo_close_path(canvas)
	cairo_set_source_rgba(canvas, el_red, el_green, el_blue, el_alpha)
	cairo_fill(canvas)

	cairo_move_to(canvas, center_mem_x, offset + radius / 2)
	cairo_arc(canvas, center_mem_x, offset + radius / 2, radius_inner, start_angle, math.pi)
	cairo_close_path(canvas)
	cairo_set_source_rgba(canvas, cr_red, cr_green, cr_blue, cr_alpha)
	cairo_fill(canvas)

	local canvas = cairo_create(surface)

	cairo_set_source_rgba(canvas, el_red, el_green, el_blue, el_alpha)
	cairo_set_line_width(canvas, 1)

	cairo_arc(canvas, center_swap_x, offset + radius / 2, radius, start_angle, end_angle)
	cairo_stroke(canvas)

	end_angle_swap = map_range(0, 100, start_angle, end_angle - start_angle, conky_parse('$swapperc'))

	cairo_move_to(canvas, center_swap_x, offset + radius / 2)
	cairo_arc(canvas, center_swap_x, offset + radius / 2, radius_inner, start_angle, end_angle_swap)
	cairo_close_path(canvas)
	cairo_set_source_rgba(canvas, el_red, el_green, el_blue, el_alpha)
	cairo_fill(canvas)

	cairo_move_to(canvas, center_swap_x, offset + radius / 2)
	cairo_arc(canvas, center_swap_x, offset + radius / 2, radius_inner, start_angle, math.pi)
	cairo_close_path(canvas)
	cairo_set_source_rgba(canvas, cr_red, cr_green, cr_blue, cr_alpha)
	cairo_fill(canvas)


end