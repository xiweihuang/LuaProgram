TSprite = {
	data = {},
	x = 20,
	y = 30
}
function TSprite:new(o)
	o = o or {}
	local mt = {}
	mt.__index = function(t, k)
		print("你要读一个值吗？")
		return TSprite[k]
	end
	mt.__newindex = function(t, k)
		print("你要赋值吗？", t, k)
	end
	setmetatable(o, mt)
	return o
end
function TSprite:push(val)
	self.data[1] = val
	-- self.x = val
end
-- local who1 = TSprite:new()
-- local who2 = TSprite:new()

-- print(who1.x, who1.y)

local who1 = TSprite:new()
who1:push(9)

-- print(who1.data[20])
-- print(TSprite.data[20])
-- print(who1.x)
-- print(TSprite.x)