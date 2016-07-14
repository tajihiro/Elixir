defmodule Hello do
  def hello do
    IO.puts "Hello Elixir!!!"
  end

  def hello(name) do
    IO.puts "Hello " <> name <> " !!!"
  end
end
