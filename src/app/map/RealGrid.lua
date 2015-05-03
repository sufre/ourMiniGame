
RealGrid = class("RealGrid")

function RealGrid:ctor(x, y, sx, sy, borderLen)
    -- x, y is the logic position of grid
    self.x = x
    self.y = y
    if self.y % 2 == 0 then
    self.isOddOrEven = true
        self.isOddOrEven = false
    end

    -- sx, sy is the screen position of grid center
    self.sx = sx
    self.sy = sy

    -- borderLen
    self.b = borderLen
end

return RealGrid