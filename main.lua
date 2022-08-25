require('./camera')

WINDOW_SETTINGS = {
	width = 800,
	height = 600
}

function love.load()
	camera:setBounds(0, 0, WINDOW_SETTINGS.width, WINDOW_SETTINGS.height)
	BACKGROUND = love.graphics.newImage('assets/background.jpg')

	PLAYER = {
		x = 100,
		y = 100,
		width = 40,
		height = 40
	}

	love.window.setMode(WINDOW_SETTINGS.width, WINDOW_SETTINGS.height, { resizable = true })
end

function love.update(dt)
	local mousex, mousey = love.mouse.getPosition()

	local x_distance = mousex - PLAYER.x
	local y_distance = mousey - PLAYER.y

	local speed = 0.05

	PLAYER.x = PLAYER.x + (x_distance * speed)
	PLAYER.y = PLAYER.y + (y_distance * speed)

	local screen_center_x = WINDOW_SETTINGS.width / 2
	local screen_center_y = WINDOW_SETTINGS.height / 2

	camera:setPosition((screen_center_x - PLAYER.x), (screen_center_y - PLAYER.y))

	-- if PLAYER.x < screen_center_x then
	-- 	camera:setPosition((screen_center_x - PLAYER.x), (screen_center_y - PLAYER.y))
	-- end
	-- if PLAYER.x > mousex then
	-- 	camera:setPosition(((WINDOW_SETTINGS.width / 2) - PLAYER.x), ((WINDOW_SETTINGS.height / 2) - PLAYER.y))
	-- end

	-- if PLAYER.y < mousey then
	-- 	camera:setPosition(((WINDOW_SETTINGS.width / 2) - PLAYER.x), ((WINDOW_SETTINGS.height / 2) - PLAYER.y))
	-- end
	-- if PLAYER.x > mousey then
	-- 	camera:setPosition(((WINDOW_SETTINGS.width / 2) - PLAYER.x), ((WINDOW_SETTINGS.height / 2) - PLAYER.y))
	-- end
end

function love.draw()
	camera:set()
	for i = 0, love.graphics.getWidth() / BACKGROUND:getWidth() do
		love.graphics.setColor(255,255,255)
		for j = 0, love.graphics.getHeight() / BACKGROUND:getHeight() do
			love.graphics.draw(BACKGROUND, i * BACKGROUND:getWidth(), j * BACKGROUND:getHeight())
		end
	end

	love.graphics.setColor(0,0,0)
	love.graphics.ellipse("fill", PLAYER.x, PLAYER.y, PLAYER.width, PLAYER.height)
	-- only for reference while configuring camera
	love.graphics.ellipse("fill", 50, 50, PLAYER.width, PLAYER.height)
	camera:unset()
end

function love.resize(width, height)
	WINDOW_SETTINGS.width = width
	WINDOW_SETTINGS.height = height
end
