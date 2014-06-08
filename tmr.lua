-- Author: Figen Güngör
-- Year: 2014
-- Desc: A quick visual box timer for your games.
-- Usage: 
-- 		Require the module: Tmr = require "Tmr"
-- 		Create a new instance: tmr = Tmr:new()
-- 	   	Initialize the new instance, 
-- 	   		set position and dimension of the box : tmr:init(x, y, width, height)
-- 	   	Start timer, 
-- 	   		set decrease amount per time(in ms): tmr:start(time, decNo)
-- 	   	Stop timer: tmr:stop()
-- 	   	Stop and remove timer: tmr:remove() 

Tmr={}

function Tmr:new()
	local tmr={}
	tmr.view = display.newGroup()

	function tmr:init(x, y, width, height)
		local bg = display.newRect(x, y, width, height)
		tmr.bg = bg
		tmr.view:insert(bg)

		local cover = display.newRect(0, y, width, height)
		tmr.cover = cover
		tmr.view:insert(cover)
		cover:setFillColor(0,1,0)
		cover.anchorX = 0

		local txt = display.newText("Timer", x, y, nil, 50)
		tmr.txt = txt
		tmr.view:insert(txt)
		txt:setFillColor(0,0,0)		
	end

	function tmr:start(time, decNo)
		
		self.realTmr = timer.performWithDelay(time, 
			function()
				 
				if( tmr.cover.width-decNo<=0) then
					timer.cancel(self.realTmr)
					tmr.cover.alpha=0
					tmr.txt.text = "Time is Up!"
				else
					tmr.cover.width = tmr.cover.width-decNo
				end 
			end, 0)
	end

	function tmr:remove()
		if(self.realTmr) then timer.cancel(self.realTmr) end
		self.realTmr = nil
		self.view:removeSelf()
	end

	function tmr:stop()
		if(self.realTmr) then timer.cancel(self.realTmr) end
		self.realTmr = nil
	end

	return tmr
end

return Tmr