
VirtualGrid = class("VirtualGrid")

function VirtualGrid:ctor(x, y, sx, sy, width, height)
    -- x, y is the logic position of virtual grid
    self.x = x
    self.y = y
    self.isOddOrEven = true
    if self.y % 2 == 0 then
        self.isOddOrEven = false
    end

    -- sx, sy is the screen position of virtual grid
    self.sx = sx
    self.sy = sy

    -- width, height is the grid size in screen scale
    self.width = width
    self.height = height

    -- real grid center point sx, sy, each virtual grid has 3 points
    self.realGridCenterPoints = {}
    if self.isOddOrEven then
        self.realGridCenterPoints[1] = cc.p(sx, sy)
        self.realGridCenterPoints[2] = cc.p(sx + self.width, sy + 0.5 * self.height)
        self.realGridCenterPoints[3] = cc.p(sx, sy + self.height)
    else
        self.realGridCenterPoints[1] = cc.p(sx, sy + 0.5 * self.height)
        self.realGridCenterPoints[2] = cc.p(sx + self.width, sy)
        self.realGridCenterPoints[3] = cc.p(sx + self.width, sy + self.height)
    end
end

function VirtualGrid:getRealGridPoint(i)
    return self.realGridCenterPoints[i]
end

return VirtualGrid