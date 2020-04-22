defmodule Func do
    def func01( param ) do
        IO.inspect(param.a)
        IO.inspect(param.b)
        IO.inspect(param.c)
        IO.inspect(param.d)
    end
end

list = [1,2,3,4]

# list2 = Enum.filter(list, fn(l)-> l > 2 end)
# list2 = Enum.map(list, fn(l)-> l end)
list2 = Enum.zip([list, [5,6,7,8], [9,10,11,12], [13,14,15,16]])
map1 = Enum.map(list2, fn({a,b,c,d}) -> %{a: a, b: b, c: c, d: d} end)

# IO.inspect(map1)
Enum.map(map1, fn(x) -> Func.func01(x) end)

