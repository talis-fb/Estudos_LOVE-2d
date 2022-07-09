local Body = Class({})

function Body:init(options)
    self.x = options.x
    self.y = options.y
    self.width = options.width
    self.height = options.height
end

function Body:centeredPositionInScreen()
    self.x = (love.graphics.getWidth() / 2) - (self.width / 2)
    self.y = (love.graphics.getHeight() / 2) - (self.height / 2)
end

function Body:setPosition(x,y)
    self.x = x
    self.y = y
end

function Body:getPosition()
    return self.x, self.y
end

function Body:draw()
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

return Body
