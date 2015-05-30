-- 分割形如 "ab[1:vvv]cd" 形式的字符串

-- 定义一个队列结构（或者栈结构）
local Link_List = {
	data = {},
	head = 0,  -- 指向第一个元素
	tail = 0   -- 指向最后一个元素的后一位
}
function Link_List:new(o)
	o = o or {}
	setmetatable(o, {__index=self})
	return o
end

function Link_List:push_back(val)
	self.data[self.tail] = val
	self.tail = self.tail + 1
end

function Link_List:pop_front()
	local val = self.data[self.head]
	self.data[self.head] = nil
	self.head = self.head + 1
	return val
end

function Link_List:isEmpty()
	return self.tail <= self.head
end

local list = Link_List:new()

-- 输入字符串
-- local str = "ab[1:vvv]cd"
local str = "[1:vvv][2:vvv]abcd[3:vvv]ef"

local arr = {}
for i=1,#str do
	arr[#arr+1] = string.sub(str, i, i)
end

local strArr = {}
for i=1,#arr+1 do
	local ch = arr[i]
	if ch == "[" or ch == "]" or i > #arr then
		-- 出队列
		local tempStr = ""
		while not list:isEmpty() do
			tempStr = tempStr .. list:pop_front()
		end
		if #tempStr > 0 then
			strArr[#strArr+1] = tempStr
		end
	else
		list:push_back(ch)
	end
end

for i=1,#strArr do
	print(strArr[i])
end

