local eventCam = require("src/util/eventCam/eventCam")
local followEventCam = require("src/util/eventCam/followEventCam")
local staticEventCam = require("src/util/eventCam/staticEventCam")
local showEventCam = require("src/util/eventCam/showEventCam")

local Camera = require("libs/hump/camera")

cam = Camera(0, 0, calculatedScale(500, 500))

cam.eventCam = nil
cam.temporalEventCam = nil

function cam:update(dt)
  if(self.temporalEventCam ~= nil and not self.temporalEventCam:isEnd())then
    self.temporalEventCam:update(self, dt)
    logger:info("update temp event")
  elseif(self.eventCam ~= nil and not self.eventCam:isEnd())then
    self.eventCam:update(self, dt)
  end
end

function cam:setEventCam(event)
  if(event ~= nil and event:is(eventCam))then
    self.eventCam = event
  else
    logger:err("camera- entry is not eventCam")
  end
end

function cam:setTemporalEventCam(event)
  logger:info("new event temp" .. tostring(event))
  logger:info("event is nil: " .. tostring(event == nil))
  if(event ~= nil and event:is(eventCam))then
      self.temporalEventCam = event
    else
      logger:err("camera- entry is not eventCam")
    end
end

function cam:followEvent(gameObject)
  self:setEventCam(followEventCam(gameObject, 20))
end

function cam:staticEvent(x, y)
  self:setEventCam(staticEventCam(x, y))
end

function cam:showEvent(x1, y1, x2, y2, timeShow)
  self:setTemporalEventCam(showEventCam(x1, y1, x2, y2, timeShow))
end
