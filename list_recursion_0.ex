defmodule ListAndRecursion0 do
   def mapsum([], _fun), do: 0
   def mapsum([head | tail], fun), do: fun.(head) + mapsum(tail, fun)
end

IO.puts(ListAndRecursion0.mapsum([1,2,3,4], &(&1 * &1)))