defmodule SumRecursive do
    def sum(1), do: 1
    def sum(n), do: n + sum(n - 1) 
end

IO.puts SumRecursive.sum(1)

