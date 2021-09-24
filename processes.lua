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

end