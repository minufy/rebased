return function (Scene)
    function Scene:update_objects(dt)
        for group_name, _ in pairs(self.objects) do
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

    ---@generic T
    ---@param o T
    ---@return T
    function Game:add(o)
        local group_name = tostring(o)
        if self.objects[group_name] == nil then
            self.objects[group_name] = {}
        end
        table.insert(self.objects[group_name], o)
        return o
    end
end
