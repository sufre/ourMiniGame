
require("config")
require("cocos.init")
require("framework.init")

import(".debug.myDebug")
import(".map.LogicMap")

isDebug = false

--test
if isDebug then
	print("sufre test start --------------------------------------------------")
	map = LogicMap.new(2, 2, 40)
	print_r(map)

	local a = 104.619
	local b = 104
	if a == math.ceil(a) then
		print("ok")
	else
		print("not ok")
	end
	print(math.ceil(a))
	print("sufre test end ----------------------------------------------------")
end
--test end

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end

function MyApp:run()
    cc.FileUtils:getInstance():addSearchPath("res/")
    self:enterScene("MainScene")
end

return MyApp