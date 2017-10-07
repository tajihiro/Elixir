defmodule Sum do
    def sum([], total), do: total
    def sum([ head | tail ], total \\ 0) do
        sum(tail, head + total)
    end
end