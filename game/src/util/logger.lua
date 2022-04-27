--my own logger on love mobile because not sopport print 
logger = {}
logger.LoggerNameFile = "log_game.txt"

function logger:clear()
  love.filesystem.write(logger.LoggerNameFile, "-- Logger Game --")
end

function logger:err(txt)
  self:print("\n[E]: " .. txt)
end

function logger:warn(txt)
  self:print("\n[W]: " .. txt)
end

function logger:info(txt)
  self:print("\n[I]: " .. txt)
end

function logger:print(txt)
  love.filesystem.append(logger.LoggerNameFile, txt)
end
