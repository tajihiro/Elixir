stream = File.stream!("loaded1.csv")
lines = Enum.map(stream, fn(x)-> String.trim(x) end)
line = Enum.map(lines, fn(x)-> String.split(x,",") end)
members = Enum.map(line, fn([_,y,z])-> %{:num => String.to_integer(y), :name => z} end)
result = Enum.map(members, fn(%{:num => num, :name => name}) -> "#{num},#{name}\n" end )
File.write "load_member_result.txt", Enum.sort(result)

IO.inspect Enum.sort(result)
