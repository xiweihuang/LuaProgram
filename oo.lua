local _class={}  -- 一个大表，下标是不同类的类名
 
function class(super)
	local class_type={}  -- 返回的类（表）
	class_type.ctor=false
	class_type.super=super
	class_type.new=function(...)  -- new 方法
			local obj={}
			do
				local create
				create = function(c,...)
					if c.super then
						create(c.super,...)
					end
					if c.ctor then
						c.ctor(obj,...)
					end
				end
 
				create(class_type,...)
			end
			setmetatable(obj,{ __index=_class[class_type] })
			return obj
		end

	local vtbl={}
	_class[class_type]=vtbl
 
	setmetatable(class_type,{__newindex=         -- 对表不存在的字段进行赋值操作
		function(t,k,v)
			vtbl[k]=v
		end
	})
 
	if super then   -- 如果存在父类
		setmetatable(vtbl,{__index=
			function(t,k)
				local ret=_class[super][k]  -- 从父类
				vtbl[k]=ret
				return ret
			end
		})
	end
 
	return class_type
end

-- =============== 我的例子 ====================
TSprite = class()
function TSprite:ctor()
	self.data = {}
	self.x = 20
	self.y = 30
end
function TSprite:push(val)
	self.data[self.x] = val
end

-- who1 = class(TSprite)
who1 = TSprite.new()
-- function who1:ctor()

-- end
who1:push(9)

print(who1.data[20])
-- print(TSprite.data[20])


-- ============= cloud的例子 =================

-- base_type=class()		-- 定义一个基类 base_type
 
-- function base_type:ctor(x)	-- 定义 base_type 的构造函数
-- 	print("base_type ctor")
-- 	self.x=x
-- end
 
-- function base_type:print_x()	-- 定义一个成员函数 base_type:print_x
-- 	print(self.x)
-- end
 
-- function base_type:hello()	-- 定义另一个成员函数 base_type:hello
-- 	print("hello base_type")
-- end


-- test=class(base_type)	-- 定义一个类 test 继承于 base_type
 
-- function test:ctor()	-- 定义 test 的构造函数
-- 	print("test ctor")
-- end
 
-- function test:hello()	-- 重载 base_type:hello 为 test:hello
-- 	print("hello test")
-- end



-- a=test.new(1)	-- 输出两行，base_type ctor 和 test ctor 。这个对象被正确的构造了。
-- a:print_x()	-- 输出 1 ，这个是基类 base_type 中的成员函数。
-- a:hello()	-- 输出 hello test ，这个函数被重载了。 




