local draw_order = {
    "tiles",
    "decal",
    "particle",
    "spark_particle",
    "player",
    "spike",
}

return function (Scene)
    function Scene:draw_objects()
        local tiles = self.objects["tiles"][1]
        for _, group_name in ipairs(draw_order) do
            local objects = self.objects[group_name]
            if group_name == "tiles" then
                tiles:draw(true)
            elseif objects ~= nil then
                for _, object in ipairs(objects) do
                    local x, y, w, h = object.x, object.y, object.w, object.h
                    if object.cam_x then x = object.cam_x end
                    if object.cam_y then y = object.cam_y end
                    if object.cam_w then w = object.cam_w end
                    if object.cam_h then h = object.cam_h end
                    if object.draw then
                        if Camera:check_vis(x, y, w, h) then
	                        object:draw()
                        end
                    end
                end
            end
        end
    end
end
