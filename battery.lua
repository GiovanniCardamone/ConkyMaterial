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

	draw_bg_triangle(conky_window, surface)

	offset = 10

	percentage = conky_parse('$battery_percent')

	top = 90
	left = offset
	right = conky_window.width - 11 * offset + 4
	bottom = conky_window.height - 3 * offset + 4

	local canvas = cairo_create(surface)

	cairo_set_source_rgba(canvas, el_red, el_green, el_blue, el_alpha)

	cairo_move_to(canvas, left, top)
	cairo_line_to(canvas, right, top)
	cairo_line_to(canvas, left, bottom)
	cairo_line_to(canvas, left, top)
	cairo_stroke(canvas)

	top_p = map_range(0, 100, bottom, top, percentage)
	right_p = map_range(0, 100, offset, right, percentage)

	cairo_move_to(canvas, left, top_p)
	cairo_line_to(canvas, right_p, top_p)
	cairo_line_to(canvas, left, bottom)
	cairo_line_to(canvas, left, top_p)
	cairo_fill(canvas)

end

function conky_format_battery ()
	for word in conky_parse('$battery'):gmatch("%w+") do return word end
end