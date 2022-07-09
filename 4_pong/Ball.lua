local Ball = Class({})

function Ball:init(options)
    self.x = options.x
    self.y = options.y
    self.width = options.width
    self.height = options.height

    self.direction = nil
    self.velocityX = 0
    self.velocityY = 0
end

function Ball:setPosition(x,y)
    self.x = x
    self.y = y
end

-- function Ball:setDirection(direction)
--     -- true -> RIGHT || false -> LEFT
--     self.direction = (direction == true)
-- end

function Ball:setRandomVelocity(direction)
    self.velocityX = math.random(-1,1) * 200 + 500
    self.velocityY = math.random(-1,1) * 200 + 500
end

function Ball:changeDirectionX()
    self.velocityX = -self.velocityX
end

function Ball:changeDirectionY()
    self.velocityY = -self.velocityY
end

function Ball:move(dt)
    self.x = self.x + self.velocityX *  dt
    self.y = self.y + self.velocityY *  dt
end

function Ball:isOutScreen()
    return self.y < 0 or self.y > (love.graphics.getHeight() - self.width)
end

function Ball:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end


return Ball
