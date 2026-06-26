local Tiles = Object:extend()
SetType(Tiles, "tiles")

function Tiles:new(data)
    self.tiles = data.data
    self.cells_x = data.gridCellsX
    self.cells_y = data.gridCellsY
    self.around_offsets = {
        -1,
        1,
        -self.cells_x,
        self.cells_x,
    }
end

function Tiles:around(x, y)
    local i = x+y*self.cells_x
    local found = {}
    for _, o in ipairs(self.around_offsets) do
        local j = i+o
        if 1 <= j and j <= #self.tiles then
            if self.tiles[j] ~= -1 then
                local ax = j%self.cells_x
                local ay = math.floor(j/self.cells_x)
                table.insert(found, {x = ax*TILE_SIZE, y = ay*TILE_SIZE, w = TILE_SIZE, h = TILE_SIZE})     
            end
        end
    end
    return found
end

function Tiles:draw()
    for i, tile in ipairs(self.tiles) do
        if tile ~= -1 then
            local x = i%self.cells_x
            local y = math.floor(i/self.cells_x)
            love.graphics.draw(Image[TILE_NAMES[tile+1]], x*TILE_SIZE, y*TILE_SIZE)
        end
    end
end

return Tiles