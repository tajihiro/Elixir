defmodule ListMax do
    def max(list), do: _max(list, 0) 
    defp _max([], max), do: max 
    defp _max([head | tail], max) do
        if head > max do
            result = head
        else
            result = max
        end
        _max(tail, result)
    end
    # defp _max([head | tail], max) when head > max do
    #     _max(tail, head)
    # end
    # defp _max([head | tail], max) when head < max do
    #     _max(tail, max)
    # end
end
