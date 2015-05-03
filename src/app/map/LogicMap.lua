import(".RealGrid")
import(".VirtualGrid")

LogicMap = class("LogicMap")

function LogicMap:ctor(x, y, borderLen)
    self.x = x
    self.y = y
    self.b = borderLen

    self.map = {}
    for i = 1, self.x do
        self.map[i] = {}
    end

    self.vmap = {}
    for i = 1, self.x -1 do
        self.vmap[i] = {}
    end

    local firstOddGrid = cc.p(math.ceil(self.b), 
        math.ceil(0.5 * 1.732 * self.b))
    local firstEvenGrid = cc.p(math.ceil(2.5 * self.b), 
        math.ceil(1.732 * self.b))

    if isDebug then
        print_r(firstOddGrid)
        print_r(firstEvenGrid)
    end
    
    local xOffset = math.floor(3 * self.b)
    local yOffset = math.floor(1.732 * self.b)

    if isDebug then
        print("xOffset: "..xOffset)
        print("yOffset: "..yOffset)
    end

    for j = 1, y do
        for i = 1, x do
            local pBaseGrid = nil
            if i % 2 == 0 then
                pBaseGrid = firstEvenGrid
            else
                pBaseGrid = firstOddGrid
            end
            pBaseGrid = cc.pAdd(pBaseGrid, 
                cc.p((math.ceil(i / 2) - 1) * xOffset, 
                    (j - 1) * yOffset))
            self.map[i][j] = RealGrid.new(i, j, pBaseGrid.x, pBaseGrid.y, self.b)
        end
    end

    -- local virtualGridWidth = 1.5 * self.b
    -- local virtualGridHeight = 1.732 * self.b
    -- local startPoint = cc.p(self.b, 0.5 * 1.732 * self.b)
    -- for j = 1, self.y -1 do
    --     for i = 1, self.x - 1 do
    --         self.vmap[i][j] = VirtualGrid.new(i, j, 
    --             startPoint.x, startPoint.y,
    --             virtualGridWidth, virtualGridHeight)
    --         startPoint = cc.pAdd(startPoint, cc.p(virtualGridWidth, 0))
    --     end
    --     startPoint = cc.pAdd(startPoint, cc.p(0, virtualGridHeight))
    -- end
end

function LogicMap:getRealGrid(x, y)
    return self.map[x][y]
end

function LogicMap:getVirtualGrid(x, y)
    return self.vmap[x][y]
end

return LogicMap