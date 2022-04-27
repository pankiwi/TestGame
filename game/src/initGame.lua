function initGame()
  --globals
  debug = false
  widthScreen, heightScreen = love.graphics.getDimensions()
  --filters
  love.graphics.setBackgroundColor(105/255, 208/255, 238/255)
  love.graphics.setDefaultFilter("nearest", "nearest")
  
  require("src/requireScripts")
  requireScripts()
  
  logger:clear()
  
  local infoGame = require("/src/infoGame")
  
  logger:info(infoGame.name)
  logger:info(infoGame.name .. " version: " .. infoGame.version)
end
