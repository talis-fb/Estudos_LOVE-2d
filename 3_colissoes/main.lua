-- Necessario como depedencia para usar classes
require"color"
Class = require("class")
Body = require"Body"

local retangulo1 = Body({ x = 5, y=6, width=50, height =80 })
local retangulo2 = Body({ x = 90, y=100, width=200, height =200 })

-- AABB Collision Algorithm
local isCollision = function(body1, body2)
    return 
    body1.x < (body2.x + body2.width) and
    body1.y < (body2.y + body2.height) and
    body2.x < (body1.x + body1.width) and
    body2.y < (body1.y + body1.height)
end

-- LOVE...
function love.load()
    retangulo2:centeredPositionInScreen()
end

function love.update(dt)
    if love.keyboard.isDown('q') then
        love.event.quit()
    end

    local mouseX,mouseY = love.mouse.getPosition()
    retangulo1:setPosition(mouseX,mouseY)

end

function love.draw()
    love.graphics.setLineStyle('rough')
    love.graphics.setColor(hex(50,50,50))

    -- Linhas guias retangulo1
    love.graphics.line(retangulo1.x, 0, retangulo1.x, love.graphics.getHeight())
    love.graphics.line(0, retangulo1.y, love.graphics.getHeight(), retangulo1.y )
    love.graphics.line(retangulo1.x + retangulo1.width, 0, retangulo1.x + retangulo1.width, love.graphics.getHeight())
    love.graphics.line(0, retangulo1.y + retangulo1.height, love.graphics.getHeight(), retangulo1.y + retangulo1.height )

    -- Linhas guias retangulo2
    love.graphics.line(retangulo2.x, 0, retangulo2.x, love.graphics.getHeight())
    love.graphics.line(0, retangulo2.y, love.graphics.getHeight(), retangulo2.y )
    love.graphics.line(retangulo2.x + retangulo2.width, 0, retangulo2.x + retangulo2.width, love.graphics.getHeight())
    love.graphics.line(0, retangulo2.y + retangulo2.height, love.graphics.getHeight(), retangulo2.y + retangulo2.height )

    -- Retangulos
    local color = isCollision(retangulo1,retangulo2) and hex(255,23,68) or hex(118,255,3)
    love.graphics.setColor(color)
    retangulo1:draw()
    retangulo2:draw()

end

function love.quit()
  print("Thanks for playing! Come back soon!")
end
