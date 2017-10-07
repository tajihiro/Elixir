defmodule MyList do
    def flatten([]), do: []
    def flatten([h|t])do
        flatten(h) ++ flatten(t)
    end
    def flatten(list), do: [list]
    # def hello(),do: IO.puts("Hello")
end

