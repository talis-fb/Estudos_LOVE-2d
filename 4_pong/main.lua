-- Necessario como depedencia para usar classes
Class = require("class")
Player = require"Player"
Ball = require"Ball"
math.randomseed(os.time())

-- ----------------
-- METHODS
-- ----------------

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

-- ----------------
-- Variaveis globais
-- ----------------
local player1
local player2
local ball
local state = 'START'

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
    ball:center()
end

function love.update(dt)

    if state == "START" then
        if isKeyDown('return') then
            ball:setRandomVelocity()
            state = "RUNNING"
        else
            return
        end
    end

    if ball:isWin() == 1 then
        player1.score = player1.score + 1
        state = "START"
        ball:center()
    elseif ball:isWin() == 2 then
        player2.score = player2.score + 1
        state = "START"
        ball:center()
    end

    if isKeyDown('q') then
        love.event.quit()
        return
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
        ball:move(dt)
    end

    ball:move(dt)

end

function love.draw()
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()


    love.graphics.setNewFont(80)
    love.graphics.print( player1.score, width/2 - 280, height/4 )
    love.graphics.print( player2.score, width/2 + 200, height/4 )

    love.graphics.setNewFont(20)

    if state == "START" then
        love.graphics.printf( 'Aperte ENTER para começar',               0 ,  height/2,        width  , "center"  )
        love.graphics.printf( 'Jogador da esquerda: W / S',              0 , (height/2) + 30,  width , "center"  )
        love.graphics.printf( 'Jogador da direita: ArrowUp / ArrowDown', 0 , (height/2) + 60, width , "center"  )
    end

    player1:draw()
    player2:draw()
    ball:draw()

    love.graphics.setNewFont(15)
    love.graphics.print( 'FPS: ' .. tostring(love.timer.getFPS()), 10, 10  )
end

function love.quit()
  print("Thanks for playing! Come back soon!")
end
