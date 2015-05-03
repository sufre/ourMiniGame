import(".myDebug")
import(".RealGrid")
import(".VirtualGrid")

LogicMap = class("LogicMap")

function LogicMap:ctor(x, y, borderLen)
    self.x = x
    self.y = y
    self.b = borderLen

    self.map = {}
    self.vmap = {}
    for i = 1, self.x -1 do
        self.map[i] = {}
        self.vmap[i] = {}
        for j = 1, self.y - 1 do
            self.vmap[i][j] = nil
        end
    end
    self.map[self.x] = {}
    self.map[self.x][self.y] = nil


    local virtualGridWidth = 1.5 * self.b
    local virtualGridHeight = 1.732 * self.b
    local startPoint = cc.p(self.b, 0.5 * 1.732 * self.b)
    for j = 1, self.y -1 do
        for i = 1, self.x - 1 do
            self.vmap[i][j] = VirtualGrid.new(i, j, 
                startPoint.x, startPoint.y,
                virtualGridWidth, virtualGridHeight)
            startPoint = cc.pAdd(startPoint, cc.p(virtualGridWidth, 0))
        end
        startPoint = cc.pAdd(startPoint, cc.p(0, virtualGridHeight))
    end

    local point = cc.p(0, 0)
    for i = 1, self.x do
        for j = 1, self.y do
            if i % 2 == 0 then
                point = cc.p(self.b + (i - 1) * virtualGridWidth, 
                    1.732 * self.b + (j - 1) * virtualGridHeight)
            else
                point = cc.p(self.b + (i - 1) * virtualGridWidth, 
                    0.5 * 1.732 * self.b + (j - 1) * virtualGridHeight)
            end
            self.map[i][j] = RealGrid.new(i, j, point.x, point.y, self.b)
        end
    end
end

function LogicMap:getRealGrid(x, y)
    return self.map[x][y]
end

function LogicMap:getVirtualGrid(x, y)
    return self.vmap[x][y]
end

return LogicMap