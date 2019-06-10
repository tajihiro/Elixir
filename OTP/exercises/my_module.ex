defmodule MyModule do
  def sum(list), do: _sum(list, 0) 
  defp _sum([], result), do: result
  defp _sum([head|tail], result), do: _sum(tail, (head + result)) 
end
