

function love.load()
  require("src/initGame")
  initGame()
  local gameObject = require("src/entitys/gameObject")
  player = gameObject(widthScreen/2, heightScreen/2)
 joyStick = gooi.newJoy({size = 120, x = widthScreen/2 - 120/2, y = (heightScreen * 0.8) - 120/2}):setStyle({showBorder = false})
  gooi.newButton({text = "debug", x = 110, y = 0, w = 180, h = 22})
      :onRelease(function()
        debug = not debug
        end)
  gooi.newButton({text = "static cam 0,0", x = 110, y = 30, w = 180, h = 22})
        :onRelease(function()
          cam:staticEvent(0, 0)
        end)
  gooi.newButton({text = "folllow player", x = 110, y = 60, w = 180, h = 22})
        :onRelease(function()
         cam:followEvent(player)
        end)
  gooi.newButton({text = "show 0,0", x = 110, y = 90, w = 180, h = 22})
          :onRelease(function()
           cam:showEvent(player.x, player.y, 0,0, 3)
            end)
  cam:followEvent(player)
end

function love.draw()
  
  cam:attach()
  love.graphics.circle("line", 0, 0, 10)
  love.graphics.circle("line", 0, 50, 50)
  love.graphics.circle("line", 0, 150, 100)
  player:draw()
  cam:detach()
  
  gooi.draw()
  
  if(debug) then
  local fpsText = "FPS: "..tostring(love.timer.getFPS())
  love.graphics.print(fpsText, 0, 0)
  end
end

function love.update(dt)
  gooi.update(dt)
  player:update(dt)
  
  player.x = (player.x + joyStick:xValue() * dt * 150)
  player.y = (player.y + joyStick:yValue() * dt * 150)
  
  cam:update(dt)
end


function love.mousereleased(x, y, button) gooi.released() end
function love.mousepressed(x, y, button)  gooi.pressed() end

function love.textinput(text)
  gooi.textinput(text)
end

function love.keypressed(key, scancode, isrepeat)
  gooi.keypressed(key, scancode, isrepeat)
  if(key == "escape")then
    love.event.quit()
  end
end

function love.keyreleased(key, scancode) gooi.keyreleased(key, scancode) end

function love.touchpressed(id, x, y)  gooi.pressed(id, x, y) end
function love.touchmoved(id, x, y)    gooi.moved(id, x, y) end
function love.touchreleased(id, x, y) gooi.released(id, x, y) end
