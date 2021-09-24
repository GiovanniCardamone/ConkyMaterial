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

	-- cairo_set_source_rgba(canvas, br_red, br_green, br_blue, br_alpha)
	-- cairo_line_to(canvas, 0, 0)
	-- cairo_line_to(canvas, conky_window.width, 0)
	-- cairo_line_to(canvas, 0, conky_window.width)
	-- cairo_line_to(canvas, 0, 0)
	-- cairo_stroke(canvas)

end