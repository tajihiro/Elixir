# List からの値取り出し
list = [1,2,3,4]

IO.inspect(Enum.at(list, 0))
IO.inspect(Enum.at(list, 1))

# Map からの値取り出し
map = %{a: 1, b: 2, c: 3, d: 4}

IO.inspect(Map.get(map, :a))
IO.inspect(Map.get(map, :b))

# Tuple からの値取り出し
tuple = {1, 2, 3, 4}

IO.inspect(elem(tuple, 0))
IO.inspect(elem(tuple, 1))

