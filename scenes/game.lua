Game = {}

require("scenes.base.draw")(Game)
require("scenes.base.physics")(Game)
require("scenes.base.update")(Game)

function Game:init(level)
    self.current_level = level or 1
    Level:init()
    self:reset()
end

function Game:reset()
    Timer(self)
    self.objects = {}
    Level:load_level(tostring(self.current_level), self)
    self.level_h = self.objects.tiles[1].cells_y*TILE_SIZE
end

function Game:update(dt)
    if CONSOLE and Input.refresh.pressed then
        Level:refresh()
        self:reset()
    end

    Camera:update(dt)
    self:update_timers(dt)
    self:update_objects(dt)
end

function Game:draw()
    love.graphics.setColor(COLORS.bg)
    love.graphics.rectangle("fill", 0, 0, Res.w, Res.h)
    Color.reset()

    Shaders.shadow:start()
    Camera:start()

    self:draw_objects()

    Camera:stop()
    Shaders.shadow:stop()
end

return Game
