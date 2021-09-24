require './_main'
require 'cairo'

json = require './_json'

-- require 'json'

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

	local canvas = cairo_create(surface)

		local x = 28
		local y = 38
		local width = 48
		local height = 48

	-- cairo_set_source_rgba(canvas, el_red, el_green, el_blue, el_alpha)
	-- cairo_set_line_width(canvas, 1)
	-- cairo_rectangle(canvas, x, y, width, height)
	-- cairo_stroke(canvas)

	local data = json.decode(read_file('./weather.json'))
	local icon = data.current.weather[1].icon
	local temperature = data.current.temp

	cairo_set_source_rgba(canvas, el_red, el_green, el_blue, el_alpha)
	cairo_set_line_width(canvas, 1)
	cairo_rectangle(canvas, 10, y, 8, height)
	cairo_stroke(canvas)

	local bottom = y + height
	local top_p = map_range(-10, 45, y, height, temperature)

	cairo_set_source_rgba(canvas, el_red, el_green, el_blue, el_alpha)
	cairo_set_line_width(canvas, 1)
	cairo_rectangle(canvas, 10, y + top_p, 8, height - top_p)
	cairo_fill(canvas)

	draw_icon(
		width, height, canvas,
		'./weather/' .. icon,
		x + 12, y + 18, width, height
	)



end

function conky_format_weather ()
	local data = json.decode(read_file('./weather.json'))

	local temperature = data.current.temp
	local feels_like = data.current.feels_like
	-- local humidity = data.current.humidity
	-- local wind_speed = data.current.wind_speed
	-- local wind_deg = data.current.wind_deg
	-- local weather = data.current.weather[1]
	return temperature .. "°C ~ " .. feels_like .. "°C"
end