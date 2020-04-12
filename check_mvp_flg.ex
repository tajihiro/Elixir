defmodule CheckMvpFlg do
    def check(id, map) do
        map_m = Map.get(map, :m)
        case map_m do
            ^id -> Map.put(map, :p, 1)
             _  -> Map.put(map, :p, 0)
        end
    end
end

mid = 2
m1 = %{m: 2, n: "TJ", p: ""}
m2 = %{m: 13, n: "OS", p: ""}
m3 = %{m: 22, n: "TK", p: ""}
result1 = CheckMvpFlg.check(mid, m1)
result2 = CheckMvpFlg.check(mid, m2)
result3 = CheckMvpFlg.check(mid, m3)

IO.inspect(result1)
IO.inspect(result2)
IO.inspect(result3)


