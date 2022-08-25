WINDOW_SETTINGS = {
    width = 800,
    height = 600
}

local function centralize(obj_width, obj_height)
	local width = WINDOW_SETTINGS.width
	local height = WINDOW_SETTINGS.height

	obj_width = obj_width or 0
	obj_height = obj_height or 0

	local central = {
		x = ((width - obj_width) / 2),
		y = ((height - obj_height) / 2)
	}

	return central
end

function love.load()
    love.window.setMode(WINDOW_SETTINGS.width, WINDOW_SETTINGS.height, { resizable = true })
end

function love.update()
    
end

function love.draw()
    local center = centralize(40, 40)
    love.graphics.ellipse("fill", center.x, center.y, 40, 40)
end

function love.resize(width, height)
    WINDOW_SETTINGS.width = width
    WINDOW_SETTINGS.height = height
end
