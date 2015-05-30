t = {}

setmetatable(t, {__mode="k"})

key1 = { name = "key1" }
t[key1] = 1
key1 = nil

key2 = { name = "key2" }
t[key2] = 1
key2 = nil

collectgarbage()

for k,v in pairs(t) do
	print(k.name, v)
end

-- 已经添加到table中的key值是不会因此而被当做垃圾的。
-- 换句话说，key1本身已经是nil值，但它曾经所指向的内容依然存放在t中。key2也是一样的情况。

-- 这就是弱引用table的其中一种，给table添加__mode元方法，如果这个元方法的值包含了字符串”k”，就代表这个table的key都是弱引用的。
-- 一旦其他地方对于key值的引用取消了（设置为nil），那么，这个table里的这个字段也会被删除。
 
-- 通俗地说，因为t的key被设置为弱引用，所以，执行t[key1] = 1后，t中确实存在这个字段。
-- 随后，又执行了key1 = nil，此时，除了t本身以外，就没有任何地方对key1保持引用，所以t的key1字段也会被删除。

-- 对于弱引用table，其实有三种形式：
-- 1）key值弱引用，也就是刚刚说到的情况，只要其他地方没有对key值引用，那么，table自身的这个字段也会被删除。设置方法：setmetatable(t, {__mode = “k”});
-- 2）value值弱引用，情况类似，只要其他地方没有对value值引用，那么，table的这个value所在的字段也会被删除。设置方法：setmetatable(t, {__mode = “v”});
-- 3）key和value弱引用，规则一样，但是key和value都同时生效，任意一个起作用时都会导致table的字段被删除。设置方法：setmetatable(t, {__mode = “kv”});
 
-- 当然，这里所说的被删除，是指在Lua执行垃圾回收的时候，并不一定是立刻生效的。
-- 我们刚刚只是为了测试，而强制执行了垃圾回收。
