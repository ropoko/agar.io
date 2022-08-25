WINDOW_SETTINGS = {
    width = 800,
    height = 600
}

MAIN_CIRCLE = {
    x = 100,
    y = 100,
    width = 40,
    height = 40
}

-- local function centralize(obj_width, obj_height)
-- 	local width = WINDOW_SETTINGS.width
-- 	local height = WINDOW_SETTINGS.height

-- 	obj_width = obj_width or 0
-- 	obj_height = obj_height or 0

-- 	local central = {
-- 		x = ((width - obj_width) / 2),
-- 		y = ((height - obj_height) / 2)
-- 	}

-- 	return central
-- end

function love.load()
    love.window.setMode(WINDOW_SETTINGS.width, WINDOW_SETTINGS.height, { resizable = true })
end

function love.update()
    local x, y = love.mouse.getPosition()

    MAIN_CIRCLE.x = x
    MAIN_CIRCLE.y = y
end

function love.draw()
    love.graphics.ellipse("fill", MAIN_CIRCLE.x, MAIN_CIRCLE.y, MAIN_CIRCLE.width, MAIN_CIRCLE.height)
end

function love.resize(width, height)
    WINDOW_SETTINGS.width = width
    WINDOW_SETTINGS.height = height
end

