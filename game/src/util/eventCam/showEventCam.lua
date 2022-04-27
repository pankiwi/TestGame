local eventCam = require("src/util/eventCam/eventCam")
local vectorCam = require("src/util/eventCam/vectorCam")

local floor = math.floor

local showEventCam = eventCam:extend()

function showEventCam:new(originX, originY, toX, toY, time, speedCam)
  eventCam.super.new(self)
  self.vectors = {vectorCam(toX, toY), vectorCam(originX, originY)}
  self.time = time
  self.timer = self.time
  self.speedCam = speedCam or 2
  self.indexVector = 1
end

function showEventCam:update(cam, dt)
  if(self.indexVector < #self.vectors)then
    local camx, camy = cam:position()
    local x, y = self.vectors[self.indexVector]:getPosition()
    local dx, dy = (x - camx), (y - camy)
    
    if(floor(cam.x) ~= floor(x) and floor(cam.y) ~= floor(y))then
      cam:move(dx/2 * self.speedCam * dt, dy/2 * self.speedCam * dt)
    else
      self.timer = self.timer - 1 * dt
      
      if(self.timer < 0)then
        self.timer = self.time
        self.indexVector = self.indexVector + 1
      end
    end
  else
    self.endEvent = true
  end
end

return showEventCam
