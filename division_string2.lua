string.split = function(str)
	local arr = {}
	for i=1,#str do
		arr[#arr+1] = string.sub(str, i, i)
	end
	return arr
end

function findIdx(str, ch1, ch2)
	local tempArr = string.split(str)
	local pos1, pos2 = nil, nil
	for i=1,#tempArr do
		if tempArr[i] == ch1 then
			pos1 = i
		elseif tempArr[i] == ch2 then
			pos2 = i
		end
		if pos1 and pos2 then
			break
		end
	end
	return tempArr, pos1, pos2
end

function getStrByPos(tempArr, pos1, pos2)
	local tempStr = ""
	for i=pos1,pos2 do
		tempStr = tempStr .. tempArr[i]
	end
	return tempStr
end


function getSplitStr(str)
	local newStrArr = {}

	local function splitStr(str)
		local tempArr, pos1, pos2 = findIdx(str, "[", "]")

		local begPos = 1
		local maxPos = #tempArr

		if not pos1 or not pos2 then
			newStrArr[#newStrArr+1] = getStrByPos(tempArr, begPos, maxPos)
			return
		end

		local str1 = getStrByPos(tempArr, begPos, pos1-1)
		local str2 = getStrByPos(tempArr, pos1+1, pos2-1)

		if str1 ~= "" then
			newStrArr[#newStrArr+1] = str1
		end

		newStrArr[#newStrArr+1] = str2

		begPos = pos2 + 1
		local str3 = getStrByPos(tempArr, begPos, maxPos)

		splitStr(str3)
	end

	splitStr(str)

	return newStrArr
end

local beginTime = os.clock()

-- local str = "[1:vvv][2:vvv]abcd[3:vvv]ef"
local str = "[1:vvv][2:vvv]abcd[3:vvv]ef[1:vvv][2:vvv]abcd[3:vvv]ef[1:vvv][2:vvv]abcd[3:vvv]ef[1:vvv][2:vvv]abcd[3:vvv]ef[1:vvv][2:vvv]abcd[3:vvv]ef[1:vvv][2:vvv]abcd[3:vvv]ef[1:vvv][2:vvv]abcd[3:vvv]ef[1:vvv][2:vvv]abcd[3:vvv]ef[1:vvv][2:vvv]abcd[3:vvv]ef[1:vvv][2:vvv]abcd[3:vvv]ef"

local arr = getSplitStr(str)

local endTime = os.clock()

print("need time = ", (endTime-beginTime)*1000)

-- for i=1,#arr do
-- 	print(arr[i])
-- end









