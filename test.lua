-- 多重继承
local function createByClasses(...)
	local parents = {...}
	local child = {}

	local mt = {}
	mt.__index = function(tab, key)
		for i=1,#parents do
			local val = parents[i][key]
			if val then
				return val
			end
		end
	end

	setmetatable(child, mt)

	function child:new(o)
		o = o or {}
		setmetatable(o, {__index=self})
		return o
	end

	return child
end

-- 科比，既是一位篮球运动员，也是一位足球爱好者
-- 篮球运动员
BasketballPlayer = {}
function BasketballPlayer:new(o)
	o = o or {}
	setmetatable(o, {__index=self})
	return o
end

function BasketballPlayer:shoot()
	print("投篮好准哦。。。")
end

-- 足球爱好者
FootballFan = {}
function FootballFan:new(o)
	o = o or {}
	setmetatable(o, {__index=self})
	return o
end

function FootballFan:suppot()
	print("加油加油科比加油。。。")
end

local Kobe = createByClasses(BasketballPlayer, FootballFan)
Kobe:shoot()
Kobe:suppot()

