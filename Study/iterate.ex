defmodule Iterate do
    def loop(list) do
        Enum.each(list, fn(x)-> IO.puts x end)
    end
end