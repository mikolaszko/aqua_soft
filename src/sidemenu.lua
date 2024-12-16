local Sidemenu = {}
Sidemenu.__index = Sidemenu

local width, height = love.graphics.getDimensions()

local button = require("src.ui.button")
function Sidemenu:new()
	local sidemenu = {}
	sidemenu.open = true

	fish_button = button:new(width - width * 0.1, 50, "assets/fish1.png")
	close_button = button:new(width - width * 0.2, 50, "assets/icon_close.png")

	setmetatable(sidemenu, Sidemenu)
	return sidemenu
end

function Sidemenu:draw()
	if self.open then
		love.graphics.setColor(0, 0, 0)
		love.graphics.rectangle("fill", width - width * 0.2, 0, width * 0.2, height)
		love.graphics.setColor(1, 1, 1)
		fish_button:draw()
		close_button:draw()
	end
end

function Sidemenu:update() end

function Sidemenu:close_menu()
	self.open = false
end

return Sidemenu
