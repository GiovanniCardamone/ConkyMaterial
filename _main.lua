require 'cairo'

bg_red, bg_green, bg_blue, bg_alpha = 0.25, 0.25, 0.25, 0.4
br_red, br_green, br_blue, br_alpha = 0.12, 0.12, 0.12, 0.8
el_red, el_green, el_blue, el_alpha = 0.99, 0.84, 0.20, 1

cr_red, cr_green, cr_blue, cr_alpha = 0.376, 0.376, 0.376, 1

function map_range(a1, a2, b1, b2, s)
	return b1 + (s - a1) * (b2 - b1) / (a2 - a1)
end


function read_file(path)
    local file = io.open(path, "rb") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a"
    file:close()
    return content
end


function drawimage(cr, img)
    image = cairo_image_surface_create_from_png (img)
    cairo_set_source_surface (cr, image, screen.x, screen.y)
    cairo_paint (cr)
    cairo_surface_destroy (image)
end


function draw_bg_square(conky, surface)
	local canvas = cairo_create(surface)

	-- ---------------------------

	cairo_set_source_rgba(canvas, bg_red, bg_green, bg_blue, bg_alpha)
	cairo_rectangle(canvas, 0, 0, conky_window.width, conky_window.height)
	cairo_fill(canvas)


	cairo_set_source_rgba(canvas, br_red, br_green, br_blue, br_alpha)
	cairo_rectangle(canvas, 0, 0, conky_window.width, conky_window.height)
	cairo_stroke(canvas)

	canvas = nil
end

function draw_bg_triangle(conky, surface)
	local canvas = cairo_create(surface)

	-- ---------------------------

	cairo_set_source_rgba(canvas, bg_red, bg_green, bg_blue, bg_alpha)
	cairo_line_to(canvas, 0, 0)
	cairo_line_to(canvas, conky_window.width, 0)
	cairo_line_to(canvas, 0, conky_window.height)
	cairo_fill(canvas)

	cairo_set_source_rgba(canvas, br_red, br_green, br_blue, br_alpha)
	cairo_line_to(canvas, 0, 0)
	cairo_line_to(canvas, conky_window.width, 0)
	cairo_line_to(canvas, 0, conky_window.height)
	cairo_line_to(canvas, 0, 0)
	cairo_stroke(canvas)

	canvas = nil
end

function draw_icon(width, heigh, canvas, path, pos_x, pos_y, width, height)
	local image = cairo_image_surface_create_from_png(path)
	local w = cairo_image_surface_get_width(image)
	local h = cairo_image_surface_get_height(image)
	local w_img = width / w
	local h_img = height / h

	cairo_scale(canvas, w_img, h_img)

	cairo_save(canvas)
	cairo_set_source_surface (canvas, image, pos_x-w_img/2, pos_y-h_img/2)
	cairo_paint_with_alpha (canvas, 1)
	cairo_surface_destroy (image)
	cairo_restore(canvas)

end


function draw_weather_icon(cr, pos_x, pos_y, image_path, trans)
	cairo_set_operator(cr, CAIRO_OPERATOR_OVER)
	local image = cairo_image_surface_create_from_png (image_path)
	local w_img = cairo_image_surface_get_width (image)
	local h_img = cairo_image_surface_get_height (image)

	cairo_save(cr)
	cairo_set_source_surface (cr, image, pos_x-w_img/2, pos_y-h_img/2)
	cairo_paint_with_alpha (cr, trans)
	cairo_surface_destroy (image)
	cairo_restore(cr)
end