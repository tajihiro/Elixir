defmodule Max do
    def max(a, b) do
        list = [a,b]
        _max(list, 0)
    end
    def max3(a, b, c) do
        list = [a,b,c]
        _max(list, 0)
    end
    def max_list(list) do
        _max(list, 0)
    end
    def max_native(list) do
        Enum.max(list)
    end

    #
    defp _max([], max), do: max 
    defp _max([head|tail], max) do
        if(head > max) do
            _max(tail,head)
        else
            _max(tail,max)
        end
    end
end