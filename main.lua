local Camera = require('./lib/camera')

local WINDOW_SETTINGS = {
	width = 800,
	height = 600
}

local PLAYER = {
	x = 500,
	y = 500,
	width = 40,
	height = 40
}

local LIMIT_AREA = {
	width = WINDOW_SETTINGS.width * 10,
	height = WINDOW_SETTINGS.height * 10
}

function love.load()
	BACKGROUND = love.graphics.newImage('assets/background.jpg')

	love.window.setMode(WINDOW_SETTINGS.width, WINDOW_SETTINGS.height, { resizable = true })

	camera = Camera(PLAYER.x, PLAYER.y)
end

function love.update(dt)
	local mousex, mousey = love.mouse.getPosition()

	local camerax, cameray = camera:cameraCoords(PLAYER.x, PLAYER.y)

	local x_distance = mousex - camerax
	local y_distance = mousey - cameray

	local speed = 0.05

	PLAYER.x = PLAYER.x + (x_distance * speed)
	PLAYER.y = PLAYER.y + (y_distance * speed)

	-- define the borders that cannot be passed
	if PLAYER.x >= LIMIT_AREA.width then
		PLAYER.x = LIMIT_AREA.width
	end

	if PLAYER.x <= 0 then
		PLAYER.x = 0
	end

	if PLAYER.y <= 0 then
		PLAYER.y = 0
	end

	if PLAYER.y >= LIMIT_AREA.height then
		PLAYER.y = LIMIT_AREA.height
	end

	camera:move((PLAYER.x - camera.x), (PLAYER.y - camera.y))
end

function love.draw()
	for i = 0, WINDOW_SETTINGS.width / BACKGROUND:getWidth() do
		love.graphics.setColor(255,255,255)
		for j = 0, WINDOW_SETTINGS.height / BACKGROUND:getHeight() do
			love.graphics.draw(BACKGROUND, i * BACKGROUND:getWidth(), j * BACKGROUND:getHeight())
		end
	end

	camera:attach()
	love.graphics.setColor(255,0,0)
	love.graphics.rectangle('line', 0 , 0, LIMIT_AREA.width, LIMIT_AREA.height)

	love.graphics.setColor(0,0,0)
	love.graphics.ellipse("fill", PLAYER.x, PLAYER.y, PLAYER.width, PLAYER.height)
	camera:detach()
end

function love.resize(width, height)
	WINDOW_SETTINGS.width = width
	WINDOW_SETTINGS.height = height
end

function love.wheelmoved(x,y)
	if y > 0 then
		camera:zoom(1.1)
	end
	if y < 0 then
		camera:zoom(0.9)
	end
end
