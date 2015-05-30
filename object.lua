-- -- 点号和冒号
-- TSprite = { x=0, y=0 }

-- function TSprite:setPosition(x, y)
-- 	-- TSprite.x = x
-- 	-- TSprite.y = y
-- 	self.x = x
-- 	self.y = y
-- end

-- local who = TSprite
-- TSprite = nil
-- -- who.setPosition(who, 10, 20)
-- who:setPosition(10, 20)

-- print(who.x, who.y)

-- ========= 面向对象 ===========
-- TSprite = { x=0, y=0 }
-- function TSprite:setPosition(x, y)
-- 	self.x = x
-- 	self.y = y
-- end

-- -- function TSprite:new()
-- -- 	local o = {}
-- -- 	setmetatable(o, {__index = self})
-- -- 	return o
-- -- end
-- function TSprite:new()
-- 	local o = {}
-- 	setmetatable(o, self)
-- 	self.__index = self
-- 	return o
-- end


-- local who1 = TSprite:new()
-- local who2 = TSprite:new()
-- who1:setPosition(1, 2)
-- who2:setPosition(44, 6)

-- print(who1.x, who1.y)
-- print(who2.x, who2.y)



-- 不知道大家有没有这样一个疑惑，那就是，为什么who1和who2的x、y是不一样的，它们最终调用的不是setPosition函数么？调用self.x时最终不是调用了TSprite的x值么？
-- 这里是会有点混乱，理一理就没问题了：
-- 1). 当who1里不存在setPosition时，回去__index元方法里查找，于是，会找到TSprite的setPosition函数
-- 2). 在setPosition函数里，使用了self.x = x，此时的self就是who1，who1中是不存在x字段的，所以，如果我们要打印self.x的值，则其实是打印了TSprite的x值
-- 3). 但是，注意，但是来了。__index元方法是用于调用的，而不是用于赋值的，因此，self.x = x这句话，其实只是给who1这个table的x字段赋值了，who1本身不存在x字段，此时给它赋值了，于是who1存在了x字段，以后who1都不会再去TSprite里查找x字段了。
-- 4). 因此，对who1和who2的x、y字段进行赋值操作时，是完全不会影响到TSprite的。

-- ========= 继承 ===============
TSprite = { x = 0, y = 0 }
function TSprite:setPosition(x, y)
	self.x = x
	self.y = y
end

function TSprite:new(o)
	o = o or {}
	-- setmetatable(o, self)
	-- self.__index = self
	setmetatable(o, {__index = self})
	return o
end

local MoneySprite = TSprite:new()
function MoneySprite:setPosition(x, y)
	print("富二代...")
end

local who = MoneySprite:new()
who:setPosition(44, 6)
print(who.x, who.y)

























