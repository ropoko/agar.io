WINDOW_SETTINGS = {
	width = 800,
	height = 600
}

function love.load()
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

	PLAYER.x = PLAYER.x + (x_distance * 0.05)
	PLAYER.y = PLAYER.y + (y_distance * 0.05)
end

function love.draw()
	for i = 0, love.graphics.getWidth() / BACKGROUND:getWidth() do
		love.graphics.setColor(255,255,255)
		for j = 0, love.graphics.getHeight() / BACKGROUND:getHeight() do
				love.graphics.draw(BACKGROUND, i * BACKGROUND:getWidth(), j * BACKGROUND:getHeight())
		end
	end

	love.graphics.setColor(0,0,0)
	love.graphics.ellipse("fill", PLAYER.x, PLAYER.y, PLAYER.width, PLAYER.height)
end

function love.resize(width, height)
	WINDOW_SETTINGS.width = width
	WINDOW_SETTINGS.height = height
end
