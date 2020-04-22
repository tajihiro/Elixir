defmodule MapKeyEmptyCheck do
    def check(map) do
        val = Map.fetch!(map, :m)
        case val != "" do 
          true -> map
          false -> false
        end
    end
end

map = [%{m: "a", n: "aaa"}, %{m: "", n: "bbb"}, %{m: "c", n: "ccc"}] 

result = Enum.filter(map, fn(m)-> MapKeyEmptyCheck.check(m) end)

IO.inspect(result)

