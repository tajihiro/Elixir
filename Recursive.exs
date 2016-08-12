defmodule Recursive do
    def print(list), do: _print(list, 0)
      defp _print([], x), do: x
      defp _print([head | tail], x), do: _print(tail, head+x)
end
