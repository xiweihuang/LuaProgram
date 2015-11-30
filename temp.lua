--[[
	\n科比\n乔丹\n
]]

local str = "abc\n\n"
-- local str = "abcd"


local arr = {}
for w in string.gmatch(str, "[^\n]*") do
	arr[#arr+1] = w
end

for i=1,#arr-1 do
	if arr[i] == "" then
		print("space")
	else
		print(arr[i])
	end
end


