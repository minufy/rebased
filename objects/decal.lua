local Decal = Object:extend()
SetType(Decal, "decal")

function Decal:new(data)
    self.type = data.type
    self.x = data.x
    self.y = data.y
    self.r = data.r
    self.w = Image[data.type]:getWidth()
    self.h = Image[data.type]:getHeight()
end

function Decal:draw()
    love.graphics.draw(Image[self.type], self.x, self.y, self.r)
end

return Decal