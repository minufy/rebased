Game = {}
local GameBase = require("rebase.game_base")
GameBase(Game)

function Game:init()
    self.objects = {}
    self.current_level = "1"
    Level:init()
    Level:load_level(self.current_level)
end

function Game:update(dt)
    if CONSOLE and Input.refresh.pressed then
        self.objects = {}
        Level:refresh()
        Level:load_level(self.current_level)
    end

    Camera:update(dt)

    self.group_names = {}
    for group_name, _ in pairs(self.objects) do
        table.insert(self.group_names, group_name)
    end
    for _, group_name in ipairs(self.group_names) do
        local i = #self.objects[group_name]
        while i > 0 do
            local object = self.objects[group_name][i]
            if object.update then
                object:update(dt)
            end
            if object.remove then
                self.objects[group_name][i] = self.objects[group_name][#self.objects[group_name]]
                self.objects[group_name][#self.objects[group_name]] = nil
            end
            i = i-1
        end
    end
end

function Game:draw()
    love.graphics.setColor(rgb(49, 77, 121))
    love.graphics.rectangle("fill", 0, 0, Res.w, Res.h)
    Color.reset()
    
    Camera:start()
    -- Outline:start()
    
    for group_name, group in pairs(self.objects) do
        for _, object in ipairs(group) do
            if object.draw then
                object:draw()
            end
        end
    end

    Camera:stop()
    -- Outline:stop()
end

return Game