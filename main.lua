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
SparkParticle = require("objects.spark_particle")
SetType(Particle, "particle")
SetType(SparkParticle, "particle")

function love.load()
    LogFont = love.graphics.newFont(20)
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.graphics.setLineStyle("rough")
    Font = love.graphics.newFont("assets/fonts/Galmuri9.ttf", 10)

    Res:init()
    Outline:init(1)
    SM:load("game")
end

function love.update(dt)
    dt = math.min(dt*60, 1.5)
    Input:update()
    SM:update(dt)
    Input:reset_wheel()
    Log:update(dt)
    UpdateAudio()
end

function love.draw()
    Res:before()
    SM:draw()
    Res:after()
    Log:draw()
    if CONSOLE then
        love.graphics.print(tostring(love.timer.getFPS()))
    end
end

function love.wheelmoved(dx, dy)
    Input:wheelmoved(dx, dy)
end

function love.resize(w, h)
    Res:resize(w, h)
end