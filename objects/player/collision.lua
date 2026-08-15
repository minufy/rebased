return function (Player)
    function Player:init_collision()
    end
    
    function Player:update_collision(dt)
        
    end
    
    function Player:die()
        for _ = 0, 4 do
            Game:add(Particle, self.x+self.w/2, self.y+self.h/2, math.random(-10, 10), math.random(-10, 10), math.random(6, 12))
        end
        self.remove = true
        Camera:shake(3)
        -- PlayAudio("die")
    end
end