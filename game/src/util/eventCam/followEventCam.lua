local eventCam = require("src/util/eventCam/eventCam")
local gameObject = require("src/entitys/gameObject")

local floor = math.floor

local followEventCam = eventCam:extend()

function followEventCam:new(follow, offent, speedCam)
  eventCam.super.new(self)
  self.follow = follow
  self.offent = offent or 10
  self.speedCam = speedCam or 2
end

function followEventCam:update(cam, dt)
  if(self.follow ~= nil and self.follow:is(gameObject))then
    local camx, camy = cam:position()
    local x, y = self.follow:getPosition()
    local dx, dy = (x - camx), (y - camy)
        
    if(dst(camx, camy, x, y) > self.offent) then
      cam:move(dx/2 * self.speedCam * dt, dy/2 * self.speedCam * dt)
    end
  end
end

return followEventCam
