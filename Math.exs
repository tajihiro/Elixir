defmodule Math do
  def sum(a, b) do
    a + b
  end
  def sum(0), do: 0
  def sum(n), do: n + sum(n - 1)
end
