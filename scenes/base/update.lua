return function (Scene)
    function Scene:update_objects(dt)
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
end