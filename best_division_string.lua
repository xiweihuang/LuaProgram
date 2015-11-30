--[[
	对一段含有中文的字符串, 形如-->   科比[1:abc]乔丹   
	进行分割:    "科比"  "1:abc"  "乔丹"

	str测试用例:

	科比乔丹
	科比[1:abc]
	科比[1:abc]乔丹
	科比[1:abc]乔丹[2:def]

	[1:abc]
	[1:abc][2:def]
	[1:abc]科比
	[1:abc]科比[2:def]
	[1:abc]科比[2:def]乔丹
	[1:abc][2:def][3:ghi]

]]

local beginTime = os.clock()  -- 代码执行的开始时间，用于计算程序运行时间

local str = "[1:abc][2:def][3:ghi]"  -- 用于分割的测试字符串

local strArr = {}  -- 用于保存分割好的字符串数组
local beg = 1      -- 从字符串的beg位置开始往后面搜索

while true do
	local x, y = string.find(str, "%[.-%]", beg)  -- x, y 分别为找到[xxx]的左右中括号的位置

	local str1, str2 = nil, nil  -- 保存 非[]和[] 的字符串

	if not x or not y then
		if beg < #str then
			str1 = string.sub(str, beg, -1)
			strArr[#strArr+1] = str1
		end
		break
	end

	-- 非[]部分
	if x > beg then
		str1 = string.sub(str, beg, x-1)
		strArr[#strArr+1] = str1
	end

	-- []部分
	str2 = string.sub(str, x+1, y-1)
	strArr[#strArr+1] = str2

	beg = y + 1  -- 更新beg位置。再往后面找  
end

local endTime = os.clock()

print("need time = ", (endTime-beginTime)*1000)

for i=1,#strArr do
	print(strArr[i])
end
