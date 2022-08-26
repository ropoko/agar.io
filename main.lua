local Camera = require('./lib/camera')

WINDOW_SETTINGS = {
	width = 800,
	height = 600
}

PLAYER = {
	x = 100,
	y = 100,
	width = 40,
	height = 40
}

function love.load()
	BACKGROUND = love.graphics.newImage('assets/background.jpg')

	love.window.setMode(WINDOW_SETTINGS.width, WINDOW_SETTINGS.height, { resizable = true })

	camera = Camera(PLAYER.x, PLAYER.y)
end

function love.update(dt)
	local mousex, mousey = love.mouse.getPosition()

	local x_distance = mousex - PLAYER.x
	local y_distance = mousey - PLAYER.y

	local speed = 0.05

	-- print(string.format("x_distance: %d; PLAYER.x: %d = %d", x_distance, PLAYER.x, PLAYER.x + (x_distance * speed)))

	print(string.format("mousex: %d - PLAYER.x: %d; = %d", mousex, PLAYER.x, x_distance))

	PLAYER.x = PLAYER.x + (x_distance * speed)
	PLAYER.y = PLAYER.y + (y_distance * speed)

	camera:move((PLAYER.x - camera.x), (PLAYER.y - camera.y))

	-- print(string.format("mousex: %d - PLAYER.x: %d; camerax: %d", mousex, PLAYER.x, camera.x))
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
	love.graphics.rectangle('line', 0 , 0, WINDOW_SETTINGS.width + 500, WINDOW_SETTINGS.height + 500)

	love.graphics.setColor(0,0,0)
	love.graphics.ellipse("fill", PLAYER.x, PLAYER.y, PLAYER.width, PLAYER.height)
	camera:detach()
end

function love.resize(width, height)
	print(width, height)
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
