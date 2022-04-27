local Object = require("libs/classic")

local ObjectGame = Object:extend()

function ObjectGame:new(x, y)
  self.x = x
  self.y = y
  self.removeObject = false
end

function ObjectGame:draw()
  love.graphics.circle("fill", self.x, self.y, 50)
end

function ObjectGame:update(dt)
  
end

function ObjectGame:remove()
  self.removeObject = true
end

function ObjectGame:getPosition()
  return self.x, self.y
end

return ObjectGame
