local Utils = {}

--[[
	verify if obj1 has_collision with obj2
]]
function Utils.has_collision(x1, y1, w1, h1, x2, y2, w2, h2)
	return (
		x2 < x1 + w1 and
		x1 < x2 + w2 and
		y1 < y2 + h2 and
		y2 < y1 + h1
	)
end

--[[
	generates a random rgb color
]]
function Utils.random_color()
	return {
		r = love.math.random(0, 255) / 255,
		g = love.math.random(0, 255) / 255,
		b = love.math.random(0, 255) / 255
	}
end

return Utils
