defmodule Math do
  def sum(a, b) do
    a + b
  end
  def sum(0), do: 0
  def sum(n), do: n + sum(n - 1)

end

#require Integer
#IO.puts(3 / 2) # => 1.5
#IO.puts(Integer.floor_div(3, 2)) # => 1

IO.puts(:math.pow(2,3)|> round)