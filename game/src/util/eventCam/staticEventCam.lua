local eventCam = require("src/util/eventCam/eventCam")

local staticEventCam = eventCam:extend()

local floor = math.floor

function staticEventCam:new(x, y, speedCam)
  eventCam.super.new(self)
  self.x = x
  self.y = y
  self.speedCam = speedCam or 2
end

function staticEventCam:update(cam, dt)
  if(floor(cam.x) ~= floor(self.x) and floor(cam.y) ~= floor(self.y))then
    local camx, camy = cam:position()
    local dx, dy = (self.x - camx), (self.y - camy)
    cam:move(dx/2 * self.speedCam * dt,dy/2 * self.speedCam * dt)
    else
      self.endEvent = true
      logger:info("end event static cam" .. tostring(self.endEvent))
  end
  
  logger:info("static cam proggres cam x: " .. tostring(floor(cam.x)).. " y: " .. tostring(floor(cam.y)) .. " self x:" .. tostring(floor(self.x)).. " y: " .. tostring(floor(self.y))) 
end

return staticEventCam
