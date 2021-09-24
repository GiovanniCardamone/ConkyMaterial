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


	local canvas = cairo_create(surface)

	local width = 182

	cairo_set_source_rgba(canvas, bg_red, bg_green, bg_blue, bg_alpha)
	cairo_line_to(canvas, 0, 0)
	cairo_line_to(canvas, conky_window.width, 0)
	cairo_line_to(canvas, width, conky_window.height)
	cairo_line_to(canvas, 0, conky_window.height)
	cairo_fill(canvas)

	cairo_set_source_rgba(canvas, br_red, br_green, br_blue, br_alpha)
	cairo_line_to(canvas, 0, 0)
	cairo_line_to(canvas, conky_window.width, 0)
	cairo_line_to(canvas, width, conky_window.height)
	cairo_line_to(canvas, 0, conky_window.height)
	cairo_line_to(canvas, 0, 0)
	cairo_stroke(canvas)

	canvas = nil
end