Spike = {}
Spike.__index = Spike

Image.new("spike")

function Spike.new(data)
    local self = setmetatable({}, Spike)
    self.r = data.rotation
    self.ox = -math.sin(self.r)*TILE_SIZE/2
    self.oy = math.cos(self.r)*TILE_SIZE/2
    self.x = data.x-data.originX+self.ox
    self.y = data.y-data.originY+self.oy
    self.w = TILE_SIZE
    self.h = TILE_SIZE
    return self
end

function Spike:draw()
    love.graphics.draw(Image.spike, self.x-self.ox+TILE_SIZE/2, self.y-self.oy+TILE_SIZE/2, self.r, 1, 1, TILE_SIZE/2, TILE_SIZE/2)
    -- love.graphics.circle("fill", self.x+self.w/2, self.y+self.h/2, TILE_SIZE*0.3)
end

return Spike
