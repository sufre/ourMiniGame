
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    local back = display.newSprite("back.png")
    back:pos(display.cx, display.cy)
    back:addTo(self)

    -- local grid = display.newSprite("grid.png")
    -- grid:setPosition(40, 34.1)
    -- grid:addTo(self)
    -- local grid2 = display.newSprite("grid.png")
    -- grid2:setPosition(40, 103.2)
    -- grid2:addTo(self)
    -- local grid3 = display.newSprite("grid.png")
    -- grid3:setPosition(40, 173.1)
    -- grid3:addTo(self)

    local x = 10
    local y = 10
    map = LogicMap.new(x, y, 40)
    for i = 1, x do
        for j = 1, y do
            local realGird = map:getRealGrid(i, j)
            local grid = display.newSprite("grid.png")
            grid:setPosition(realGird.sx, realGird.sy)
            print("grid: " .. i .. "," .. j .. ":" .. grid:getPositionX() .. "," .. grid:getPositionY())
            grid:addTo(self)
        end
    end
end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
