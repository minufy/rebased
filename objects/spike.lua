Spike = {}
Spike.__index = Spike

Image.new("spike")

function Spike.new(data)
    local self = setmetatable({}, Spike)
    self.x = data.x-data.originX
    self.y = data.y-data.originY
    self.w = TILE_SIZE
    self.h = TILE_SIZE
    self.r = data.rotation
    return self
end

function Spike:draw()
    love.graphics.draw(Image.spike, self.x+self.w/2, self.y+self.h/2, self.r, 1, 1, self.w/2, self.h/2)
end

return Spike
