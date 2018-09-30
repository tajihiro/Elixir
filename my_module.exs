defmodule MyModule do
  def hello() do
    IO.puts "Hello"
  end

  def for([], _), do: []
  def for([ head | tail ], param) do
    IO.puts to_string(head) <> ". " <> param
    MyModule.for(tail, param)
  end
end