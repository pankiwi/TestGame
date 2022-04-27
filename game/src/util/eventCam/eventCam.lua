local Object = require("libs/classic")

local eventCam = Object:extend()


function eventCam:new()
  self.endEvent = false
end

function eventCam:update(cam, dt)
end

function eventCam:isEnd()
  return self.endEvent
end

return eventCam