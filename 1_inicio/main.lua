-- Ordem de execução do LOVE 2d
-- ==> love.load -> love.update -> love.draw -> love.update -> love.draw -> love.update, etc.

local x = 0;
local y = 0;

function love.load()
    x = 0;
    print("jogo iniciado...")
    local passos = {"love.load",  "love.update", "love.draw"};
    table.insert(passos, "Loop eterno...");

    for i=1,#passos do
        print(i .. ") " .. passos[i])
    end
end

 -- Loop eterno
function love.update(dt)
    local hasPressed = function(key)
        return love.keyboard.isDown(key)
    end

    if hasPressed("d") then
        x = x + 5;
    elseif hasPressed("s") then
        y = y + 5
    elseif hasPressed("w") then
        y = y - 5
    elseif hasPressed("a") then
        x = x - 5;
    end
end

function love.draw()
    love.graphics.print("Hello World", 400, 300)
    love.graphics.print("Aperte: ", 400, 320)
    love.graphics.print(" w / a / s / d", 400, 340)
    love.graphics.circle("line", x, y, 100)
end
---------------

