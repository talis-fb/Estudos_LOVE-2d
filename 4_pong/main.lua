-- Necessario como depedencia para usar classes
-- require("color")
Class = require("class")

Player = require"Player"
Ball = require"Ball"

math.randomseed(os.time())

-- AABB Collision Algorithm
local isCollision = function(body1, body2)
    return
        body1.x < (body2.x + body2.width) and
        body1.y < (body2.y + body2.height) and
        body2.x < (body1.x + body1.width) and
        body2.y < (body1.y + body1.height)
end

function isKeyDown(key)
    return love.keyboard.isDown(key)
end

local player1
local player2
local ball

-- LOVE...
function love.load()
    love.graphics.setBackgroundColor(0,0,0)
    love.window.setTitle("PONG")
    love.window.setMode(1280, 720, {
            centered = true,
            fullscreen = false,
            resizable = false,
            vsync = true
        })

    local middleScreenX = love.graphics.getWidth() / 2
    local middleScreenY = love.graphics.getHeight() / 2

    local playerHeight = 150
    local playerWidth = 30

    local ballWidth = 10
    local ballHeight = 10

    player1 = Player({
        x = 10,
        y = middleScreenY,
        height = playerHeight,
        width = playerWidth
    })

    player2 = Player({
        x = love.graphics.getWidth() - playerWidth - 10 ,
        y = middleScreenY,
        height = playerHeight,
        width = playerWidth
    })

    ball = Ball({
        x = middleScreenX,
        y = middleScreenY,
        height = ballHeight,
        width = ballWidth
    })

    ball:setRandomVelocity()
end

function love.update(dt)
    if isKeyDown('q') then
        love.event.quit()
    end

    if isKeyDown('w') then
        player1:moveUp(700 * dt)
    elseif isKeyDown('s') then
        player1:moveDown(700 * dt)
    end

    if isKeyDown('up') then
        player2:moveUp(700 * dt)
    elseif isKeyDown('down') then
        player2:moveDown(700 * dt)
    end

    if isCollision(player1, ball) or isCollision(player2,ball) then
        ball:increaseVelocity(75,75)
        ball:changeDirectionX()
    end

    if ball:isOutScreen() then
        ball:changeDirectionY()
    end

    ball:move(dt)
end

function love.draw()
    -- local color = isCollision(retangulo1,retangulo2) and hex(255,23,68) or hex(118,255,3)
    -- love.graphics.setColor(color)
    player1:draw()
    player2:draw()
    ball:draw()
    love.graphics.print( 'FPS: ' .. tostring(love.timer.getFPS()), 10, 10  )
end

function love.quit()
  print("Thanks for playing! Come back soon!")
end
