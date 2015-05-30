function search(classes, key)
	for i=1,#classes do
		local value = classes[i][key]
		if value then
			return value
		end
	end
end

-- local t1 = { name="hehe" }
-- local t2 = { game="who" }
-- print(search({t1, t2}, "game"))


function createClass(...)
	local parents = {...}
	local child = {}

	-- 设置类的元表
	local mt = {}
	mt.__index = function(table, key)
		return search(parents, key)
	end
	setmetatable(child, mt)

	function child:new(o)
		o = o or {}
		setmetatable(o, {__index=self})
		return o
	end

	return child
end

TSprite = {}
function TSprite:hello()
	print("谁跟你hello!")
end

function TSprite:new(o)
	o = o or {}
	setmetatable(o, {__index=self})
	return o
end

TBullet = {}
function TBullet:fire()
	print("别动，再动我就瞄不准了!")
end
function TBullet:new(o)
	o = o or {}
	setmetatable(o, {__index=self})
	return o
end

local BulletSprite = createClass(TSprite, TBullet)

local bSprite = BulletSprite:new()
bSprite:hello()
bSprite:fire()









