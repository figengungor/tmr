local Tmr = require "Tmr"

local tmr = Tmr:new()

local W = display.contentWidth

tmr:init(W/2, 50, W, 100)
tmr:start(100, 2)