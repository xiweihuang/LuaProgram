-- local smartMan = {
-- 	name = "none",
-- 	money = 900000,
-- 	sayHello = function()
-- 		print("say hello to everyone...")
-- 	end
-- }

-- local t1 = {}

-- local mt = { 
-- 	__index = smartMan,
-- 	__newindex = function(table, key, value)
-- 		print(key .. "字段是不存在的，不要试图给它赋值！")
-- 	end
-- }
-- setmetatable(t1, mt)

-- t1.sayHello()

-- t1.sayHello = function() print("en") end

-- t1.sayHello()

-- ====================

-- 如果我们想监控table的赋值操作呢？
-- 对于不存在的字段，我们不需要被赋值呢？想要制作一个只读的table呢？

local smartMan = { name = "none" }
local other = { name = "大家好，我是很无辜的table" }

local t1 = {}

local mt = {
	__index = smartMan,
	__newindex = other
}

setmetatable(t1, mt)

print("other的名字，赋值前：" .. other.name)
t1.name = "小偷"
print("other的名字，赋值后：" .. other.name)
print("t1的名字：" .. t1.name)

-- 总结规则
-- 这就是__newindex的规则：
-- a.如果__newindex是一个函数，则在给table不存在的字段赋值时，会调用这个函数。
-- b.如果__newindex是一个table，则在给table不存在的字段赋值时，会直接给__newindex的table赋值。
-- 大家要记住这句话：__index用于查询，__newindex用于更新。

