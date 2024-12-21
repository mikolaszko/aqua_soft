local Money = {}
Money.__index = Money

function Money:new()
	local money = {}
	money.amount = 5
	money.img = love.graphics.newImage("assets/dollar.png")
	local font = love.graphics.getFont()
	money.label = love.graphics.newText(font, self.amount)
	setmetatable(money, Money)
	return money
end

function Money:draw()
	love.graphics.draw(self.img, Width - 100, 30)
	love.graphics.print(math.floor(self.amount), Width - 50, 30, 0, 3, 3)
end

function Money:update(dt)
	self.amount = self.amount + dt / 10
	print(self.amount)
end

return Money