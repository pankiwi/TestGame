--module
function cloneObject(obj)
  local clone = {}
  setmetatable(clone, obj)
  obj.__index = obj
  return clone
end

function toRadians(number)
  return number * math.pi/180
end

function toDegree(number)
  return number * 180/math.pi
end

function randomSelection(any, any2, change)
  if(math.random() < change)then
    return any
  else
    return any2
  end
 end

function calculatedScale(width, height)
  local scale_x = love.graphics.getWidth()  / width
  local scale_y = love.graphics.getHeight() / height
  return math.min(scale_x, scale_y)
end

function dst(x1, y1, x2, y2)
  return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end
