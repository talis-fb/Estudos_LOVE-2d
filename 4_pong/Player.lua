
local Player = Class({})

function Player:init(options)
    self.x = options.x
    self.y = options.y
    self.width = options.width
    self.height = options.height
    self.score = 0
end

function Player:setPosition(x,y)
    self.x = x
    self.y = y
end

function Player:moveUp(d)
    local newPosition = self.y - d
    self.y = math.max( newPosition, 0 )
end

function Player:moveDown(d)
    local newPosition = self.y + d
    self.y = math.min( newPosition, love.graphics.getHeight() - self.height )
end

function Player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Player:scoreUp()
    self.score = self.score + 1
end



return Player
