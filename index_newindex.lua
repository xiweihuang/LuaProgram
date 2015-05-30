local function readonly(t)
	local newT = {}
	local mt = {
		__index = t,
		__newindex = function(tab, key, value)
			print("不要修改")
		end
	}
	setmetatable(newT, mt)
	return newT
end

local days = readonly({"星期一", "星期二", "星期日"})
-- days[2] = "星期三哪去了？"
print(days[1])

gAge = 25