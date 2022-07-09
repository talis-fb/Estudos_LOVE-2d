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

function Ball:setRandomVelocity()
    local newVeloY = math.random(-1,1) * 100

    -- Gera um numero possivel 1-250 positivo, se for maior ele pega o negativo da direferça disso com 500
    --  Ou seja, temos o intervalo de 0 a 250 se n for menor q 250
    --  e o intervalo -1 a -250 se for n for maior que 250
    local newVeloX = math.random(1,500)
    if newVeloX > 250 then
        newVeloX = (newVeloX - 250) * (-1)
    end

    self.velocityX = newVeloX
    self.velocityY = newVeloY
end

function Ball:increaseVelocity(x,y)
    if self.velocityX < 0 then
        self.velocityX = self.velocityX - x
    else
        self.velocityX = self.velocityX + x
    end

    if self.velocityY < 0 then
        self.velocityY = self.velocityY - y
    else
        self.velocityY = self.velocityY + y
    end
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
    love.graphics.circle("fill", self.x, self.y, self.width)
end


return Ball
