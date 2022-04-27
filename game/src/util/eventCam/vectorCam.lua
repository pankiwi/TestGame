local Object = require("libs/classic")

local vectorCam = Object:extend()

function vectorCam:new(x, y)
  self.x = x
  self.y = y
end

function vectorCam:getPosition()
  return self.x, self.y
end

return vectorCam
