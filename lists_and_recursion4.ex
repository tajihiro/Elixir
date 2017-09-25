defmodule ListsAndRecursion4 do
    def span(from, to) when from == to, do: [from]
    def span(from, to) when from <  to, do: [from | span(from + 1, to)]
#    def span(from, to) do
#        range = from .. to
#        Enum.to_list(range)
#    end  
end
