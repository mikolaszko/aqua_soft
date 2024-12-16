local width = love.graphics.getDimensions()

function love.load()
	love.window.setFullscreen(true)
	FISH = require("src.fish")
	AQUARIUM = require("src.aquarium")
	FILTH = require("src.filth")
	PLANT = require("src.plant")
	MONEY = require("src.money")
	SIDEMENU = require("src.sidemenu")
	love.graphics.setBackgroundColor(122 / 255, 122 / 255, 255 / 255)
	FISHES = {}
	PLANTS = {}

	aquarium = AQUARIUM:new(0.4, 0.4)
	money = MONEY:new()
	sidemenu = SIDEMENU:new()
end

function love.draw()
	for _, v in ipairs(FISHES) do
		v:draw()
	end
	for _, v in ipairs(PLANTS) do
		v:draw()
	end
	money:draw()
	aquarium:draw()
	sidemenu:draw()
end

function love.update(dt)
	aquarium:update(dt)
	money:update(dt)
	for _, v in ipairs(FISHES) do
		v:update(dt)
	end
end

local function checkHitbox(x, y, button_x1, button_x2, button_y1, button_y2)
	return x > button_x1 and x < button_x2 and y > button_y1 and y < button_y2
end

function love.mousereleased(x, y)
	print(width - width * 0.1, x)
	if checkHitbox(x, y, width - width * 0.2, width + 60, 50, 110) then
		sidemenu:close_menu()
	end

	if checkHitbox(x, y, width - width * 0.1, width + 60, 50, 110) and money.amount > 5 then
		money.amount = money.amount - 5
		table.insert(FISHES, FISH:new("assets/fish1.png", 40))
	end
end
