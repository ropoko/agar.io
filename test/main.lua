
local x = 0;
local y = 0;

local x2 = 500;
local y2 = 500;

local size = 15;

local food = {};
food.count = 500;
food.alive = 0;
food.size = 2;
food.pos = {}

local speed = 20

local lx, ly = 0, 0

local screen = {}
screen.x = 0
screen.y = 0

function love.load()
	BACKGROUND = love.graphics.newImage('background.jpg')
	love.window.setMode(1000, 1000);
end

function love.update()
	lx, ly = love.mouse.getPosition()

	if ( lx > 550 ) then
		local dist = lx - 500
		if ( dist > 400 ) then dist = 400 end
		screen.x = (dist*speed)/400
		if ( x <= -4500000 ) then screen.x = 0 end
	else
		local dist = 500 - lx
		if ( dist > 400 ) then dist = 400 end
		screen.x = -(dist*speed)/400
		if ( x >= 5500000 ) then screen.x = 0 end
	end

	if ( ly > 550 ) then
		local dist = ly - 500
		if ( dist > 400 ) then dist = 400 end
		screen.y = (dist*speed)/400
		if ( y <= -4500000 ) then screen.y = 0 end
	else
		local dist = 500-ly
		if ( dist > 400 ) then dist = 400 end
		screen.y = -(dist*speed)/400
		if ( y >= 5500000 ) then screen.y = 0 end
	end

	if ( food.alive <= food.count ) then
		for i = 1, food.count - food.alive do
			if ( x < 5500000 and y < 5500000 or x > -4500000 and y > -4500000 ) then
				food.alive = food.alive + 1;
				local x = love.math.random(-5000, 5000)
				local y = love.math.random(-5000, 5000)
				local tbl = { x = x, y = y, r =  love.math.random( 1, 255 ), g =  love.math.random( 1, 255 ), b =  love.math.random( 1, 255 ), xOrg = x, yOrg = y }
				table.insert( food.pos, tbl )
			end
		end
	end

	for k, v in pairs( food.pos ) do
		v.x = v.x - screen.x
		v.y = v.y - screen.y

		x = x - screen.x
		y = y - screen.y
	end

	for k, v in pairs( food.pos ) do
		local c = math.sqrt( (v.x - x2 )^2 + (v.y - y2)^2 )
		if ( c < size + 10 ) then
			size = size + 1
			food.alive = food.alive - 1
			table.remove( food.pos, k )
		end
	end
end

function love.draw()
	for i = 0, love.graphics.getWidth() / BACKGROUND:getWidth() do
		love.graphics.setColor(255,255,255)
		for j = 0, love.graphics.getHeight() / BACKGROUND:getHeight() do
			love.graphics.draw(BACKGROUND, i * BACKGROUND:getWidth(), j * BACKGROUND:getHeight())
		end
	end

	for k, v in pairs( food.pos ) do
		love.graphics.setColor(0, 0, 0);
		love.graphics.circle( "fill",v.x,v.y, 10, 10);
	end

	-- love.graphics.setColor( 150,150,150,150 );
	-- love.graphics.circle( "fill",x2,y2, size*1.1, size*1.1);

	love.graphics.setColor( 150,0,0,255 );
	love.graphics.circle( "fill",x2,y2, size, size);
end
