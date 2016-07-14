defmodule ElixirSample do
  def greet do
    IO.puts "こんにちは。たぢさん。"
  end
  def sum(0), do: 0
  def sum(n), do: n + sum(n - 1)
end
