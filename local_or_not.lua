-- 在Lua中，要声明全局变量很简单，那就是定义变量的时候，前面不要加上local。
-- 这个神秘的全局变量，其实本质上也是一个table，它把我们创建的全局变量都保存到一个table里了。
-- 而这个table的名字是：_G

require("index_newindex")

gName = "全局哦"

print(gName)
print(_G["gName"])
print(_G.gName)
print("============")
print(gAge)
print(_G["gAge"])
print(_G.gAge)

-- ======================
-- 对于全局变量，不管到了哪个地方，哪种语言，大家总是会告诫说：“不要滥用，后果自负”
-- 也许是因为这样，所以Lua有了一种比较特殊的机制：非全局环境。
-- 我称它为“不会造成全局影响的全局变量”。