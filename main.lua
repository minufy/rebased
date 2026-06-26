Object = require("modules.classic")

-- load rebase modules
require("rebase.audio")
require("rebase.camera")
require("rebase.image")
require("rebase.input")
require("rebase.level")
require("rebase.log")
require("rebase.physics")
require("rebase.res")
require("rebase.shader")
require("rebase.timer")
require("rebase.utils")

require("scenes.sm")
require("settings")
Particle = require("objects.particle")

function love.load()
    LogFont = love.graphics.newFont(20)
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.graphics.setLineStyle("rough")
    Font = love.graphics.newFont("assets/fonts/Galmuri9.ttf", 10)

    Outline:init(1)
    Res:init()
    SM:load("game")
end

function love.update(dt)
    dt = math.min(dt*60, 1.5)
    Input:update()
    SM:update(dt)
    Input:reset_wheel()
    Log:update(dt)
    Audio:update()
end

local prev = 0
function love.draw()
    Res:before()
    SM:draw()
    Res:after()
    Log:draw()
    if CONSOLE then
        love.graphics.print(tostring(love.timer.getFPS()))
        local mem = collectgarbage("count")
        local delta = mem-prev
        prev = mem
        love.graphics.print(string.format("Mem: %.1f KB | d %.1f", mem, delta), 0, LogFont:getHeight())
    end
end

function love.wheelmoved(dx, dy)
    Input:wheelmoved(dx, dy)
end

function love.resize(w, h)
    Res:resize(w, h)
end